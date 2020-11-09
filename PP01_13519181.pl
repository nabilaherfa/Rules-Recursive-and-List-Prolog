/*Untuk File .pl*/
/* Nabilah Erfariani */
/* 13519181 */

/* Bagian <1> */
/* Fakta, Rule, dan Query */
/* Deklarasi Fakta */

/* pria(X) : X adalah pria */
pria(yoga).
pria(jovan).
pria(zunan).
pria(farras).
pria(smallFaris).
pria(zaynMalik).
pria(william).
pria(babyThajeb).
pria(padil).

/* wanita(X) : X adalah wanita */
wanita(lisa).
wanita(siti).
wanita(asin).
wanita(nurbaya).
wanita(rikha).

/* usia(X,Y) : X berusia Y */
usia(yoga,71).
usia(lisa,65).
usia(jovan,24).
usia(zunan,30).
usia(farras,32).
usia(smallFaris,6).
usia(zaynMalik,56).
usia(asin,51).
usia(siti,26).
usia(william,28).
usia(babyThajeb,3).
usia(padil,58).
usia(rikha,40).
usia(nurbaya,24).

/* menikah(X,Y) : X menikah dengan Y */
menikah(yoga,lisa).
menikah(lisa,yoga).
menikah(zaynMalik,asin).
menikah(asin,zaynMalik).
menikah(padil,rikha).
menikah(rikha,padil).
menikah(farras,siti).
menikah(siti,farras).
menikah(william,nurbaya).
menikah(nurbaya,william).

/* anak(X,Y) : X adalah anak Y */
anak(jovan,yoga).
anak(jovan,lisa).
anak(farras,yoga).
anak(farras,lisa).
anak(zunan,yoga).
anak(zunan,lisa).
anak(siti,zaynMalik).
anak(siti,asin).
anak(william,zaynMalik).
anak(william,asin).
anak(nurbaya,padil).
anak(nurbaya,rikha).
anak(smallFaris,farras).
anak(smallFaris,siti).
anak(babyThajeb,william).
anak(babyThajeb,nurbaya).

/* saudara(X,Y) : X adalah saudara kandung Y */
saudara(zunan,farras).
saudara(zunan,jovan).
saudara(jovan,zunan).
saudara(jovan,farras).
saudara(siti,william).
saudara(william,siti).
saudara(farras,zunan).
saudara(farras,jovan).


/* Deklarasi Rules*/

/* kakak(X,Y) : X adalah kakak dari Y (baik perempuan maupun lelaki) */
kakak(X,Y) :- 
    saudara(X,Y),
    usia(X,A), 
    usia(Y,B), 
    A > B, /* umur X lebih besar dari umur Y */
    X \= Y. /* X tidak sama dengan Y */

/* keponakan(X,Y) : X adalah keponakan dari Y */
keponakan(X,Y) :- 
    anak(X,Z), 
    saudara(Z,Y). /* Y adalah saudara dari orang tua X */

/* suami(X,Y) : X adalah suami dari Y */
suami(X,Y) :- 
    menikah(X,Y),
    pria(X),
    wanita(Y).

/* sepupu(X,Y) : X adalah sepupu dari Y */
sepupu(X,Y) :- 
    anak(X,Z), 
    anak(Y,B), 
    saudara(Z,B). /* Orang tua X dan Y adalah saudara kandung */

/* mertua(X,Y) : X adalah mertua dari Y */
mertua(X,Y) :- 
    menikah(A,Y),  
    anak(A,X). /* anak X menikah dengan Y */

/* bibi(X,Y) : X adalah bibi dari Y */
bibi(X,Y) :- 
    saudara(X,Z), /* X bersaudara kandung dengan ibu Y */ 
    wanita(X), 
    anak(Y,Z). 

/* cucu(X,Y) : X adalah cucu dari Y */
cucu(X,Y) :- 
    anak(X,Z), 
    anak(Z, Y). /* Orang tua X adalah anak dari Y */ 

/* anaksulung(X) : X adalah anak paling tua */
anaksulung(X) :- 
    anak(X,Y), 
    wanita(Y), 
    \+kakak(_,X). /* X tidak punya kakak atau X anak tunggal */

/* anakbungsu(X) : X adalah anak paling muda */
anakbungsu(X) :- 
    anak(X,Y), 
    wanita(Y), 
    \+kakak(X,_). /* X tidak punya adik atau X anak tunggal */

/* Bagian <2> */
/* Rekurens */

/* 1. Program Faktorial */
/* X merupakan hasil perkalian bilangan bulat dari 1 hingga N dengan ketentuan N >= 1. */
faktorial(0,1).
faktorial(X,Y) :- X > 0, Z is X - 1, faktorial(Z,A), Y is X * A.

/* 2. Program GCD */
/* gcd(A,B,X) : X adalah greatest common divisor dari A dan B. */
gcd(0, X, X) :- !.
gcd(X, 0, X) :- !.
gcd(X, X, X) :- !.
gcd(Z, A, X) :- A>Z, Y is A-Z, gcd(Z, Y, X).
gcd(Z, A, X) :- A<Z, Y is Z-A, gcd(Y, A, X).

/* 3. Program Power*/
/* power(A,B,X) : X adalah hasil A dipangkatkan dengan B */    
power(X,0,1).
power(X,Y,Z) :- Z is X**Y. 

/* 4. Program Count Digit */
/* countDigit(A,X) : X merupakan banyak digit dari A */
countDigit(0, 1).
countDigit(X, 1) :- X < 10. 
countDigit(X, Y) :- Z is (X / 10), countDigit(Z, A), Y is (A + 1).

/* 5. Program Create Triangle */
/* createTriangle(X) : Menuliskan sebuah pola segitiga siku-siku seperti pada contoh. */
createTriangle(1) :- write('*').
createTriangle(X) :- X =< 0,!.
createTriangle(X) :- count(1, X), Y = X-1, nl, createTriangle(Y).
count(X,Z) :- X =< Z, write('*'), X1 = X+1, count(X1, Z).
count(X,Z) :- X > Z, !.

/* Bagian <3> */
/* List */

/* 1. Program Queue */
/* Queue merupakan struktur data dalam ilmu komputer yang memiliki prinsip FIFO (First In First Out) */

/* Operasi-operasi dasar queue adalah */

/* Push: menambahkan elemen ke belakang Queue sesuai aturan FIFO */
/* push(Element, Queue, Result) memasukkan element ke dalam queue, kemudian menghasilkan result. */
push(X, [], [X]).
push(X, [Y|Z], [Y|Zbaru]) :- push(X, Z, Zbaru).

/* Pop: menghapus elemen terdepan dari Queue sesuai aturan FIFO */
/* pop(Queue, Result) menghapus elemen terdepan dari queue, kemudian menghasilkan result */
pop([X|Y], Y).

/* Front: mengembalikan elemen terdepan dari Queue */
/* front(Queue, Result) mengembalikan elemen terdepan dari queue sebagai result */
front([X|Y], X).

/* Back: mengembalikan element terbelakang dari Queue */
/* back(Queue, Result) mengembalikan elemen terbelakang dari queue sebagai result */
back([X|T], Last) :- back2(T, X, Last).
back2([], Last, Last).
back2([X|T], _, Last) :- back2(T, X, Last).

/* 2. Concatenation */
/* concatenate(Flist, Slist, X, Y, Result): terdapat 2 buah list dan 2 buah angka, Flist akan diambil elemen sepanjang X, 
Slist akan diambil elemen sepanjang Y, 
kemudian keduanya akan digabung menjadi Result.*/
concatenate(Flist, Slist, 0, 0, []).
concatenate(Flist, [H|T], 0, Y, [H|List3]) :- Y>0, Y0 is Y-1, concatenate(Flist,T,0,Y0,List3).
concatenate([H|T], Slist, X, Y, [H|List3]) :- X>0, X0 is X-1, concatenate(T,Slist,X0,Y,List3).

/* 3. Palindrom */
/* Palindrom(List) : Rule digunakan untuk mengecek apakah sebuah list yaitu list palindrom atau tidak. */
palindrom([]).
palindrom([X]).
palindrom([X|Y]) :- acceptedreverse(List, X, Y), palindrom(List).
/* Buat fungsi acceptedreverse */
acceptedreverse([], X, [X]).
acceptedreverse([Head|Y], X, [Head|Y1]) :- acceptedreverse(Y, X, Y1).





