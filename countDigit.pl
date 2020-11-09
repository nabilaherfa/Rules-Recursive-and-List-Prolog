/* Program Count Digit */
/* countDigit(A,X) : X merupakan banyak digit dari A /

countDigit(0, 1).
countDigit(X, 1) :- X < 10. 
countDigit(X, Y) :- Z is (X / 10), countDigit(Z, A), Y is (A + 1).
