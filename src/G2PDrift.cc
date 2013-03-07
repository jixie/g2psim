#include <cstdlib>
#include <cmath>

#include "TROOT.h"
#include "TObject.h"
#include "TError.h"

#include "G2PAppsBase.hh"
#include "G2PFieldBase.hh"
#include "G2PGlobals.hh"
#include "G2PRunBase.hh"

#include "G2PDrift.hh"

static const double c = 2.99792458e8;
static const double e = 1.60217656535e-19;
static const double kDEG = 3.14159265358979323846/180.0;
static const double kGEV = 1.0e9*e/c/c;
static const double kOneSixth = 1.0/6.0;

G2PDrift* G2PDrift::pG2PDrift = NULL;

G2PDrift::G2PDrift() :
    fM0(0.51099892811e-3), fQ(-1*e), fQsave(-1*e),
    fStep(1.0e-3), fStepLimit(1.0e-6),
    fVelocity(0.0), fVelocity2(0.0), fGamma(0.0), fCof(0.0),
    pField(NULL)
{
    if (pG2PDrift) {
        Error("G2PDrift()", "Only one instance of G2PDrift allowed.");
        MakeZombie();
        return;
    }
    pG2PDrift = this;

    memset(fField, 0, sizeof(fField));
    memset(fIPoint, 0, sizeof(fIPoint));
    memset(fMPoint, 0, sizeof(fMPoint));
    memset(fEPoint, 0, sizeof(fEPoint));
}

G2PDrift::~G2PDrift()
{
    if (pG2PDrift==this) pG2PDrift = NULL;
}

G2PAppsBase::EStatus G2PDrift::Init()
{
    static const char* const here = "Init()";

    if (G2PAppsBase::Init()) return fStatus;

    if (pField) {
        if (!pField->IsInit()) {
            if (pField->Init()) {
                Error(here, "Cannot initialize.");
                return (fStatus = kINITERROR);
            }
        }
        pfDriftHCS = &G2PDrift::DriftHCS;
        pfDriftTCS = &G2PDrift::DriftTCS;
    }
    else {
        pfDriftHCS = &G2PDrift::DriftHCSNF;
        pfDriftTCS = &G2PDrift::DriftTCSNF;
    }

    fQ = gG2PRun->GetParticleCharge(); fQsave = fQ;
    fM0 = gG2PRun->GetParticleMass();

    return (fStatus = kOK);
}

int G2PDrift::RegisterModel()
{
    pField = G2PFieldBase::GetInstance();

    return 0;
}

void G2PDrift::DriftHCS(const double* x, const double* p, double zlimit, double llimit, double *xout, double *pout)
{
    static const char* const here = "Drift()";

    double xi[6] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };
    double xf[6] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

    double M = sqrt(fM0*fM0+p[0]*p[0]+p[1]*p[1]+p[2]*p[2]);

    double v[3] = { p[0]*c/M, p[1]*c/M, p[2]*c/M };
    fVelocity2 = v[0]*v[0]+v[1]*v[1]+v[2]*v[2];
    fVelocity = sqrt(fVelocity2);
    fGamma = 1/sqrt(1-(fVelocity2/c/c));

    xi[0] = x[0]; xi[1] = x[1]; xi[2] = x[2];
    xi[3] = v[0]; xi[4] = v[1]; xi[5] = v[2];

    bool sign = ((x[2]<zlimit)^(p[2]<0))?false:true;
    if (sign) {
        xi[3] *= -1.0;
        xi[4] *= -1.0;
        xi[5] *= -1.0;
        fQ = -1.0*fQsave;
    }

    double dxdt[6], err[6];
    double dt = fStep/fVelocity;
    double error;
    double l = 0.0;
    for (int i = 0; i<6; i++) xf[i] = xi[i];
    while (l<llimit) {
        if (error>fStepLimit/10.0) dt/=2.0;
        else for (int i = 0; i<6; i++) xi[i] = xf[i];
        ComputeRHS(xi, dxdt);
        if (fDebug>3) {
            Info(here, "   x: %10.3e %10.3e %10.3e %10.3e %10.3e %10.3e", xi[0], xi[1], xi[2], xi[3], xi[4], xi[5]);
            Info(here, "dxdt: %10.3e %10.3e %10.3e %10.3e %10.3e %10.3e", dxdt[0], dxdt[1], dxdt[2], dxdt[3], dxdt[4], dxdt[5]);
        }
        NystromRK4(xi, dxdt, dt, xf, err);
        error = DistChord();
        if ((xf[2]>zlimit)^(p[2]<0)^(sign)) break;
        l+=fVelocity*dt;
    }

    if (l<llimit) {
        double dtlimit = fStepLimit/fVelocity;
        while (dt>dtlimit) {
            if ((xf[2]>zlimit)^(p[2]<0)^(sign)) {
                dt/=2.0;
            }
            else {
                for (int i = 0; i<6; i++) xi[i] = xf[i];
            }
            ComputeRHS(xi, dxdt);
            NystromRK4(xi, dxdt, dt, xf, err);
        }
    }
        
    if (sign) {
        xf[3] *= -1.0;
        xf[4] *= -1.0;
        xf[5] *= -1.0;
        fQ = fQsave;
    }

    if (fDebug>2) {
        Info(here, "%10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e", x[0], x[1], x[2], xf[0], xf[1], xf[2]);
        Info(here, "%10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e", p[0], p[1], p[2], xf[3]*M/c, xf[4]*M/c, xf[5]*M/c);
    }

    xout[0] = xf[0]; xout[1] = xf[1]; xout[2] = xf[2];
    pout[0] = xf[3]*M/c; pout[1] = xf[4]*M/c; pout[2] = xf[5]*M/c;
}

void G2PDrift::DriftHCSNF(const double* x, const double* p, double zlimit, double llimit, double *xout, double *pout)
{
    static const char* const here = "Drift()";

    double xx[3] = { x[0], x[1], x[2] };
    double pp[3] = { p[0], p[1], p[2] };

    xout[0] = xx[0]+(zlimit-xx[2])*pp[0]/pp[2];
    xout[1] = xx[1]+(zlimit-xx[2])*pp[1]/pp[2];
    xout[2] = zlimit;

    pout[0] = pp[0]; pout[1] = pp[1]; pout[2] = pp[2];

    if (fDebug>2) {
        Info(here, "%10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e", xx[0], xx[1], xx[2], xout[0], xout[1], xout[2]);
        Info(here, "%10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e", pp[0], pp[1], pp[2], pout[0], pout[1], pout[2]);
    }
}
 
void G2PDrift::DriftTCS(const double* x, double p, double z_tr, double angle, double zlimit, double llimit, double* xout)
{
    static const char* const here = "Drift()";

    double xx[5] = { x[0], x[1], x[2], x[3], x[4] };

    double xi[6] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };
    double xf[6] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

    double sinang = sin(angle);
    double cosang = cos(angle);
 
    TCS2HCS(x[0], x[2], z_tr, angle, xi[0], xi[1], xi[2]);
    double theta, phi;
    TCS2HCS(x[1], x[3], angle, theta, phi);
 
    double pp = (1+x[4])*p;
    xi[3] = pp*sin(theta)*cos(phi);
    xi[4] = pp*sin(theta)*sin(phi);
    xi[5] = pp*cos(theta);
    double M = sqrt(fM0*fM0+pp*pp);
    xi[3] *= c/M; xi[4] *= c/M; xi[5] *= c/M;
    fVelocity2 = xi[3]*xi[3]+xi[4]*xi[4]+xi[5]*xi[5];
    fVelocity = sqrt(fVelocity2);
    fGamma = 1/sqrt(1-(fVelocity2/c/c));

    bool sign = (x[2]<zlimit)?false:true;
    if (sign) {
        xi[3] *= -1.0;
        xi[4] *= -1.0;
        xi[5] *= -1.0;
        fQ = -1.0*fQsave;
    }

    double dxdt[6], err[6];
    double error;
    double dt = fStep/fVelocity;
    double l = 0.0;
    for (int i = 0; i<6; i++) xf[i] = xi[i]; 
    double newz_tr = z_tr;
    while (l<llimit) {
        if (error>fStepLimit/10.0) dt/=2.0;
        else for (int i = 0; i<6; i++) xi[i] = xf[i];
        ComputeRHS(xi, dxdt);
        if (fDebug>3) {
            Info(here, "   x: %10.3e %10.3e %10.3e %10.3e %10.3e %10.3e", xi[0], xi[1], xi[2], xi[3], xi[4], xi[5]);
            Info(here, "dxdt: %10.3e %10.3e %10.3e %10.3e %10.3e %10.3e", dxdt[0], dxdt[1], dxdt[2], dxdt[3], dxdt[4], dxdt[5]);
        }
        NystromRK4(xi, dxdt, dt, xf, err);
        error = DistChord();
        newz_tr = xf[0]*sinang+xf[2]*cosang;
        if ((newz_tr>zlimit)^(sign)) break;
        l+=fVelocity*dt;
    }

    if (l<llimit) {
        double dtlimit = fStepLimit/fVelocity;
        while (dt>dtlimit) {
            if ((xf[2]>zlimit)^(sign)) {
                dt/=2.0;
            }
            else {
                for (int i = 0; i<6; i++) xi[i] = xf[i];
            }
            ComputeRHS(xi, dxdt);
            NystromRK4(xi, dxdt, dt, xf, err);
        }
    }

    if (sign) {
        xf[3] *= -1.0;
        xf[4] *= -1.0;
        xf[5] *= -1.0;
        fQ = fQsave;
    }

    theta = acos(xf[5]/fVelocity);
    phi = atan2(xf[4], xf[3]);
 
    HCS2TCS(theta, phi, angle, xout[1], xout[3]);
    double temp;
    HCS2TCS(xf[0], xf[1], xf[2], angle, xout[0], xout[2], temp);
    xout[4] = x[4];

    if (fDebug>2) {
        Info(here, "%10.3e %10.3e %10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e %10.3e %10.3e", xx[0], xx[1], xx[2], xx[3], xx[4], xout[0], xout[1], xout[2], xout[3], xout[4]);
    }
}

void G2PDrift::DriftTCSNF(const double* x, double p, double z_tr, double angle, double zlimit, double llimit, double* xout)
{
    static const char* const here = "Drift()";

    double xx[5] = { x[0], x[1], x[2], x[3], x[4] };

    xout[0] = x[0]+(zlimit-z_tr)*tan(x[1]);
    xout[1] = x[1];
    xout[2] = x[2]+(zlimit-z_tr)*tan(x[3]);
    xout[3] = x[3];
    xout[4] = x[4];

    if (fDebug>2) {
        Info(here, "%10.3e %10.3e %10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e %10.3e %10.3e", xx[0], xx[1], xx[2], xx[3], xx[4], xout[0], xout[1], xout[2], xout[3], xout[4]);
    }
}

void G2PDrift::NystromRK4(const double* x, const double* dxdt, double step, double* xo, double* err)
{
    // Using Nystrom-Runge-Kutta method to solve the motion equation of the
    // electron in static magnetic field numerically
    double S = step;
    double S5 = step*0.5;
    double S4 = step*0.25;
    double S6 = step*kOneSixth;
 
    double R[3] = { x[0], x[1], x[2] };
    double A[3] = { dxdt[0], dxdt[1], dxdt[2] };
 
    fIPoint[0] = R[0];
    fIPoint[1] = R[1];
    fIPoint[2] = R[2];
 
    // Point 1
    double K1[3] = { dxdt[3], dxdt[4], dxdt[5] };
 
    // Point 2
    double p[3] = { R[0]+S5*(A[0]+S4*K1[0]),
                    R[1]+S5*(A[1]+S4*K1[1]),
                    R[2]+S5*(A[2]+S4*K1[2])};

    pField->GetField(p, fField);
 
    double A2[3] = { A[0]+S5*K1[0], A[1]+S5*K1[1], A[2]+S5*K1[2] };
    double K2[3] = { (A2[1]*fField[2]-A2[2]*fField[1])*fCof,
                     (A2[2]*fField[0]-A2[0]*fField[2])*fCof,
                     (A2[0]*fField[1]-A2[1]*fField[0])*fCof};
 
    fMPoint[0] = p[0];
    fMPoint[1] = p[1];
    fMPoint[2] = p[2];
 
    // Point 3
    double A3[3] = { A[0]+S5*K2[0], A[1]+S5*K2[1], A[2]+S5*K2[2] };
    double K3[3] = { (A3[1]*fField[2]-A3[2]*fField[1])*fCof,
                     (A3[2]*fField[0]-A3[0]*fField[2])*fCof,
                     (A3[0]*fField[1]-A3[1]*fField[0])*fCof};
 
    // Point 4
    p[0] = R[0]+S*(A[0]+S5*K3[0]);
    p[1] = R[1]+S*(A[1]+S5*K3[1]);
    p[2] = R[2]+S*(A[2]+S5*K3[2]);

    pField->GetField(p, fField);
 
    double A4[3] = { A[0]+S*K3[0], A[1]+S*K3[1], A[2]+S*K3[2] };
    double K4[3] = { (A4[1]*fField[2]-A4[2]*fField[1])*fCof,
                     (A4[2]*fField[0]-A4[0]*fField[2])*fCof,
                     (A4[0]*fField[1]-A4[1]*fField[0])*fCof};
 
    // New position
    xo[0] = R[0]+S*(A[0]+S6*(K1[0]+K2[0]+K3[0]));
    xo[1] = R[1]+S*(A[1]+S6*(K1[1]+K2[1]+K3[1]));
    xo[2] = R[2]+S*(A[2]+S6*(K1[2]+K2[2]+K3[2]));
 
    fEPoint[0] = xo[0];
    fEPoint[1] = xo[1];
    fEPoint[2] = xo[2];
 
    // New direction
    xo[3] = A[0]+S6*(K1[0]+K4[0]+2.*(K2[0]+K3[0]));
    xo[4] = A[1]+S6*(K1[1]+K4[1]+2.*(K2[1]+K3[1]));
    xo[5] = A[2]+S6*(K1[2]+K4[2]+2.*(K2[2]+K3[2]));
 
    // Errors
    err[3] = S*fabs(K1[0]-K2[0]-K3[0]+K4[0]);
    err[4] = S*fabs(K1[1]-K2[1]-K3[1]+K4[1]);
    err[5] = S*fabs(K1[2]-K2[2]-K3[2]+K4[2]);
    err[0] = S*err[3];
    err[1] = S*err[4];
    err[2] = S*err[5];
 
    double normF = sqrt(fVelocity2/(xo[3]*xo[3]+xo[4]*xo[4]+xo[5]*xo[5]));
    xo[3]*=normF;
    xo[4]*=normF;
    xo[5]*=normF;
}
 
double G2PDrift::DistChord()
{
    // Calculate the deviation of the trajectory
    double ax = fEPoint[0]-fIPoint[0];
    double ay = fEPoint[1]-fIPoint[1];
    double az = fEPoint[2]-fIPoint[2];
    double dx = fMPoint[0]-fIPoint[0];
    double dy = fMPoint[1]-fIPoint[1];
    double dz = fMPoint[2]-fIPoint[2];
    double d2 = ax*ax+ay*ay+az*az;
 
    if (d2!=0.) {
        double s = (ax*dx+ay*dy+az*dz)/d2;
        dx-=(s*ax);
        dy-=(s*ay);
        dz-=(s*az);
    }
 
    return sqrt(dx*dx+dy*dy+dz*dz);
}
 
void G2PDrift::ComputeRHS(const double* x, double* dxdt)
{
    // Calculate the right hand side of the motion equation
    pField->GetField(x, fField);

    double M = fM0*fGamma*kGEV;
    dxdt[0] = x[3];
    dxdt[1] = x[4];
    dxdt[2] = x[5];
    fCof = fQ/M;
    dxdt[3] = (x[4]*fField[2]-fField[1]*x[5])*fCof;
    dxdt[4] = (x[5]*fField[0]-fField[2]*x[3])*fCof;
    dxdt[5] = (x[3]*fField[1]-fField[0]*x[4])*fCof;
}

ClassImp(G2PDrift)
