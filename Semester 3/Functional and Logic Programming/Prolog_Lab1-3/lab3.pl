% 6.Sa se genereze toate sirurile de nparanteze ce se inchid corect.
% Exemplu: n=4 sunt 2 solutii: (()) si ()() ex: n=4 => (()) and () ()

paranteza('(').
paranteza(')').

% check(l1...ln, c) =
%	check(l2...ln, c + 1), l1 = '('
%	check(l2...ln, c - 1), l1 = ')' si c > 0

% check(L:lista, C:numar)
% check(i, i)

check([], 0).
check([H|T], C) :-
    H == '(',
    NC is C + 1,
    check(T, NC).
check([H|T], C) :-
    H == ')',
    C > 0,
    NC is C - 1,
    check(T, NC).

% allcombinations(n, i, c) =
%	c, i = n
%	allcombinations(n, i + 1, paranteza(x) + c), else

% allcombinations(N:numar, I:numar, C:lista, R:lista)
% allcombinations(i, i, i, o)

allcombinations(N, N, C, C) :- !.
allcombinations(N, I, C, R) :-
    paranteza(X),
    NI is I + 1,
    allcombinations(N, NI, [X|C], R).

% onesolution(N:numar, R:lista)
% onesolution(i, o)
% onesolution(N)={check(R,0), if allcombinations(N,0,[])}
onesolution(N, R) :-
    allcombinations(N, 0, [], R),
    check(R, 0).

% allsolutions(N:numar, R:lista)
% allsolutions(i, o)
allsolutions(N)= {onesolution}
allsolutions(N, R) :-
    findall(RPartial, onesolution(N, RPartial), R).
