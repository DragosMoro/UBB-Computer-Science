% !-ignora toate clauzele de mai jos
%
% adaug_sf(E:int, L1:list, L2:list)
% adauga elementul la sfarsitul listei
% invers(L1:list, L2:list)
% inverseaza o lista
% multime(l1...ln) = { [], if n=0
%                                 multime(l2...ln), membru(l1,l2...ln)
%                                 l1 (+) multime(l2...ln), else
%adaug_sf(E:int, l1...ln:list) = { [E], if n=0
                             adaug_sf(E, l2...ln), else
%                                 }
%invers(l1...ln) = {[], if n=0
%
%                                 adaug_sf(l1,l2...ln), else}
%}
membru(E, [E|_]) :- !.
membru(E, [_|T]) :- membru(E, T).
adaug_sf(E, [], [E]).
adaug_sf(E, [H|T], [H|T1]) :-
    adaug_sf(E, T, T1).
invers([], []).
invers([H|T], L) :-
    invers(T, L1),
    adaug_sf(H, L1, L).
multime([], []).
multime([H|T], [H|L]) :-
    not(membru(H, T)), !,
    multime(T, L).
multime([_|T], L) :-
    multime(T, L).


%adaug_sf(5,[],L) => L=[5];
%adaug_sf(323, [3,2,1,3,12,2,3], L) => L = [3, 2, 1, 3, 12, 2, 3, 323];
%invers([], L) => L = [];
%invers([22,5,43,56,8,32], L) => L = [32, 8, 56, 43, 5, 22];
%membru(4,[1,2,3,4,5,6]) => true;
%membru(4,[1,2,3,5,6]) => false;
% multime([1,2,3,4,5,2,6,4,32,67,8,3,2,67,8], M) => M = [1, 5, 6, 4, 32,
% 3, 2, 67, 8];
%multime([1,2,3,4,5,5,4,3,2,1], M) => M = [5, 4, 3, 2, 1];










