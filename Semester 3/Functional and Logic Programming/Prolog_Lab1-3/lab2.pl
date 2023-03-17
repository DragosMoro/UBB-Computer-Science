/*
maxim(l1,l2...ln) = {  -5000, if l1,l2...ln is empty
                      maxim(l2,l3,...ln) , l1<maxim(l2,l3...ln)
                      l1, l1>=maxim(l2,l3..ln)


}
detPoz(e, n, l1,l2...ln) = { [], if l1,l2,...ln is null
                             n reunit cu detPoz(e,n+1,l2..ln), l1=e
                              detPoz(e,n+1,l2..ln), else
                             }
pozitii(l1,l2..ln) = { [], if l1...ln is null
                       detPoz(maxim(l1...ln), 1, l1..ln), else

}
pozitiiB(l1,l2...ln) = { [], if l1...ln is null
                         pozitii(l1) reunit pozitiiB(l2,l3..ln), if l1 is list
                         l1 reunit pozitiiB(l2,l3...ln) if l1 is a
                         number }
maxim(list,integer) %(i,o)

detPoz(el,integer,list,list) %(i,i,i,o)

pozitii(list,list) %(i,o)

pozitiiB(list,list) %(i,o)


*/
maxim([],-5000).
maxim([H|T],M):-maxim(T,M),
H<M,!.
maxim([H|_],H).
detPoz(_,_,[],[]).
detPoz(E,N,[E|T],[N|L]):-!,
N1 is N+1,
detPoz(E,N1,T,L).
detPoz(E,N,[_|T],L):-N1 is N+1,
detPoz(E,N1,T,L).
pozitii([],[]).
pozitii(L,L1):-maxim(L,M),
detPoz(M,1,L,L1).
pozitiiB([],[]).
pozitiiB([H|T],L):-  is_list(H),
pozitii(H,L3),
pozitiiB(T,L2),
L=[L3|L2].
pozitiiB([H|T],L):-  number(H),
pozitiiB(T,L2),
L=[H|L2].



    /*
exemple:
maxim([],X). -> X=-5000
maxim([1,2,321,4,2,1],X). -> X = 321
maxim([0,0,0,0,0,0,0],X). -> X = 0
detPoz(13,1,[1,13,2,13,5,3,13], L). -> L = [2, 4, 7]
detPoz(12,1,[1,13,2,13,5,3,13], L). -> L = []
pozitii([12,3,4,234,6,2,1], L). -> L = [4]
pozitii([12,3,4,12,6,12,1], L). -> L = [1, 4, 6]
pozitiiB([1,2,[31,33,5,11,33], 5, 81, [21,4, 3]], L). -> L = [1, 2, [2, 5], 5, 81, [1]]
pozitiiB([], L). -> L=[]
*/
