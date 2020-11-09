/* */
concatenate(L, L2, 0, 0, []).
concatenate(L, [H|T], 0, Y, [H|L3]) :- Y>0, Y0 is Y-1, concatenate(L,T,0,Y0,L3).
concatenate([H|T], L2, X, Y, [H|L3]) :- X>0, X0 is X-1, concatenate(T,L2,X0,Y,L3).
