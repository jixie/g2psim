      function R6_txfit       (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff(  3)
      data ncoeff/  2/
      data avdat/ -0.3435877E-02/
      data xmin/
     1 -0.56270E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.49370E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.29719390E-02, 0.90831652E-01,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (abs(xmin(i)-xmax(i))<1.0E-08) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
c          set up monomials   functions
      x11 = x1
c
c                  function
c
      R6_txfit       =avdat
     1  +coeff(  1)    
     2  +coeff(  2)*x11
c
      return
      end
      function R6_delta       (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/  0.1808467E-02/
      data xmin/
     1 -0.68849E+00,-0.25651E-01,-0.36952E-01,-0.26097E-01,-0.19972E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59465E+00, 0.21663E-01, 0.39547E-01, 0.33592E-01, 0.19993E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.53665390E-02, 0.47898560E-01, 0.38332540E-02, 0.39184770E-02,
     +  0.16522570E-03,-0.14362230E-02, 0.12021110E-02, 0.34039390E-03,
     + -0.22930830E-02, 0.17100874E-04,-0.13411042E-03,-0.98473904E-03,
     +  0.40411470E-03, 0.32437520E-03,-0.34378190E-03, 0.32441872E-02,
     + -0.28367460E-02, 0.49930830E-03, 0.51967351E-03,-0.33154550E-03,
     + -0.40316310E-02, 0.71732460E-02,-0.28395662E-02, 0.31874051E-02,
     + -0.90817473E-02,-0.42950452E-03, 0.78157361E-04,-0.44147763E-03,
     +  0.84380940E-02, 0.36468161E-03,-0.41029570E-02, 0.11084733E-02,
     + -0.37947740E-03, 0.45436170E-02, 0.50299121E-02,-0.11544660E-01,
     +  0.11021663E-01, 0.70630444E-03,-0.58924040E-03,-0.31045850E-02,
     + -0.87476450E-05,-0.26181020E-03, 0.58590091E-03, 0.55629920E-03,
     +  0.73758740E-04, 0.42091422E-04,-0.77415620E-03, 0.90697820E-03,
     + -0.79739620E-03, 0.27977384E-03,-0.48338250E-02,-0.23607292E-02,
     +  0.94952620E-02,-0.88643620E-02, 0.20953812E-02,-0.47534490E-02,
     +  0.78862660E-03, 0.34981850E-02,-0.42419770E-02,-0.30842300E-02,
     +  0.96907170E-04,-0.70463700E-04,-0.21982310E-03,-0.68493123E-03,
     + -0.26917354E-04, 0.51106780E-05,-0.68188900E-04,-0.13638330E-03,
     +  0.15731320E-03, 0.17348043E-03, 0.58417540E-04, 0.39849710E-03,
     +  0.58847960E-03, 0.12313640E-02, 0.24592880E-03, 0.64438220E-04,
     +  0.12909910E-02,-0.29145930E-02, 0.13893423E-02, 0.64788213E-02,
     +  0.57010930E-02,-0.14029750E-02, 0.23427040E-03, 0.52368180E-03,
     +  0.34174450E-02,-0.12546134E-03, 0.79281740E-04, 0.33567514E-03,
     + -0.17260830E-02,-0.24587420E-02,-0.27607030E-02,-0.14122102E-02,
     + -0.10200104E-02, 0.17632550E-03, 0.26846840E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (abs(xmin(i)-xmax(i))<1.0E-08) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x13 = x12*x1
      x14 = x13*x1
      x15 = x14*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x25 = x24*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
c
c                  function
c
      R6_delta       =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)*x11                
     3  +coeff(  3)*x12                
     4  +coeff(  4)*x11*x21            
     5  +coeff(  5)    *x21            
     6  +coeff(  6)    *x22            
     7  +coeff(  7)        *x32        
     8  +coeff(  8)                *x51
      R6_delta       =R6_delta       
     9  +coeff(  9)    *x21*x32        
     1  +coeff( 10)    *x21*x31        
     2  +coeff( 11)    *x21    *x41    
     3  +coeff( 12)        *x31*x41    
     4  +coeff( 13)*x13                
     5  +coeff( 14)    *x22*x31        
     6  +coeff( 15)    *x22    *x41    
     7  +coeff( 16)    *x21*x31*x41    
     8  +coeff( 17)    *x21    *x42    
      R6_delta       =R6_delta       
     9  +coeff( 18)    *x24            
     1  +coeff( 19)*x11*x22            
     2  +coeff( 20)*x11*x21*x31        
     3  +coeff( 21)    *x22*x32        
     4  +coeff( 22)    *x22*x31*x41    
     5  +coeff( 23)    *x22    *x42    
     6  +coeff( 24)    *x21*x33        
     7  +coeff( 25)    *x21*x32*x41    
     8  +coeff( 26)    *x23            
      R6_delta       =R6_delta       
     9  +coeff( 27)    *x21        *x51
     1  +coeff( 28)*x11*x21*x32        
     2  +coeff( 29)    *x21*x31*x42    
     3  +coeff( 30)*x11        *x43    
     4  +coeff( 31)    *x21    *x43    
     5  +coeff( 32)            *x44    
     6  +coeff( 33)    *x24*x31        
     7  +coeff( 34)*x11*x21*x33        
     8  +coeff( 35)    *x22*x33        
      R6_delta       =R6_delta       
     9  +coeff( 36)    *x22*x32*x41    
     1  +coeff( 37)    *x22*x31*x42    
     2  +coeff( 38)*x12        *x43    
     3  +coeff( 39)*x11*x21    *x43    
     4  +coeff( 40)    *x22    *x43    
     5  +coeff( 41)        *x31        
     6  +coeff( 42)*x11*x21    *x41    
     7  +coeff( 43)*x11    *x31*x41    
     8  +coeff( 44)        *x32*x41    
      R6_delta       =R6_delta       
     9  +coeff( 45)    *x23*x31        
     1  +coeff( 46)    *x23    *x41    
     2  +coeff( 47)        *x31*x43    
     3  +coeff( 48)*x12*x22*x31        
     4  +coeff( 49)*x11*x22*x32        
     5  +coeff( 50)*x11*x22    *x42    
     6  +coeff( 51)*x11*x21*x32*x41    
     7  +coeff( 52)    *x21*x34        
     8  +coeff( 53)    *x21*x33*x41    
      R6_delta       =R6_delta       
     9  +coeff( 54)    *x21*x32*x42    
     1  +coeff( 55)    *x24*x32        
     2  +coeff( 56)    *x24*x31*x41    
     3  +coeff( 57)*x12*x22    *x42    
     4  +coeff( 58)*x11*x22*x33        
     5  +coeff( 59)*x11*x21*x34        
     6  +coeff( 60)    *x22*x34        
     7  +coeff( 61)    *x22    *x42*x51
     8  +coeff( 62)*x11    *x34*x41    
      R6_delta       =R6_delta       
     9  +coeff( 63)        *x33        
     1  +coeff( 64)        *x31*x42    
     2  +coeff( 65)        *x31    *x51
     3  +coeff( 66)            *x41*x51
     4  +coeff( 67)*x12*x22            
     5  +coeff( 68)*x11*x21*x31*x41    
     6  +coeff( 69)*x11*x21    *x42    
     7  +coeff( 70)    *x25            
     8  +coeff( 71)        *x32    *x51
      R6_delta       =R6_delta       
     9  +coeff( 72)*x13*x21*x31        
     1  +coeff( 73)    *x24    *x41    
     2  +coeff( 74)    *x23    *x42    
     3  +coeff( 75)*x12*x24            
     4  +coeff( 76)            *x43*x51
     5  +coeff( 77)    *x24    *x42    
     6  +coeff( 78)*x11*x22*x32*x41    
     7  +coeff( 79)*x11*x22    *x43    
     8  +coeff( 80)*x11*x21*x33*x41    
      R6_delta       =R6_delta       
     9  +coeff( 81)    *x22*x33*x41    
     1  +coeff( 82)*x12*x24*x31        
     2  +coeff( 83)*x13*x23    *x41    
     3  +coeff( 84)*x11*x25    *x41    
     4  +coeff( 85)    *x21*x31*x44    
     5  +coeff( 86)*x15    *x32        
     6  +coeff( 87)*x12*x23*x31*x41    
     7  +coeff( 88)*x15        *x42    
     8  +coeff( 89)    *x24*x33        
      R6_delta       =R6_delta       
     9  +coeff( 90)*x11*x22*x34        
     1  +coeff( 91)*x12*x21*x33*x41    
     2  +coeff( 92)*x11*x21*x32*x43    
     3  +coeff( 93)*x13*x23*x32        
     4  +coeff( 94)*x15*x24            
     5  +coeff( 95)*x11*x21*x32*x44    
c
      return
      end
      function R6_theta       (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/ -0.5667348E-03/
      data xmin/
     1 -0.68849E+00,-0.25651E-01,-0.36952E-01,-0.26097E-01,-0.19972E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59465E+00, 0.21663E-01, 0.39547E-01, 0.33592E-01, 0.19993E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.61547900E-02,-0.39358533E-03,-0.52651510E-01, 0.59574010E-02,
     + -0.33925680E-02, 0.19587000E-03,-0.13377490E-02, 0.19985250E-03,
     + -0.33492830E-02,-0.78905220E-02, 0.21223410E-01, 0.22851410E-02,
     + -0.14980230E-01, 0.79964930E-03, 0.23068140E-02, 0.20305060E-02,
     +  0.39470260E-02, 0.37385553E-01,-0.72060080E-02, 0.26649783E-02,
     +  0.14525401E-01, 0.13030903E-02,-0.33325200E-04,-0.34071632E-04,
     + -0.86914720E-02,-0.23428730E-01, 0.19037820E-01,-0.42094550E-03,
     +  0.10966430E-02,-0.51090940E-01, 0.43324630E-01,-0.20007130E-01,
     + -0.41739661E-02, 0.11548320E-02, 0.13253452E-01, 0.19610760E-01,
     +  0.59815230E-03, 0.28623780E-02,-0.45975264E-01, 0.54024410E-01,
     +  0.70728120E-03,-0.33018920E-03, 0.17372490E-02,-0.32482771E-02,
     + -0.55810830E-03,-0.90955280E-03,-0.14055081E-02, 0.31541343E-02,
     +  0.15402324E-02, 0.98779020E-03, 0.12407740E-02, 0.26594672E-02,
     +  0.20366710E-02,-0.16074473E-01,-0.10687710E-01, 0.40633961E-01,
     + -0.37451882E-04, 0.29387070E-02, 0.78064780E-02,-0.83552412E-02,
     + -0.35327740E-01,-0.15296893E-01, 0.17603063E-01,-0.95378150E-03,
     + -0.40191850E-02,-0.12935152E-03, 0.47210620E-03,-0.68563350E-02,
     + -0.23011960E-01, 0.68733841E-02,-0.13683640E-01,-0.16756820E-01,
     +  0.39540831E-02, 0.14574293E-01, 0.26477000E-04,-0.95003870E-04,
     + -0.49984320E-04, 0.65630650E-03,-0.10058440E-02,-0.24478950E-02,
     +  0.14664750E-02,-0.38381563E-02, 0.39633042E-02,-0.34995350E-03,
     + -0.11048311E-02,-0.15342640E-02,-0.44914680E-02,-0.31546650E-02,
     + -0.16346523E-02,-0.16055973E-02, 0.51038570E-03,-0.14972840E-03,
     +  0.16456860E-03,-0.11907791E-02, 0.62788980E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (abs(xmin(i)-xmax(i))<1.0E-08) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x13 = x12*x1
      x14 = x13*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
c
c                  function
c
      R6_theta       =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)*x11                
     3  +coeff(  3)    *x21            
     4  +coeff(  4)*x11*x21            
     5  +coeff(  5)    *x22            
     6  +coeff(  6)    *x21*x31        
     7  +coeff(  7)    *x21    *x41    
     8  +coeff(  8)*x14                
      R6_theta       =R6_theta       
     9  +coeff(  9)*x12                
     1  +coeff( 10)    *x21*x32        
     2  +coeff( 11)    *x21*x31*x41    
     3  +coeff( 12)*x11        *x42    
     4  +coeff( 13)    *x21    *x42    
     5  +coeff( 14)                *x51
     6  +coeff( 15)    *x24    *x41    
     7  +coeff( 16)*x11*x21*x31        
     8  +coeff( 17)    *x22*x31        
      R6_theta       =R6_theta       
     9  +coeff( 18)    *x22*x31*x41    
     1  +coeff( 19)    *x22    *x42    
     2  +coeff( 20)*x11*x22*x32        
     3  +coeff( 21)    *x24*x32        
     4  +coeff( 22)*x11*x22            
     5  +coeff( 23)    *x24            
     6  +coeff( 24)    *x23*x31        
     7  +coeff( 25)*x11*x21*x32        
     8  +coeff( 26)    *x22*x32        
      R6_theta       =R6_theta       
     9  +coeff( 27)    *x21*x33        
     1  +coeff( 28)*x11*x22    *x41    
     2  +coeff( 29)    *x23    *x41    
     3  +coeff( 30)    *x21*x32*x41    
     4  +coeff( 31)    *x21*x31*x42    
     5  +coeff( 32)    *x21    *x43    
     6  +coeff( 33)    *x24*x31        
     7  +coeff( 34)    *x23*x32        
     8  +coeff( 35)*x11*x21*x33        
      R6_theta       =R6_theta       
     9  +coeff( 36)    *x22*x33        
     1  +coeff( 37)*x14        *x41    
     2  +coeff( 38)*x11*x23    *x41    
     3  +coeff( 39)    *x22*x32*x41    
     4  +coeff( 40)    *x22*x31*x42    
     5  +coeff( 41)*x11*x21    *x43    
     6  +coeff( 42)        *x31        
     7  +coeff( 43)        *x32        
     8  +coeff( 44)        *x31*x41    
      R6_theta       =R6_theta       
     9  +coeff( 45)*x12*x21            
     1  +coeff( 46)    *x23            
     2  +coeff( 47)    *x22    *x41    
     3  +coeff( 48)        *x32*x41    
     4  +coeff( 49)*x11*x23            
     5  +coeff( 50)        *x33*x41    
     6  +coeff( 51)*x12        *x42    
     7  +coeff( 52)*x11        *x43    
     8  +coeff( 53)            *x44    
      R6_theta       =R6_theta       
     9  +coeff( 54)    *x21*x34        
     1  +coeff( 55)    *x23*x31*x41    
     2  +coeff( 56)    *x21*x33*x41    
     3  +coeff( 57)*x12*x21    *x42    
     4  +coeff( 58)*x11*x22    *x42    
     5  +coeff( 59)    *x23    *x42    
     6  +coeff( 60)*x11*x21*x31*x42    
     7  +coeff( 61)    *x21*x32*x42    
     8  +coeff( 62)    *x22    *x43    
      R6_theta       =R6_theta       
     9  +coeff( 63)    *x21*x31*x43    
     1  +coeff( 64)*x11        *x44    
     2  +coeff( 65)    *x21    *x44    
     3  +coeff( 66)*x11            *x51
     4  +coeff( 67)*x13*x22*x31        
     5  +coeff( 68)    *x23*x33        
     6  +coeff( 69)    *x24*x31*x41    
     7  +coeff( 70)*x11*x22    *x43    
     8  +coeff( 71)*x11*x22*x34        
      R6_theta       =R6_theta       
     9  +coeff( 72)*x11*x23*x32*x41    
     1  +coeff( 73)*x11*x24*x33        
     2  +coeff( 74)    *x24*x33*x41    
     3  +coeff( 75)            *x41    
     4  +coeff( 76)*x11    *x31        
     5  +coeff( 77)*x11        *x41    
     6  +coeff( 78)*x12    *x31        
     7  +coeff( 79)        *x33        
     8  +coeff( 80)*x11*x21    *x41    
      R6_theta       =R6_theta       
     9  +coeff( 81)*x11    *x31*x41    
     1  +coeff( 82)        *x31*x42    
     2  +coeff( 83)            *x43    
     3  +coeff( 84)*x12*x22            
     4  +coeff( 85)*x12    *x32        
     5  +coeff( 86)*x11    *x32*x41    
     6  +coeff( 87)*x11    *x31*x42    
     7  +coeff( 88)        *x31*x43    
     8  +coeff( 89)*x11*x23*x31        
      R6_theta       =R6_theta       
     9  +coeff( 90)*x12*x21*x32        
     1  +coeff( 91)*x12    *x33        
     2  +coeff( 92)        *x31    *x51
     3  +coeff( 93)            *x41*x51
     4  +coeff( 94)*x11*x24*x31        
     5  +coeff( 95)*x11*x22*x33        
c
      return
      end
      function R6_phi         (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/ -0.3156503E-03/
      data xmin/
     1 -0.68849E+00,-0.25651E-01,-0.36952E-01,-0.26097E-01,-0.19972E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59465E+00, 0.21663E-01, 0.39547E-01, 0.33592E-01, 0.19993E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.42083943E-03,-0.27565330E-01,-0.24188941E-03,-0.63861790E-02,
     + -0.13437173E-03, 0.67416992E-02, 0.64842533E-02, 0.21034742E-02,
     + -0.75988462E-02, 0.41621520E-02, 0.10618580E-02, 0.24110370E-02,
     + -0.31698440E-01, 0.17392400E-01,-0.19868614E-01,-0.49877970E-02,
     + -0.83347074E-02, 0.68010380E-02, 0.54586282E-02, 0.10590250E-01,
     + -0.14843762E-02, 0.30485913E-02,-0.28913610E-03,-0.14169551E-01,
     +  0.13822440E-01, 0.10149641E-01, 0.79218740E-02, 0.48269554E-02,
     + -0.48301790E-01, 0.21751490E-01, 0.13186170E-01, 0.26844200E-01,
     + -0.12830421E-01,-0.24553100E-01, 0.58456314E-02,-0.42595653E-02,
     + -0.97609350E-02,-0.99692560E-02, 0.46616090E-02,-0.18503414E-02,
     + -0.54209921E-02, 0.14268880E-01,-0.55196800E-03, 0.33676290E-01,
     + -0.23273860E-01,-0.24764174E-02, 0.36334150E-02,-0.28691360E-02,
     +  0.36695500E-01,-0.15906900E-01, 0.35646174E-01, 0.46986630E-02,
     +  0.47021950E-02,-0.18369400E-01, 0.12865351E-01,-0.16341224E-01,
     + -0.20601840E-01, 0.55838744E-02,-0.49735420E-02,-0.40324233E-03,
     +  0.15765890E-02,-0.18141113E-01, 0.40572322E-01, 0.39657563E-02,
     + -0.37959903E-01, 0.14852480E-02,-0.15482810E-01, 0.68649742E-02,
     +  0.77106880E-03,-0.86312050E-03,-0.21172972E-01, 0.17218481E-01,
     + -0.16306610E-01,-0.11570890E-02,-0.40673732E-03, 0.62084900E-03,
     + -0.19433820E-01, 0.13067813E-01, 0.14417494E-01,-0.16758373E-01,
     +  0.11407280E-01,-0.13901030E-02, 0.21381342E-03,-0.81629981E-03,
     +  0.33844443E-02,-0.96629103E-02, 0.83339840E-02,-0.39241020E-01,
     +  0.86547313E-02, 0.83325831E-02,-0.14810110E-01,-0.18851241E-02,
     +  0.27666250E-01, 0.44510043E-02, 0.98047280E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (abs(xmin(i)-xmax(i))<1.0E-08) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x35 = x34*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x45 = x44*x4
      x51 = x5
c
c                  function
c
      R6_phi         =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x21            
     6  +coeff(  6)            *x42    
     7  +coeff(  7)*x11    *x31        
     8  +coeff(  8)    *x21*x31        
      R6_phi         =R6_phi         
     9  +coeff(  9)*x11        *x41    
     1  +coeff( 10)    *x21    *x41    
     2  +coeff( 11)*x12                
     3  +coeff( 12)    *x22            
     4  +coeff( 13)        *x31*x42    
     5  +coeff( 14)            *x43    
     6  +coeff( 15)*x11    *x31*x41    
     7  +coeff( 16)*x12    *x31        
     8  +coeff( 17)    *x22*x31        
      R6_phi         =R6_phi         
     9  +coeff( 18)    *x22    *x41    
     1  +coeff( 19)*x12    *x32        
     2  +coeff( 20)*x11*x22    *x44    
     3  +coeff( 21)        *x31*x41    
     4  +coeff( 22)*x11    *x32        
     5  +coeff( 23)    *x21*x32        
     6  +coeff( 24)    *x21*x31*x41    
     7  +coeff( 25)*x11        *x42    
     8  +coeff( 26)    *x21    *x42    
      R6_phi         =R6_phi         
     9  +coeff( 27)*x12        *x41    
     1  +coeff( 28)        *x34        
     2  +coeff( 29)        *x31*x43    
     3  +coeff( 30)            *x44    
     4  +coeff( 31)*x11*x21*x32        
     5  +coeff( 32)    *x22*x32        
     6  +coeff( 33)*x11*x21*x31*x41    
     7  +coeff( 34)    *x22*x31*x41    
     8  +coeff( 35)    *x22    *x42    
      R6_phi         =R6_phi         
     9  +coeff( 36)*x12*x21*x31        
     1  +coeff( 37)*x11*x22    *x41    
     2  +coeff( 38)    *x21*x33*x41    
     3  +coeff( 39)*x12*x21*x32        
     4  +coeff( 40)*x11*x24            
     5  +coeff( 41)        *x33        
     6  +coeff( 42)        *x32*x41    
     7  +coeff( 43)*x11*x21*x31        
     8  +coeff( 44)        *x32*x42    
      R6_phi         =R6_phi         
     9  +coeff( 45)    *x21*x31*x42    
     1  +coeff( 46)*x12    *x31*x41    
     2  +coeff( 47)*x11*x22*x31        
     3  +coeff( 48)        *x33*x42    
     4  +coeff( 49)    *x21*x32*x42    
     5  +coeff( 50)    *x22*x33        
     6  +coeff( 51)    *x22*x32*x41    
     7  +coeff( 52)*x11*x21*x31*x42    
     8  +coeff( 53)*x12        *x43    
      R6_phi         =R6_phi         
     9  +coeff( 54)*x11*x21    *x43    
     1  +coeff( 55)    *x23*x32        
     2  +coeff( 56)*x12*x21    *x42    
     3  +coeff( 57)*x11*x22    *x42    
     4  +coeff( 58)        *x35*x41    
     5  +coeff( 59)        *x34*x42    
     6  +coeff( 60)    *x21        *x51
     7  +coeff( 61)    *x22*x31*x43    
     8  +coeff( 62)    *x23*x33        
      R6_phi         =R6_phi         
     9  +coeff( 63)    *x23*x32*x41    
     1  +coeff( 64)*x11*x22*x31*x42    
     2  +coeff( 65)    *x23*x31*x42    
     3  +coeff( 66)*x11*x22    *x43    
     4  +coeff( 67)    *x24*x32        
     5  +coeff( 68)*x12*x23*x31        
     6  +coeff( 69)    *x21*x31    *x51
     7  +coeff( 70)    *x21    *x41*x51
     8  +coeff( 71)*x12*x22*x33        
      R6_phi         =R6_phi         
     9  +coeff( 72)*x12*x23    *x42    
     1  +coeff( 73)*x11*x23    *x44    
     2  +coeff( 74)        *x32        
     3  +coeff( 75)*x11*x21            
     4  +coeff( 76)*x12*x21            
     5  +coeff( 77)        *x33*x41    
     6  +coeff( 78)*x11    *x32*x41    
     7  +coeff( 79)    *x21*x32*x41    
     8  +coeff( 80)*x11    *x31*x42    
      R6_phi         =R6_phi         
     9  +coeff( 81)*x11        *x43    
     1  +coeff( 82)    *x23    *x41    
     2  +coeff( 83)*x12*x22            
     3  +coeff( 84)*x11*x23            
     4  +coeff( 85)        *x34*x41    
     5  +coeff( 86)        *x31*x44    
     6  +coeff( 87)            *x45    
     7  +coeff( 88)    *x21*x31*x43    
     8  +coeff( 89)*x11        *x44    
      R6_phi         =R6_phi         
     9  +coeff( 90)    *x21    *x44    
     1  +coeff( 91)*x11*x21*x33        
     2  +coeff( 92)*x12    *x32*x41    
     3  +coeff( 93)*x11*x21*x32*x41    
     4  +coeff( 94)*x12*x21*x31*x41    
     5  +coeff( 95)*x11*x22*x31*x41    
c
      return
      end
      function R6_y00         (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/ -0.2002243E-03/
      data xmin/
     1 -0.68849E+00,-0.25651E-01,-0.36952E-01,-0.26097E-01,-0.19972E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59465E+00, 0.21663E-01, 0.39547E-01, 0.33592E-01, 0.19993E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.47637610E-02,-0.24139210E-02, 0.39455343E-01, 0.81486190E-02,
     +  0.46124344E-03, 0.51265214E-02,-0.65279980E-03,-0.15615960E-01,
     + -0.25264080E-01,-0.28040240E-01, 0.61612473E-02, 0.37110780E-02,
     + -0.15135674E-02, 0.63533070E-03,-0.35656530E-02, 0.43507350E-01,
     + -0.38047190E-01,-0.55765304E-02,-0.66188923E-02, 0.28967514E-01,
     +  0.27494732E-01,-0.16880463E-01,-0.13259400E-01, 0.51378412E-02,
     +  0.19876644E-01,-0.10137220E-01,-0.19970030E-02,-0.76853511E-02,
     + -0.55652583E-03, 0.33629500E-02,-0.16106910E-01, 0.43093220E-01,
     + -0.43327460E-01,-0.12709903E-01, 0.54017852E-01,-0.16466110E-01,
     + -0.14687750E-01,-0.26682700E-01,-0.44854990E-01, 0.15986840E-01,
     +  0.21064690E-01, 0.58373660E-01,-0.43576300E-02, 0.27699801E-02,
     + -0.90331844E-02, 0.13978273E-01, 0.16647680E-02, 0.15988571E-01,
     + -0.35444583E-01, 0.62353573E-02, 0.13907281E-01,-0.23805502E-01,
     +  0.16860783E-01, 0.42553580E-01, 0.48230011E-01,-0.28190633E-01,
     + -0.57699020E-01,-0.63779100E-01, 0.23718410E-01, 0.12285810E-01,
     +  0.24239584E-01, 0.78746480E-02,-0.19525444E-02, 0.12534132E-01,
     + -0.62728771E-02,-0.92795751E-02, 0.24393620E-01,-0.53190120E-01,
     +  0.74746330E-02, 0.32705810E-01, 0.29072051E-01,-0.19288050E-01,
     + -0.38201780E-01, 0.52746040E-02,-0.95423780E-02, 0.50795054E-03,
     + -0.61507790E-01,-0.12442970E-02, 0.17985640E-01,-0.65956730E-02,
     +  0.69120302E-02, 0.74499710E-02, 0.88582493E-01, 0.89102692E-03,
     + -0.98707510E-02, 0.35903714E-04,-0.69055613E-03, 0.28284694E-01,
     +  0.10543773E-01,-0.32304020E-01,-0.46752393E-01, 0.32931180E-01,
     + -0.11314000E-01, 0.14464933E-01, 0.26202853E-01,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (abs(xmin(i)-xmax(i))<1.0E-08) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
      x2 =1.+(x(  2)-xmax(  2))*scale(  2)
      x3 =1.+(x(  3)-xmax(  3))*scale(  3)
      x4 =1.+(x(  4)-xmax(  4))*scale(  4)
      x5 =1.+(x(  5)-xmax(  5))*scale(  5)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
      x13 = x12*x1
      x21 = x2
      x22 = x21*x2
      x23 = x22*x2
      x24 = x23*x2
      x25 = x24*x2
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x34 = x33*x3
      x35 = x34*x3
      x36 = x35*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x44 = x43*x4
      x51 = x5
c
c                  function
c
      R6_y00         =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x21            
     6  +coeff(  6)        *x32        
     7  +coeff(  7)        *x31*x41    
     8  +coeff(  8)            *x42    
      R6_y00         =R6_y00         
     9  +coeff(  9)*x11    *x31        
     1  +coeff( 10)    *x21*x31        
     2  +coeff( 11)*x11        *x41    
     3  +coeff( 12)    *x21    *x41    
     4  +coeff( 13)*x12                
     5  +coeff( 14)*x11*x21            
     6  +coeff( 15)    *x22            
     7  +coeff( 16)        *x31*x42    
     8  +coeff( 17)            *x43    
      R6_y00         =R6_y00         
     9  +coeff( 18)*x11    *x32        
     1  +coeff( 19)    *x21*x32        
     2  +coeff( 20)*x11    *x31*x41    
     3  +coeff( 21)    *x21*x31*x41    
     4  +coeff( 22)*x11        *x42    
     5  +coeff( 23)    *x21    *x42    
     6  +coeff( 24)*x12    *x31        
     7  +coeff( 25)    *x22*x31        
     8  +coeff( 26)*x12        *x41    
      R6_y00         =R6_y00         
     9  +coeff( 27)*x11*x21    *x41    
     1  +coeff( 28)    *x22    *x41    
     2  +coeff( 29)*x12*x21            
     3  +coeff( 30)*x11*x22            
     4  +coeff( 31)        *x34        
     5  +coeff( 32)        *x33*x41    
     6  +coeff( 33)        *x32*x42    
     7  +coeff( 34)            *x44    
     8  +coeff( 35)    *x21*x31*x42    
      R6_y00         =R6_y00         
     9  +coeff( 36)*x11        *x43    
     1  +coeff( 37)*x12    *x32        
     2  +coeff( 38)*x11*x21*x32        
     3  +coeff( 39)    *x22*x32        
     4  +coeff( 40)*x12    *x31*x41    
     5  +coeff( 41)*x11*x21*x31*x41    
     6  +coeff( 42)    *x22*x31*x41    
     7  +coeff( 43)    *x22    *x42    
     8  +coeff( 44)*x12*x21*x31        
      R6_y00         =R6_y00         
     9  +coeff( 45)*x11*x22*x31        
     1  +coeff( 46)    *x23*x31        
     2  +coeff( 47)*x12*x21    *x41    
     3  +coeff( 48)*x11*x22    *x41    
     4  +coeff( 49)        *x34*x41    
     5  +coeff( 50)    *x21*x34        
     6  +coeff( 51)    *x21*x33*x41    
     7  +coeff( 52)    *x21*x32*x42    
     8  +coeff( 53)*x12    *x33        
      R6_y00         =R6_y00         
     9  +coeff( 54)*x11*x21*x33        
     1  +coeff( 55)    *x22*x33        
     2  +coeff( 56)*x12    *x32*x41    
     3  +coeff( 57)*x11*x21*x32*x41    
     4  +coeff( 58)    *x22*x32*x41    
     5  +coeff( 59)*x12    *x31*x42    
     6  +coeff( 60)*x11*x21*x31*x42    
     7  +coeff( 61)    *x22*x31*x42    
     8  +coeff( 62)*x11*x21    *x43    
      R6_y00         =R6_y00         
     9  +coeff( 63)*x12*x21*x32        
     1  +coeff( 64)*x12*x21    *x42    
     2  +coeff( 65)*x12*x22    *x41    
     3  +coeff( 66)    *x21*x35        
     4  +coeff( 67)    *x22*x31*x43    
     5  +coeff( 68)    *x23*x32*x41    
     6  +coeff( 69)*x11*x22*x31*x42    
     7  +coeff( 70)    *x23*x31*x42    
     8  +coeff( 71)    *x24*x32        
      R6_y00         =R6_y00         
     9  +coeff( 72)*x12*x22*x31*x41    
     1  +coeff( 73)    *x24*x31*x41    
     2  +coeff( 74)*x11*x23    *x42    
     3  +coeff( 75)    *x25*x31        
     4  +coeff( 76)    *x21        *x51
     5  +coeff( 77)    *x23*x34        
     6  +coeff( 78)    *x21*x31    *x51
     7  +coeff( 79)    *x23*x35        
     8  +coeff( 80)*x13*x22*x34        
      R6_y00         =R6_y00         
     9  +coeff( 81)    *x21    *x43*x51
     1  +coeff( 82)    *x21    *x44*x51
     2  +coeff( 83)    *x25*x36        
     3  +coeff( 84)        *x33        
     4  +coeff( 85)        *x32*x41    
     5  +coeff( 86)*x11*x21*x31        
     6  +coeff( 87)    *x23            
     7  +coeff( 88)        *x31*x43    
     8  +coeff( 89)    *x21*x33        
      R6_y00         =R6_y00         
     9  +coeff( 90)*x11    *x32*x41    
     1  +coeff( 91)    *x21*x32*x41    
     2  +coeff( 92)*x11    *x31*x42    
     3  +coeff( 93)    *x21    *x43    
     4  +coeff( 94)        *x35        
     5  +coeff( 95)        *x33*x42    
c
      return
      end
  