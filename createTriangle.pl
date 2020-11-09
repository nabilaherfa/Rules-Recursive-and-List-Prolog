createTriangle(1) :- write('*').
createTriangle(X) :- X =< 0,!.
createTriangle(X) :- count(1, X), Y = X-1, nl, createTriangle(Y).
count(X,Z) :- X =< Z, write('*'), X1 = X+1, count(X1, Z).
count(X,Z) :- X > Z, !.