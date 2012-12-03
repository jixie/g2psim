      function g2_delta       (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/  0.1677595E-02/
      data xmin/
     1 -0.68569E+00,-0.19059E-01,-0.34704E-01,-0.42451E-01,-0.49994E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59028E+00, 0.17631E-01, 0.23644E-01, 0.21098E-01, 0.49996E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.48205643E-02, 0.44273522E-01, 0.33067979E-02, 0.36009888E-02,
     +  0.10616499E-02,-0.13312278E-02, 0.16452023E-02,-0.30972704E-02,
     + -0.24499756E-03, 0.11256069E-03, 0.10439903E-03,-0.23996499E-02,
     +  0.23683629E-03, 0.54579886E-03, 0.92398882E-03,-0.14544213E-02,
     +  0.89438830E-03, 0.26665337E-03, 0.54930808E-03,-0.21837207E-02,
     +  0.33404035E-02,-0.28159158E-03, 0.37183502E-03, 0.42623695E-03,
     +  0.74690126E-03,-0.13865544E-02, 0.13445567E-02, 0.12056833E-03,
     +  0.15022333E-02,-0.18142357E-02, 0.26666919E-04, 0.49489579E-03,
     + -0.46390900E-03,-0.86872902E-03, 0.19771035E-02, 0.11102344E-02,
     + -0.23915200E-02,-0.18476087E-03, 0.11125728E-03,-0.76142685E-04,
     +  0.25300542E-03,-0.15863044E-03, 0.87058800E-03,-0.93230850E-03,
     +  0.14763837E-02,-0.64145681E-03, 0.94486523E-03, 0.20856860E-04,
     + -0.17013622E-02, 0.33030420E-03,-0.11777363E-02, 0.18107954E-02,
     +  0.16383667E-03,-0.13779190E-03,-0.31930950E-03,-0.17451084E-02,
     +  0.64112764E-03,-0.13654328E-05, 0.65019331E-03,-0.44370710E-03,
     + -0.10591705E-03, 0.10089493E-03, 0.14332311E-04, 0.45399767E-04,
     + -0.14768107E-03, 0.15705728E-03, 0.10960146E-03,-0.11559743E-04,
     + -0.13943850E-03, 0.25229534E-03, 0.45442756E-03, 0.83370920E-03,
     + -0.39816186E-04, 0.11868687E-03, 0.28664774E-04, 0.85002299E-04,
     + -0.48021138E-04, 0.39337034E-03,-0.87965833E-03, 0.12400742E-02,
     + -0.18466222E-03,-0.15748251E-03, 0.98893353E-04,-0.32344167E-03,
     + -0.28348863E-03,-0.56979930E-04,-0.14182206E-03, 0.16577764E-03,
     +  0.10810986E-03,-0.62861887E-04, 0.75715702E-05,-0.27180157E-03,
     +  0.33513838E-03,-0.40015948E-04, 0.16665481E-03,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
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
      x51 = x5
      x52 = x51*x5
c
c                  function
c
      g2_delta       =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)*x11                
     3  +coeff(  3)*x12                
     4  +coeff(  4)*x11*x21            
     5  +coeff(  5)                *x51
     6  +coeff(  6)    *x22            
     7  +coeff(  7)    *x21*x31        
     8  +coeff(  8)    *x21    *x41    
      g2_delta       =g2_delta       
     9  +coeff(  9)*x11*x21    *x41    
     1  +coeff( 10)            *x41    
     2  +coeff( 11)*x12*x21            
     3  +coeff( 12)    *x21    *x42    
     4  +coeff( 13)    *x21        *x51
     5  +coeff( 14)    *x21            
     6  +coeff( 15)        *x32        
     7  +coeff( 16)        *x31*x41    
     8  +coeff( 17)            *x42    
      g2_delta       =g2_delta       
     9  +coeff( 18)*x11*x22            
     1  +coeff( 19)*x11*x21*x31        
     2  +coeff( 20)    *x22    *x41    
     3  +coeff( 21)    *x21*x31*x41    
     4  +coeff( 22)        *x31    *x51
     5  +coeff( 23)            *x41*x51
     6  +coeff( 24)    *x24            
     7  +coeff( 25)*x11*x21*x32        
     8  +coeff( 26)*x11*x21*x31*x41    
      g2_delta       =g2_delta       
     9  +coeff( 27)*x11*x21    *x42    
     1  +coeff( 28)*x13                
     2  +coeff( 29)    *x22*x31        
     3  +coeff( 30)    *x21*x32        
     4  +coeff( 31)        *x31        
     5  +coeff( 32)    *x23            
     6  +coeff( 33)*x11    *x32        
     7  +coeff( 34)    *x22*x32        
     8  +coeff( 35)    *x23    *x41    
      g2_delta       =g2_delta       
     9  +coeff( 36)*x12        *x42    
     1  +coeff( 37)    *x22    *x42    
     2  +coeff( 38)    *x22        *x51
     3  +coeff( 39)        *x32    *x51
     4  +coeff( 40)*x11        *x41*x51
     5  +coeff( 41)    *x21    *x41*x51
     6  +coeff( 42)        *x31*x41*x51
     7  +coeff( 43)*x11*x23*x31        
     8  +coeff( 44)    *x24*x31        
      g2_delta       =g2_delta       
     9  +coeff( 45)    *x24    *x41    
     1  +coeff( 46)    *x22    *x41*x51
     2  +coeff( 47)*x11    *x31*x41    
     3  +coeff( 48)*x12*x22            
     4  +coeff( 49)    *x23*x31        
     5  +coeff( 50)*x12    *x32        
     6  +coeff( 51)*x12    *x31*x41    
     7  +coeff( 52)    *x22*x31*x41    
     8  +coeff( 53)            *x42*x51
      g2_delta       =g2_delta       
     9  +coeff( 54)*x11*x22*x32        
     1  +coeff( 55)*x12*x22    *x41    
     2  +coeff( 56)*x11*x23    *x41    
     3  +coeff( 57)    *x22*x31    *x51
     4  +coeff( 58)*x13*x23            
     5  +coeff( 59)*x11*x22    *x41*x51
     6  +coeff( 60)    *x23    *x41*x51
     7  +coeff( 61)    *x22    *x42*x51
     8  +coeff( 62)*x12*x24*x31        
      g2_delta       =g2_delta       
     9  +coeff( 63)*x12        *x41    
     1  +coeff( 64)*x14                
     2  +coeff( 65)*x11*x23            
     3  +coeff( 66)    *x21*x33        
     4  +coeff( 67)*x13        *x41    
     5  +coeff( 68)*x11*x21        *x51
     6  +coeff( 69)    *x21*x31    *x51
     7  +coeff( 70)*x11*x24            
     8  +coeff( 71)    *x23*x32        
      g2_delta       =g2_delta       
     9  +coeff( 72)*x12*x21*x31*x41    
     1  +coeff( 73)*x11*x21*x31    *x51
     2  +coeff( 74)    *x21    *x42*x51
     3  +coeff( 75)    *x21        *x52
     4  +coeff( 76)*x14*x21*x31        
     5  +coeff( 77)*x13*x21*x32        
     6  +coeff( 78)*x12*x23    *x41    
     7  +coeff( 79)*x11*x24    *x41    
     8  +coeff( 80)    *x24    *x42    
      g2_delta       =g2_delta       
     9  +coeff( 81)*x11*x22*x31    *x51
     1  +coeff( 82)*x14*x23            
     2  +coeff( 83)*x14*x22*x31        
     3  +coeff( 84)*x12*x23*x32        
     4  +coeff( 85)*x12*x21*x34        
     5  +coeff( 86)*x11*x21*x31    *x52
     6  +coeff( 87)*x11    *x31        
     7  +coeff( 88)*x11        *x41    
     8  +coeff( 89)        *x32*x41    
      g2_delta       =g2_delta       
     9  +coeff( 90)        *x31*x42    
     1  +coeff( 91)*x11            *x51
     2  +coeff( 92)*x12*x21*x31        
     3  +coeff( 93)*x11*x22*x31        
     4  +coeff( 94)*x11    *x33        
     5  +coeff( 95)*x12*x21    *x41    
c
      return
      end
      function g2_theta       (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/ -0.1291911E-02/
      data xmin/
     1 -0.68569E+00,-0.19059E-01,-0.34704E-01,-0.42451E-01,-0.49994E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59028E+00, 0.17631E-01, 0.23644E-01, 0.21098E-01, 0.49996E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.32149777E-02,-0.23343133E-03,-0.55349905E-01, 0.20293384E-02,
     +  0.15143398E-03, 0.77551794E-02,-0.34340974E-02, 0.99654654E-02,
     + -0.20920377E-01, 0.31811569E-02, 0.12546828E-01,-0.56315553E-02,
     + -0.10185551E-01,-0.78112935E-04, 0.13102619E-02, 0.37369505E-02,
     +  0.19837627E-02,-0.12051357E-01,-0.27534316E-03, 0.63719467E-03,
     + -0.22790655E-02, 0.23950997E-02,-0.12303467E-01,-0.13313451E-02,
     +  0.12750453E-02,-0.10087895E-02, 0.68522501E-03, 0.87491767E-02,
     +  0.17672000E-01,-0.92388992E-03,-0.13327986E-01, 0.19271118E-02,
     +  0.17911874E-01,-0.57656289E-03,-0.14879667E-02,-0.13958407E-01,
     + -0.29139360E-02, 0.55450544E-03, 0.14087604E-03,-0.23487539E-03,
     + -0.10759009E-02,-0.82771890E-02, 0.36088817E-03, 0.10277570E-01,
     +  0.83176885E-03,-0.21954034E-02, 0.12534676E-03, 0.28427122E-02,
     + -0.20573556E-02,-0.29710811E-02, 0.95328310E-03,-0.39672051E-02,
     + -0.12521872E-03,-0.19332883E-03, 0.65649766E-02, 0.22675483E-01,
     + -0.65439363E-03, 0.43536481E-03,-0.13275961E-02,-0.40893067E-03,
     + -0.45588281E-03,-0.10358963E-03, 0.17015447E-02,-0.32104570E-02,
     +  0.26390024E-02,-0.13271417E-02,-0.26081779E-03,-0.73088166E-04,
     +  0.17154175E-02,-0.44428121E-03,-0.21256646E-02,-0.10319821E-04,
     + -0.11960437E-02, 0.27127694E-02,-0.13539134E-03, 0.19882605E-02,
     + -0.19633565E-02, 0.69871112E-02,-0.34143362E-03, 0.58120586E-04,
     +  0.42474368E-02, 0.70191701E-02,-0.11712594E-02,-0.19461082E-01,
     +  0.20761895E-02, 0.43181861E-02,-0.33760730E-02, 0.78543402E-04,
     + -0.11791380E-03,-0.30668880E-03, 0.66607731E-03, 0.22194830E-02,
     + -0.71525777E-03, 0.13064839E-02,-0.17148645E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
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
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x51 = x5
c
c                  function
c
      g2_theta       =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)*x11                
     3  +coeff(  3)    *x21            
     4  +coeff(  4)            *x41    
     5  +coeff(  5)*x12                
     6  +coeff(  6)*x11*x21            
     7  +coeff(  7)    *x22            
     8  +coeff(  8)    *x21*x31        
      g2_theta       =g2_theta       
     9  +coeff(  9)    *x21    *x41    
     1  +coeff( 10)                *x51
     2  +coeff( 11)    *x23    *x41    
     3  +coeff( 12)    *x21*x32        
     4  +coeff( 13)    *x22    *x41    
     5  +coeff( 14)*x11    *x31    *x51
     6  +coeff( 15)*x11*x22            
     7  +coeff( 16)    *x23            
     8  +coeff( 17)*x11*x21*x31        
      g2_theta       =g2_theta       
     9  +coeff( 18)    *x21    *x42    
     1  +coeff( 19)*x13    *x31        
     2  +coeff( 20)*x11*x21*x32        
     3  +coeff( 21)    *x22    *x42    
     4  +coeff( 22)            *x41*x51
     5  +coeff( 23)    *x23*x31*x41    
     6  +coeff( 24)    *x22        *x51
     7  +coeff( 25)    *x21    *x41*x51
     8  +coeff( 26)        *x31        
      g2_theta       =g2_theta       
     9  +coeff( 27)        *x32        
     1  +coeff( 28)    *x22*x31        
     2  +coeff( 29)    *x21*x31*x41    
     3  +coeff( 30)*x11*x23            
     4  +coeff( 31)    *x23*x31        
     5  +coeff( 32)*x11*x22    *x41    
     6  +coeff( 33)    *x22*x31*x41    
     7  +coeff( 34)*x11            *x51
     8  +coeff( 35)        *x31    *x51
      g2_theta       =g2_theta       
     9  +coeff( 36)*x11*x23    *x41    
     1  +coeff( 37)    *x22    *x41*x51
     2  +coeff( 38)*x11        *x41    
     3  +coeff( 39)            *x42    
     4  +coeff( 40)*x13                
     5  +coeff( 41)*x12*x21            
     6  +coeff( 42)    *x22*x32        
     7  +coeff( 43)    *x21        *x51
     8  +coeff( 44)    *x23    *x42    
      g2_theta       =g2_theta       
     9  +coeff( 45)        *x32    *x51
     1  +coeff( 46)        *x31*x41*x51
     2  +coeff( 47)*x11*x22        *x51
     3  +coeff( 48)    *x22*x31    *x51
     4  +coeff( 49)*x11        *x42*x51
     5  +coeff( 50)        *x31*x41    
     6  +coeff( 51)*x11*x21    *x41    
     7  +coeff( 52)*x11        *x42    
     8  +coeff( 53)        *x31*x42    
      g2_theta       =g2_theta       
     9  +coeff( 54)*x12*x22            
     1  +coeff( 55)*x11*x23*x31        
     2  +coeff( 56)*x11*x22    *x42    
     3  +coeff( 57)    *x21*x31    *x51
     4  +coeff( 58)            *x42*x51
     5  +coeff( 59)*x12*x21*x33        
     6  +coeff( 60)*x11*x21*x31    *x51
     7  +coeff( 61)*x11    *x32    *x51
     8  +coeff( 62)*x11*x21    *x41*x51
      g2_theta       =g2_theta       
     9  +coeff( 63)*x11    *x31*x41*x51
     1  +coeff( 64)*x13*x22*x32        
     2  +coeff( 65)*x11*x22    *x41*x51
     3  +coeff( 66)    *x23    *x41*x51
     4  +coeff( 67)*x12    *x31        
     5  +coeff( 68)*x11    *x32        
     6  +coeff( 69)*x11    *x31*x41    
     7  +coeff( 70)        *x32*x41    
     8  +coeff( 71)*x11*x22*x31        
      g2_theta       =g2_theta       
     9  +coeff( 72)*x12    *x32        
     1  +coeff( 73)*x11    *x33        
     2  +coeff( 74)    *x21*x33        
     3  +coeff( 75)*x13        *x41    
     4  +coeff( 76)*x12*x21    *x41    
     5  +coeff( 77)    *x21*x32*x41    
     6  +coeff( 78)*x11*x21    *x42    
     7  +coeff( 79)*x11    *x31*x42    
     8  +coeff( 80)*x13    *x32        
      g2_theta       =g2_theta       
     9  +coeff( 81)*x11*x22*x32        
     1  +coeff( 82)    *x23*x32        
     2  +coeff( 83)*x12*x22    *x41    
     3  +coeff( 84)*x11*x22*x31*x41    
     4  +coeff( 85)    *x22*x32*x41    
     5  +coeff( 86)*x12*x21    *x42    
     6  +coeff( 87)    *x22*x31*x42    
     7  +coeff( 88)*x12            *x51
     8  +coeff( 89)*x11*x21        *x51
      g2_theta       =g2_theta       
     9  +coeff( 90)*x11        *x41*x51
     1  +coeff( 91)*x13*x23            
     2  +coeff( 92)*x13*x22*x31        
     3  +coeff( 93)*x12*x23*x31        
     4  +coeff( 94)*x13    *x33        
     5  +coeff( 95)    *x23*x33        
c
      return
      end
      function g2_phi         (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/ -0.4247484E-02/
      data xmin/
     1 -0.68569E+00,-0.19059E-01,-0.34704E-01,-0.42451E-01,-0.49994E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59028E+00, 0.17631E-01, 0.23644E-01, 0.21098E-01, 0.49996E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     +  0.50951366E-03,-0.29686578E-01, 0.21688905E-01,-0.65429992E-03,
     + -0.21448594E-02, 0.96195145E-02, 0.40913508E-02,-0.20034626E-01,
     + -0.14413093E-02, 0.88081630E-02, 0.15616140E-01, 0.89854773E-04,
     + -0.22810062E-02,-0.17239921E-02,-0.15425726E-02, 0.88325440E-03,
     +  0.31448887E-02,-0.81131421E-02,-0.24435052E-02,-0.58019399E-02,
     + -0.42789849E-02, 0.15570341E-03,-0.21295629E-02, 0.51378488E-03,
     + -0.32306060E-02,-0.28678803E-02,-0.32311599E-03, 0.45798123E-02,
     + -0.31390954E-02, 0.31670442E-03, 0.13091548E-03,-0.55709895E-03,
     + -0.21916607E-02, 0.79563819E-02, 0.14330243E-03, 0.81858743E-03,
     +  0.12246612E-03, 0.33281758E-03, 0.14256772E-02,-0.28641566E-02,
     +  0.67997543E-03,-0.16745517E-03, 0.33815700E-03, 0.46316404E-02,
     +  0.15916651E-02,-0.56462688E-03,-0.60896884E-03, 0.25767346E-02,
     +  0.85020643E-02,-0.14395498E-01,-0.45878792E-03,-0.20448675E-02,
     +  0.62586754E-02, 0.39583576E-03,-0.36677639E-02,-0.23695275E-03,
     + -0.97947930E-04, 0.11039105E-02, 0.14948301E-02,-0.93795150E-03,
     +  0.10261365E-02,-0.17853676E-02,-0.77184156E-03, 0.40492397E-02,
     + -0.82509493E-03, 0.97601244E-03,-0.21899296E-02, 0.16587886E-02,
     +  0.11977579E-01,-0.59342817E-02,-0.41081584E-02, 0.24690237E-02,
     + -0.66662679E-03, 0.20643661E-03, 0.14268447E-02,-0.53792784E-04,
     +  0.45649679E-02,-0.34439319E-02,-0.10859335E-02, 0.18080253E-02,
     + -0.85062016E-03, 0.28904231E-03,-0.97754854E-03, 0.16683174E-02,
     + -0.78455528E-03, 0.54732047E-03, 0.13346447E-02, 0.49034634E-03,
     +  0.11534115E-02,-0.12371531E-02, 0.45737700E-03, 0.36187097E-03,
     + -0.31171684E-03, 0.81700290E-03,-0.17846586E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
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
      g2_phi         =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x21            
     6  +coeff(  6)*x11    *x31        
     7  +coeff(  7)    *x21*x31        
     8  +coeff(  8)*x11        *x41    
      g2_phi         =g2_phi         
     9  +coeff(  9)    *x21    *x41    
     1  +coeff( 10)    *x22            
     2  +coeff( 11)    *x22    *x41    
     3  +coeff( 12)*x11*x22*x31        
     4  +coeff( 13)    *x21        *x51
     5  +coeff( 14)        *x32        
     6  +coeff( 15)*x12                
     7  +coeff( 16)*x11*x21            
     8  +coeff( 17)        *x32*x41    
      g2_phi         =g2_phi         
     9  +coeff( 18)    *x22*x31        
     1  +coeff( 19)*x11*x22            
     2  +coeff( 20)*x11*x22    *x41    
     3  +coeff( 21)            *x42    
     4  +coeff( 22)        *x33        
     5  +coeff( 23)        *x31*x42    
     6  +coeff( 24)*x11    *x32        
     7  +coeff( 25)    *x21*x32        
     8  +coeff( 26)    *x21    *x42    
      g2_phi         =g2_phi         
     9  +coeff( 27)*x12    *x31        
     1  +coeff( 28)*x12        *x41    
     2  +coeff( 29)*x11*x21    *x41    
     3  +coeff( 30)    *x23            
     4  +coeff( 31)        *x34        
     5  +coeff( 32)        *x33*x41    
     6  +coeff( 33)        *x31*x43    
     7  +coeff( 34)    *x22    *x42    
     8  +coeff( 35)                *x51
      g2_phi         =g2_phi         
     9  +coeff( 36)        *x32*x44    
     1  +coeff( 37)        *x31    *x51
     2  +coeff( 38)    *x22*x32*x42    
     3  +coeff( 39)    *x21*x31    *x51
     4  +coeff( 40)    *x21    *x41*x51
     5  +coeff( 41)*x11*x21        *x51
     6  +coeff( 42)            *x43*x51
     7  +coeff( 43)*x11*x21    *x41*x51
     8  +coeff( 44)        *x31*x41    
      g2_phi         =g2_phi         
     9  +coeff( 45)            *x43    
     1  +coeff( 46)*x12*x21            
     2  +coeff( 47)*x11    *x33        
     3  +coeff( 48)    *x21*x32*x41    
     4  +coeff( 49)    *x22*x32        
     5  +coeff( 50)    *x22*x31*x41    
     6  +coeff( 51)*x11*x21    *x42    
     7  +coeff( 52)    *x24            
     8  +coeff( 53)    *x23    *x42    
      g2_phi         =g2_phi         
     9  +coeff( 54)*x13*x21*x31        
     1  +coeff( 55)    *x24    *x41    
     2  +coeff( 56)            *x41*x51
     3  +coeff( 57)    *x22*x31    *x51
     4  +coeff( 58)    *x23        *x51
     5  +coeff( 59)        *x32*x42    
     6  +coeff( 60)*x12    *x32        
     7  +coeff( 61)*x12    *x31*x41    
     8  +coeff( 62)*x11*x21*x31*x41    
      g2_phi         =g2_phi         
     9  +coeff( 63)*x13    *x31        
     1  +coeff( 64)    *x23    *x41    
     2  +coeff( 65)*x14                
     3  +coeff( 66)*x11*x21*x33        
     4  +coeff( 67)    *x22*x33        
     5  +coeff( 68)*x12*x21*x32        
     6  +coeff( 69)*x11*x22*x31*x41    
     7  +coeff( 70)    *x23*x31*x41    
     8  +coeff( 71)*x11*x22    *x42    
      g2_phi         =g2_phi         
     9  +coeff( 72)*x14        *x41    
     1  +coeff( 73)*x12*x22    *x41    
     2  +coeff( 74)*x14*x21            
     3  +coeff( 75)*x11*x24            
     4  +coeff( 76)*x11            *x51
     5  +coeff( 77)*x12*x22    *x42    
     6  +coeff( 78)*x13*x22*x32        
     7  +coeff( 79)    *x21*x32    *x51
     8  +coeff( 80)    *x21*x31*x41*x51
      g2_phi         =g2_phi         
     9  +coeff( 81)    *x21    *x42*x51
     1  +coeff( 82)*x11*x21*x31    *x51
     2  +coeff( 83)    *x22    *x41*x51
     3  +coeff( 84)    *x23    *x41*x51
     4  +coeff( 85)*x11*x23        *x51
     5  +coeff( 86)*x11    *x31*x41    
     6  +coeff( 87)    *x21*x31*x41    
     7  +coeff( 88)*x13                
     8  +coeff( 89)            *x44    
      g2_phi         =g2_phi         
     9  +coeff( 90)    *x21*x33        
     1  +coeff( 91)*x12*x21*x31        
     2  +coeff( 92)*x13*x21            
     3  +coeff( 93)*x11*x23            
     4  +coeff( 94)    *x21    *x44    
     5  +coeff( 95)*x12    *x32*x41    
c
      return
      end
      function g2_y00         (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff( 96)
      data ncoeff/ 95/
      data avdat/ -0.4600934E-04/
      data xmin/
     1 -0.68569E+00,-0.19059E-01,-0.34704E-01,-0.42451E-01,-0.49994E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59028E+00, 0.17631E-01, 0.23644E-01, 0.21098E-01, 0.49996E-02,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.30954403E-02, 0.20079296E-01, 0.16597565E-01,-0.46547426E-04,
     +  0.11961068E-02, 0.35603675E-02,-0.11640365E-01, 0.46180990E-02,
     + -0.26549084E-01, 0.40698543E-01, 0.14713065E-01, 0.41792099E-02,
     + -0.12793199E-01,-0.45389059E-03,-0.95088715E-02, 0.11967191E-01,
     + -0.74451133E-02,-0.26960543E-03,-0.11779435E-02,-0.24260150E-02,
     +  0.32575042E-02,-0.29123593E-02,-0.69405735E-02,-0.20306914E-03,
     + -0.44774529E-03, 0.21755613E-01,-0.11796856E-01,-0.11687300E-02,
     + -0.25259387E-01,-0.40960661E-03, 0.84564061E-03, 0.30731547E-03,
     +  0.94986788E-03, 0.88102771E-02,-0.51190583E-02,-0.16609700E-02,
     +  0.69212876E-02,-0.16087410E-02,-0.32653464E-02, 0.11074119E-03,
     +  0.33508851E-02, 0.34653600E-02, 0.16926064E-02,-0.61121564E-02,
     +  0.25736781E-01, 0.72179892E-03,-0.62583457E-02, 0.15007762E-01,
     +  0.85038373E-04,-0.22159857E-04,-0.61484275E-03,-0.38230706E-02,
     + -0.63001871E-03, 0.18188791E-01,-0.73223549E-03, 0.41818810E-02,
     + -0.39581144E-02, 0.82225475E-03,-0.38246149E-02,-0.45612486E-03,
     +  0.28640397E-02, 0.94141095E-03, 0.33944882E-02,-0.69999355E-02,
     +  0.91954553E-03, 0.87411394E-02,-0.15892584E-01,-0.12044081E-01,
     +  0.95894868E-02,-0.49168250E-03, 0.61334581E-02,-0.26019443E-01,
     +  0.24818216E-01, 0.23587381E-02, 0.15731419E-01, 0.31388534E-03,
     +  0.27916746E-03, 0.26868610E-01,-0.14711154E-01, 0.19723200E-02,
     +  0.25976481E-03,-0.67195669E-03,-0.40818118E-02,-0.37710476E-02,
     + -0.10584322E-01,-0.87944949E-02, 0.72410558E-02,-0.26261664E-02,
     +  0.34228829E-02,-0.12398846E-01,-0.47391574E-02, 0.21087267E-01,
     +  0.63362611E-02, 0.26654915E-02,-0.20483565E-01,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
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
      x31 = x3
      x32 = x31*x3
      x33 = x32*x3
      x41 = x4
      x42 = x41*x4
      x43 = x42*x4
      x51 = x5
c
c                  function
c
      g2_y00         =avdat
     1  +coeff(  1)                    
     2  +coeff(  2)        *x31        
     3  +coeff(  3)            *x41    
     4  +coeff(  4)*x11                
     5  +coeff(  5)    *x21            
     6  +coeff(  6)        *x32        
     7  +coeff(  7)        *x31*x41    
     8  +coeff(  8)            *x42    
      g2_y00         =g2_y00         
     9  +coeff(  9)*x11    *x31        
     1  +coeff( 10)*x11        *x41    
     2  +coeff( 11)    *x21    *x41    
     3  +coeff( 12)*x12                
     4  +coeff( 13)    *x22            
     5  +coeff( 14)        *x33        
     6  +coeff( 15)        *x32*x41    
     7  +coeff( 16)        *x31*x42    
     8  +coeff( 17)            *x43    
      g2_y00         =g2_y00         
     9  +coeff( 18)                *x51
     1  +coeff( 19)*x11    *x32        
     2  +coeff( 20)    *x21*x32        
     3  +coeff( 21)*x11    *x31*x41    
     4  +coeff( 22)    *x21*x31*x41    
     5  +coeff( 23)*x11        *x42    
     6  +coeff( 24)*x12    *x31        
     7  +coeff( 25)*x11*x21*x31        
     8  +coeff( 26)    *x22*x31        
      g2_y00         =g2_y00         
     9  +coeff( 27)*x12        *x41    
     1  +coeff( 28)*x11*x21    *x41    
     2  +coeff( 29)    *x22    *x41    
     3  +coeff( 30)        *x31    *x51
     4  +coeff( 31)            *x41*x51
     5  +coeff( 32)*x12*x21            
     6  +coeff( 33)*x11*x22            
     7  +coeff( 34)    *x21*x33        
     8  +coeff( 35)*x11    *x32*x41    
      g2_y00         =g2_y00         
     9  +coeff( 36)*x11    *x31*x42    
     1  +coeff( 37)    *x21*x31*x42    
     2  +coeff( 38)*x11        *x43    
     3  +coeff( 39)    *x21    *x43    
     4  +coeff( 40)*x11            *x51
     5  +coeff( 41)    *x21        *x51
     6  +coeff( 42)*x11*x21*x32        
     7  +coeff( 43)*x12    *x31*x41    
     8  +coeff( 44)*x11*x21*x31*x41    
      g2_y00         =g2_y00         
     9  +coeff( 45)    *x22*x31*x41    
     1  +coeff( 46)*x12        *x42    
     2  +coeff( 47)    *x22    *x42    
     3  +coeff( 48)        *x32*x43    
     4  +coeff( 49)        *x32    *x51
     5  +coeff( 50)        *x31*x41*x51
     6  +coeff( 51)*x12*x21*x31        
     7  +coeff( 52)*x11*x22*x31        
     8  +coeff( 53)*x12*x21    *x41    
      g2_y00         =g2_y00         
     9  +coeff( 54)*x11*x22    *x41    
     1  +coeff( 55)*x11    *x33*x41    
     2  +coeff( 56)    *x21*x33*x41    
     3  +coeff( 57)*x11    *x32*x42    
     4  +coeff( 58)*x11    *x31*x43    
     5  +coeff( 59)    *x21*x31    *x51
     6  +coeff( 60)*x11        *x41*x51
     7  +coeff( 61)    *x21    *x41*x51
     8  +coeff( 62)*x12*x22            
      g2_y00         =g2_y00         
     9  +coeff( 63)*x12    *x33        
     1  +coeff( 64)    *x22*x33        
     2  +coeff( 65)*x12    *x32*x41    
     3  +coeff( 66)*x11*x21*x32*x41    
     4  +coeff( 67)    *x22*x32*x41    
     5  +coeff( 68)*x12    *x31*x42    
     6  +coeff( 69)    *x22*x31*x42    
     7  +coeff( 70)*x11*x21        *x51
     8  +coeff( 71)*x12*x21*x31*x41    
      g2_y00         =g2_y00         
     9  +coeff( 72)*x11*x22*x31*x41    
     1  +coeff( 73)*x11*x22    *x42    
     2  +coeff( 74)    *x21*x33*x42    
     3  +coeff( 75)*x11    *x32*x43    
     4  +coeff( 76)*x11    *x32    *x51
     5  +coeff( 77)    *x21*x32    *x51
     6  +coeff( 78)*x11*x21*x32*x42    
     7  +coeff( 79)    *x22*x32*x42    
     8  +coeff( 80)*x11*x21*x31    *x51
      g2_y00         =g2_y00         
     9  +coeff( 81)    *x22*x31    *x51
     1  +coeff( 82)*x12        *x41*x51
     2  +coeff( 83)*x11*x21    *x41*x51
     3  +coeff( 84)*x12*x21*x33        
     4  +coeff( 85)*x12*x21*x32*x41    
     5  +coeff( 86)*x11*x22*x32*x41    
     6  +coeff( 87)*x12*x21*x31*x42    
     7  +coeff( 88)*x12*x21    *x43    
     8  +coeff( 89)*x11    *x33*x43    
      g2_y00         =g2_y00         
     9  +coeff( 90)*x12*x22    *x42    
     1  +coeff( 91)*x12*x21*x33*x41    
     2  +coeff( 92)*x12*x21*x31*x43    
     3  +coeff( 93)*x12*x22*x33        
     4  +coeff( 94)*x12*x22    *x43    
     5  +coeff( 95)    *x21*x31        
c
      return
      end
      function g2_txfit       (x,m)
      dimension x(m)
      dimension xmin(10),xmax(10),scale(10),xmean(10)
      dimension coeff(  4)
      data ncoeff/  3/
      data avdat/  0.7736222E-02/
      data xmin/
     1 -0.54874E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data xmax/
     1  0.59260E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00,
     2  0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00, 0.00000E+00/
      data scale /10*0./
      data coeff/
     + -0.35736463E-02, 0.10081282E+00,-0.10336473E-02,
     +      0.      /
      data ientry/0/
c
      if (ientry.ne.0) go to 10
      ientry=1
      do 5 i=1,m
      if (xmin(i).eq.xmax(i)) go to 5
      scale(i)=2./(xmax(i)-xmin(i))
   5  continue
c
  10  continue
c      normalize variables between -1 and +1
      x1 =1.+(x(  1)-xmax(  1))*scale(  1)
c          set up monomials   functions
      x11 = x1
      x12 = x11*x1
c
c                  function
c
      g2_txfit       =avdat
     1  +coeff(  1)    
     2  +coeff(  2)*x11
     3  +coeff(  3)*x12
c
      return
      end
