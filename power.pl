/* Program Power*/
/*power(A,B,X) : X adalah hasil A dipangkatkan dengan B*/     
power(X,0,1).
power(X,Y,Z) :- Y>0, Y1 is Y-1, power(X,Y1,Z1), Z is (Z1*X).
