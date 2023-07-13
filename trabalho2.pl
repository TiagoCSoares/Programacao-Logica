sudoku(S) :- resolve(S), mostraSolucao(S).

resolve(S) :- 
    resolveLinhas(S),
    resolveColunas(S),
    resolveQuadros(S).

resolveLinhas([]) :- !.
resolveLinhas([A|B]) :- diferente(A), resolveLinhas(B).

diferente([A, B, C, D]) :- 
   num(A), num(B), num(C), num(D), 
   A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

num(1).
num(2).
num(3).
num(4).



resolveColunas([],[],[],[]) :- !.
resolveColunas([[P1|X1],[P2|X2],[P3|X3],[P4|X4]]) :-
  diferente([P1,P2,P3,P4]),resolveColuna2([X1,X2,X3,X4]).

resolveColuna2([[S1|X1],[S2|X2],[S3|X3],[S4|X4]]) :- 
  diferente([S1,S2,S3,S4]), resolveColuna3([X1,X2,X3,X4]).

resolveColuna3([[T1|X1],[T2|X2],[T3|X3],[T4|X4]]) :- 
  diferente([T1,T2,T3,T4]), resolveColuna4([X1,X2,X3,X4]).

resolveColuna4([[Q1],[Q2],[Q3],[Q4]]) :- 
  diferente([Q1,Q2,Q3,Q4]).


resolveQuadros([],[],[],[]) :- !.
resolveQuadros([[A1,A2|X1],[B1,B2|X2],X3,X4]) :-
  diferente([A1,A2,B1,B2]), resolveQuadro2([X1,X2,X3,X4]).

resolveQuadro2([[A3,A4|_],[B3,B4|_],X3,X4]) :-
  diferente([A3,A4,B3,B4]), resolveQuadro3([_,_, X3,X4]).

resolveQuadro3([_,_,[C1,C2|X3],[D1,D2|X4]]) :-
  diferente([C1,C2,D1,D2]), resolveQuadro4([_,_,X3,X4]).

resolveQuadro4([_,_,[C3,C4|_],[D3,D4|_]]) :-
  diferente([C3,C4,D3,D4]).



mostraSolucao([]):- !.
mostraSolucao([A|B]) :- 
    mostraLinha(A), nl, mostraSolucao(B).

mostraLinha([]) :- !.
mostraLinha([A|B]) :- 
    write(A), write(' '), mostraLinha(B).

%   Exemplo de consulta:
%   -------------------
%?- sudoku([[4,_,_,_],[_,3,_,_],[_,_,1,_],[_,1,_,2]]).