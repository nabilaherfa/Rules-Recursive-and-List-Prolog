/* Program Power*/
/*power(A,B,X) : X adalah hasil A dipangkatkan dengan B*/     
power(X,0,1).
power(X,Y,Z) :- Z is X**Y. 
