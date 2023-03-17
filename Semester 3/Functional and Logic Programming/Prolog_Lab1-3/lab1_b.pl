%cmmdc(A:integer, B:integer, L:integer)
%cmmdcl(L:lista, A:integer)
%cmmdc(A,B,L) = { 0, if A=B=0
%                 E, if (A=E && B=0) || (A=0 && B=E) || (A=B=E)
%                 cmmdc(A,B % A, L), if A>B && B>0
%                 cmmdc(A%B, B, L), if B>A && A>0
%}
%cmmdcl(L,A) = { 0, if L=[]
%                cmmdcl(sublista(L), D) && cmmdc(D,prim(L)), else
%}
%
cmmdc(0,0,0) :- !.
cmmdc(0, E, E) :- !.
cmmdc(E, 0, E) :- !.
cmmdc(X, X, X) :- !.
cmmdc(A, B, L) :-
    A>0,
    A < B,!,
    L1 is B mod A,
    cmmdc(A, L1, L).
cmmdc(A, B, L) :-
    B>0,
    A>B,
    L1 is A mod B,
    cmmdc(B, L1, L).
cmmdcl([], 0).
cmmdcl([H|T], C) :-
    cmmdcl(T, D),
    cmmdc(D, H, C).

%cmmdc(0,0,L)=> L=0;
%cmmdc(0,6,L)=> L=6;
%cmmdc(6,0,L)=> L=6;
%cmmdc(12,12,L) => L=12;
%cmmdc (24,64,L) => L=8;
%cmmdc(15,27,L) => L=3;
%cmmdcl([], L) => L=0;
%cmmdcl([22,40, 6], L) => L = 2;




