/* Program GCD */
/* gcd(A,B,X) : X adalah greatest common divisor dari A dan B. /

gcd(0, X, X) :- !.
gcd(X, 0, X) :- !.
gcd(X, X, X) :- !.
gcd(Z, A, X) :- A>Z, Y is A-Z, gcd(Z, Y, X).
gcd(Z, A, X) :- A<Z, Y is Z-A, gcd(Y, A, X).
