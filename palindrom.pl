/* Program Palindrom */
/* palindrom(List) : Rule digunakan untuk mengecek apakah sebuah list yaitu list palindrom atau tidak.*/
/* Nabilah Erfariani(13519181) */

palindrom([]).
palindrom([X]).
palindrom([X|Y]) :- acceptedreverse(List, X, Y), palindrom(List).
/* Buat fungsi acceptedreverse */
acceptedreverse([], X, [X]).
acceptedreverse([Head|Y], X, [Head|Y1]) :- acceptedreverse(Y, X, Y1).