/* Program Faktorial */
/* X merupakan hasil perkalian bilangan bulat dari 1 hingga N dengan ketentuan N >= 1. /

faktorial(0,1).
faktorial(X,Y) :- X > 0, Z is X - 1, faktorial(Z,A), Y is X * A.
