// -*- C++ -*-

/* class G2PVar
 * Global variables in the simulation.
 * It can be used to retrieve data from an object.
 */

// History:
//   Apr 2013, C. Gu, First public version.
//

#ifndef G2P_VAR_H
#define G2P_VAR_H

#include "TNamed.h"

#include "G2PVarDef.hh"

class G2PVar : public TNamed {
public:
    G2PVar();
    G2PVar(const G2PVar& rhs);
    G2PVar& operator=(const G2PVar&);
    virtual ~G2PVar();

    // Constructors by type

    G2PVar(const char* name, const char* descript, const bool* var) :
    TNamed(name, descript), fValueB(var), fType(kBOOL) { }

    G2PVar(const char* name, const char* descript, const char* var) :
    TNamed(name, descript), fValueC(var), fType(kCHAR) { }

    G2PVar(const char* name, const char* descript, const int* var) :
    TNamed(name, descript), fValueI(var), fType(kINT) { }

    G2PVar(const char* name, const char* descript, const short* var) :
    TNamed(name, descript), fValueS(var), fType(kSHORT) { }

    G2PVar(const char* name, const char* descript, const long* var) :
    TNamed(name, descript), fValueL(var), fType(kLONG) { }

    G2PVar(const char* name, const char* descript, const float* var) :
    TNamed(name, descript), fValueF(var), fType(kFLOAT) { }

    G2PVar(const char* name, const char* descript, const double* var) :
    TNamed(name, descript), fValueD(var), fType(kDOUBLE) { }

    // Gets
    VarType GetType() const;
    const char* GetTypeName() const;
    int GetTypeSize() const;
    double GetValue() const;

    // Sets
    void SetVar(const bool& var);
    void SetVar(const char& var);
    void SetVar(const int& var);
    void SetVar(const short& var);
    void SetVar(const long& var);
    void SetVar(const float& var);
    void SetVar(const double& var);

protected:

    union {
        const bool* fValueB;
        const char* fValueC;
        const int* fValueI;
        const short* fValueS;
        const long* fValueL;
        const float* fValueF;
        const double* fValueD;
    };

    VarType fType;

private:
    ClassDef(G2PVar, 0)
};

// inline functions

inline VarType G2PVar::GetType() const {
    return fType;
}

inline void G2PVar::SetVar(const bool& var) {
    fValueB = &var;
    fType = kBOOL;
}

inline void G2PVar::SetVar(const char& var) {
    fValueC = &var;
    fType = kCHAR;
}

inline void G2PVar::SetVar(const int& var) {
    fValueI = &var;
    fType = kINT;
}

inline void G2PVar::SetVar(const short& var) {
    fValueS = &var;
    fType = kSHORT;
}

inline void G2PVar::SetVar(const long& var) {
    fValueL = &var;
    fType = kLONG;
}

inline void G2PVar::SetVar(const float& var) {
    fValueF = &var;
    fType = kFLOAT;
}

inline void G2PVar::SetVar(const double& var) {
    fValueD = &var;
    fType = kDOUBLE;
}

#endif
