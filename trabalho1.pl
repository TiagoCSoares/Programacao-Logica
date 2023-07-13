% Nome: Tiago Costa Soares
% Matrícula: 2020.1.08.017

pai(lázaro, maria).
pai(pedro, clys).
pai(pedro, seny).
pai(pedro, geraldo).
pai(pedro, carla).
pai(pedro, wilson).
pai(josé, antônio).
pai(josé, régis).
pai(josé, rozeni).
pai(josé, rosilei).
pai(josé, vanderlei).
pai(josé, renata).
pai(antônio, tiago).
pai(antônio, bruno).
pai(bruno, arthur).
pai(geraldo, otávio).
pai(geraldo, lívia).
pai(robson, rafaela).
pai(robson, ricardo).
pai(marcelo, ruan).
pai(marcelo, marcelojr).
pai(marcelojr, catarina).
pai(claudinei, larissa).
pai(claudinei, lucas).
pai(claudinei, daniel).

mae(lia, maria).
mae(maria, clys).
mae(maria, seny).
mae(maria, geraldo).
mae(maria, carla).
mae(maria, wilson).
mae(vera, antônio).
mae(vera, régis).
mae(vera, rozeni).
mae(vera, rosilei).
mae(vera, vanderlei).
mae(vera, renata).
mae(clys, tiago).
mae(clys, bruno).
mae(vitória, arthur).
mae(fátima, otávio).
mae(fátima, lívia).
mae(renata, rafaela).
mae(renata, ricardo).
mae(seny, ruan).
mae(seny, marcelojr).
mae(agatha, catarina).
mae(rozeni, larissa).
mae(rozeni, lucas).
mae(rozeni, daniel).


irmao(X,Y) :- pai(P,X), pai(P,Y), mae(M,X), mae(M,Y), X \= Y.

avo(A,X) :- pai(A,P), pai(P,X).
avo(A,X) :- pai(A,M), mae(M,X).

avoh(A,X) :- mae(A,P), pai(P,X).
avoh(A,X) :- mae(A,M), mae(M,X).

bisavo(B,X) :- pai(B,V), avo(V,X).
bisavo(B,X) :- pai(B,V), avoh(V,X).

bisavoh(B,X) :- mae(B,V), avo(V,X).
bisavoh(B,X) :- mae(B,V), avoh(V,X).

neto(N,X) :- pai(P,N), pai(X,P).
neto(N,X) :- pai(P,N), mae(X,P).
neto(N,X) :- mae(M,N), pai(X,M).
neto(N,X) :- mae(M,N), mae(X,M).

primo(X,Y) :- pai(P,X), pai(A,Y), irmao(A,P).
primo(X,Y) :- pai(P,X), mae(A,Y), irmao(A,P).
primo(X,Y) :- mae(P,X), pai(A,Y), irmao(A,P).
primo(X,Y) :- mae(P,X), mae(A,Y), irmao(A,P).

tio(T,X) :- pai(P,X), irmao(T,P).
tio(T,X) :- mae(M,X), irmao(T,M).