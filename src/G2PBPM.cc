// This file defines a class G2PBPM.
// This class is a tool class.
// G2PProcBase classes will call GetBPMValue() to get bpm readouts.
// The BPM values are in a special coords, TransBPM2Lab() will transform it to
//+lab coords
//
// History:
//   Mar 2013, C. Gu, First public version.
//

#include <cstdio>
#include <cstdlib>
#include <cmath>

#include "TROOT.h"
#include "TObject.h"
#include "TError.h"

#include "G2PAppBase.hh"
#include "G2PBPMTrans.hh"
#include "G2PDrift.hh"
#include "G2PFieldBase.hh"    
#include "G2PGlobals.hh"
#include "G2PRand.hh"
#include "G2PRunBase.hh"

#include "G2PBPM.hh"

G2PBPM* G2PBPM::pG2PBPM = NULL;

G2PBPM::G2PBPM() :
    fBeamEnergy(2.254), fFieldRatio(0.0), fBPMAX(0.0), fBPMAY(0.0),
    fBPMBX(0.0), fBPMBY(0.0), fBPMAZ(-956.0e-3), fBPMBZ(-692.0e-3),
    fBPMARes(0.3e-3), fBPMBRes(0.3e-3), pDrift(NULL),
    pfGetBPMValue(NULL)
{
    if (pG2PBPM) {
        Error("G2PBPM()", "Only one instance of G2PBPM allowed.");
        MakeZombie();
        return;
    }
    pG2PBPM = this;
}

G2PBPM::~G2PBPM()
{
    if (pG2PBPM==this) pG2PBPM = NULL;
}

int G2PBPM::Init()
{
    //static const char* const here = "Init()";

    if (G2PAppBase::Init()!=0) return fStatus;

    pDrift = G2PDrift::GetInstance();
    if (!pDrift) {
        pDrift = new G2PDrift();
        gG2PApps->Add(pDrift);
    }

    return (fStatus = kOK);
}

int G2PBPM::Begin()
{
    //static const char* const here = "Begin()";

    if (G2PAppBase::Begin()!=0) return fStatus;

    fBeamEnergy = gG2PRun->GetBeamEnergy();
    G2PFieldBase* field = G2PFieldBase::GetInstance();
    if (field==NULL) fFieldRatio = 0;
    else fFieldRatio = field->GetRatio();

    SetBPM();

    return (fStatus = kOK);
}

void G2PBPM::GetBPMValue(const double* V5beam_lab, double* V5bpm_bpm)
{
    static const char* const here = "GetBPMValue()";

    (this->*pfGetBPMValue)(V5beam_lab, V5bpm_bpm);

    if (fDebug>2) Info(here, "%10.3e %10.3e %10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e %10.3e %10.3e", V5beam_lab[0], V5beam_lab[1], V5beam_lab[2], V5beam_lab[3], V5beam_lab[4], V5bpm_bpm[0], V5bpm_bpm[1], V5bpm_bpm[2], V5bpm_bpm[3], V5bpm_bpm[4]);
}

void G2PBPM::TransBPM2Lab(const double* V5_bpm, double* V5_lab)
{
    static const char* const here = "TransBPM2Lab()";

    V5_lab[0] = V5_bpm[0];
    V5_lab[2] = V5_bpm[2];
    V5_lab[4] = V5_bpm[4];

    double p[3] = { tan(V5_bpm[3]), tan(V5_bpm[1]), 1.0 };
    double pp = sqrt(p[0]*p[0]+p[1]*p[1]+p[2]*p[2]);
    V5_lab[1] = acos(1.0/pp);
    V5_lab[3] = atan2(p[1], p[0]);

    if (fDebug>3) Info(here, "%10.3e %10.3e %10.3e %10.3e -> %10.3e %10.3e %10.3e %10.3e", V5_bpm[0], V5_bpm[1], V5_bpm[2], V5_bpm[3], V5_lab[0], V5_lab[1], V5_lab[2], V5_lab[3]);
}

void G2PBPM::SetBPM()
{
    static const char* const here = "SetBPM()";

    int orbit;
    if (fabs(fFieldRatio-0.5)<1e-8) {
        if (fabs(fBeamEnergy-2.254)<0.2) {
            fBPMAX = 0.743197468425e-3;
            fBPMAY = -97.9439291505e-3;
            fBPMAZ = -940.46966234e-3;
            fBPMBX = 1.04489437383e-3;
            fBPMBY = -69.5218412795e-3;
            fBPMBZ = -676.469580767e-3;
            pfGetBPMValue = &G2PBPM::GetBPMValue5;
            orbit = 5;
        }
        else if (fabs(fBeamEnergy-1.706)<0.2) {
            fBPMAX = 0.334417934854e-3;
            fBPMAY = -130.742151697e-3;
            fBPMAZ = -943.969646821e-3;
            fBPMBX = 0.436195607141e-3;
            fBPMBY = -93.1201715402e-3;
            fBPMBZ = -681.069555637e-3;
            pfGetBPMValue = &G2PBPM::GetBPMValue4;
            orbit = 4;
        }
        else if (fabs(fBeamEnergy-1.159)<0.2) {
            fBPMAX = 1.04109622687e-3;
            fBPMAY = -196.201718795e-3;
            fBPMAZ = -948.669889999e-3;
            fBPMBX = 1.24268316845e-3;
            fBPMBY = -143.579627734e-3;
            fBPMBZ = -688.370604604e-3;
            pfGetBPMValue = &G2PBPM::GetBPMValue1;
            orbit = 1;
        }
        else {
            pfGetBPMValue = &G2PBPM::GetBPMValue0;
            orbit = 0;
        }
    }
    else if (fabs(fFieldRatio-1.0)<1e-8) {
        if (fabs(fBeamEnergy-2.254)<0.2) {
            fBPMAX = 0.138592400799e-3;
            fBPMAY = -79.962134626e-3;
            fBPMAZ = -939.76959472e-3;
            fBPMBX = 0.442605162088e-3;
            fBPMBY = -55.6342835205e-3;
            fBPMBZ = -675.269596904e-3;
            pfGetBPMValue = &G2PBPM::GetBPMValue7;
            orbit = 7;
        }
        else if (fabs(fBeamEnergy-3.355)<0.2) {
            fBPMAX = 0.0609719900963e-3;
            fBPMAY = -53.5499078644e-3;
            fBPMAZ = -939.169701771e-3;
            fBPMBX = 0.662453421257e-3;
            fBPMBY = -37.0276045709e-3;
            fBPMBZ = -674.16965108e-3;
            pfGetBPMValue = &G2PBPM::GetBPMValue9;
            orbit = 9;
        }
        else {
            pfGetBPMValue = &G2PBPM::GetBPMValue0;
            orbit = 0;
        }
    }
    else {
        pfGetBPMValue = &G2PBPM::GetBPMValue0;
        orbit = 0;
    }

    if (fDebug>0) Info(here, "Using orbit %d.", orbit);
}

void G2PBPM::GetBPMValue0(const double* V5beam_lab, double* V5bpm_bpm)
{
    double x[3] = { V5beam_lab[0], V5beam_lab[2], V5beam_lab[4] };
    double p[3] = { fBeamEnergy*sin(V5beam_lab[1])*cos(V5beam_lab[3]),
                    fBeamEnergy*sin(V5beam_lab[1])*sin(V5beam_lab[3]),
                    fBeamEnergy*cos(V5beam_lab[1]) };

    pDrift->Drift(x, p, fBPMAZ, 10.0, x, p);
    double res = fBPMBRes/(fBPMBZ-fBPMAZ);
    // here theta phi are special coords defined by Pengjia
    // theta is dy/dz in hall coords
    // phi is dx/dz in hall coords
    double theta = pRand->Gaus(atan2(p[1], p[2]), res);
    double phi = pRand->Gaus(atan2(p[0], p[2]), res);
    p[1] = p[2]*tan(theta);
    p[0] = p[2]*tan(phi);
    double normF = fBeamEnergy/sqrt(p[0]*p[0]+p[1]*p[1]+p[2]*p[2]);
    p[0] *= normF; p[1] *= normF; p[2] *= normF;
    x[0] = pRand->Gaus(x[0], fBPMARes);
    x[1] = pRand->Gaus(x[1], fBPMARes);
    pDrift->Drift(x, p, 0.0, 10.0, x, p);
    V5bpm_bpm[0] = x[0];
    V5bpm_bpm[1] = atan2(p[1], p[2]);
    V5bpm_bpm[2] = x[1];
    V5bpm_bpm[3] = atan2(p[0], p[2]);
    V5bpm_bpm[4] = x[2];
}

void G2PBPM::GetBPMValue1(const double* V5beam_lab, double* V5bpm_bpm)
{
    using namespace Orbit1;

    float x[4];

    GetBPMAB(V5beam_lab, x);

    V5bpm_bpm[0] = target_x(x, 4)*1e-3;
    V5bpm_bpm[1] = target_theta(x, 4)*1e-3;
    V5bpm_bpm[2] = target_y(x, 4)*1e-3;
    V5bpm_bpm[3] = target_phi(x, 4)*1e-3;
    V5bpm_bpm[4] = 0.0;
}

void G2PBPM::GetBPMValue4(const double* V5beam_lab, double* V5bpm_bpm)
{
    using namespace Orbit4;

    float x[4];

    GetBPMAB(V5beam_lab, x);

    V5bpm_bpm[0] = target_x(x, 4)*1e-3;
    V5bpm_bpm[1] = target_theta(x, 4)*1e-3;
    V5bpm_bpm[2] = target_y(x, 4)*1e-3;
    V5bpm_bpm[3] = target_phi(x, 4)*1e-3;
    V5bpm_bpm[4] = 0.0;
}

void G2PBPM::GetBPMValue5(const double* V5beam_lab, double* V5bpm_bpm)
{
    using namespace Orbit5;

    float x[4];

    GetBPMAB(V5beam_lab, x);

    V5bpm_bpm[0] = target_x(x, 4)*1e-3;
    V5bpm_bpm[1] = target_theta(x, 4)*1e-3;
    V5bpm_bpm[2] = target_y(x, 4)*1e-3;
    V5bpm_bpm[3] = target_phi(x, 4)*1e-3;
    V5bpm_bpm[4] = 0.0;
}

void G2PBPM::GetBPMValue7(const double* V5beam_lab, double* V5bpm_bpm)
{
    using namespace Orbit7;

    float x[4];

    GetBPMAB(V5beam_lab, x);

    V5bpm_bpm[0] = target_x(x, 4)*1e-3;
    V5bpm_bpm[1] = target_theta(x, 4)*1e-3;
    V5bpm_bpm[2] = target_y(x, 4)*1e-3;
    V5bpm_bpm[3] = target_phi(x, 4)*1e-3;
    V5bpm_bpm[4] = 0.0;
}

void G2PBPM::GetBPMValue9(const double* V5beam_lab, double* V5bpm_bpm)
{
    using namespace Orbit9;

    float x[4];

    GetBPMAB(V5beam_lab, x);

    V5bpm_bpm[0] = target_x(x, 4)*1e-3;
    V5bpm_bpm[1] = target_theta(x, 4)*1e-3;
    V5bpm_bpm[2] = target_y(x, 4)*1e-3;
    V5bpm_bpm[3] = target_phi(x, 4)*1e-3;
    V5bpm_bpm[4] = 0.0;
}

void G2PBPM::GetBPMAB(const double* V5beam_lab, float* xout)
{
    double x[3] = { V5beam_lab[0], V5beam_lab[2], V5beam_lab[4] };
    double p[3] = { fBeamEnergy*sin(V5beam_lab[1])*cos(V5beam_lab[3]),
                    fBeamEnergy*sin(V5beam_lab[1])*sin(V5beam_lab[3]),
                    fBeamEnergy*cos(V5beam_lab[1]) };

    pDrift->Drift(x, p, fBPMBZ, 10.0, x, p);
    xout[2] = pRand->Gaus(x[0]-fBPMBX, fBPMBRes)*1e3;
    xout[3] = pRand->Gaus(x[1]-fBPMBY, fBPMBRes)*1e3;
    pDrift->Drift(x, p, fBPMAZ, 10.0, x, p);
    xout[0] = pRand->Gaus(x[0]-fBPMAX, fBPMARes)*1e3;
    xout[1] = pRand->Gaus(x[1]-fBPMAY, fBPMARes)*1e3;
}

ClassImp(G2PBPM)