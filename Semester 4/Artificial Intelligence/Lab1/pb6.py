def elementeUnice(v):
    #luam un dictionar pentru a retine si frecventa elementelor
    d=dict()
    for i in range (0,len(v)):
    #daca elementul exista deja, atunci incrementam frecventa
        if(v[i] in d.keys()):
            d[v[i]] +=1
        else:
            d[v[i]] =1
    #returnam dictionarul        
    return d


def cautareElementMajoritar(v):
    d = elementeUnice(v)
    n= len(v)//2
    #returnam elementul care are frecventa mai mare decat jumatate din lungimea sirului
    for i in d:
        if(d[i] >n):
          return i

assert(cautareElementMajoritar([1,2,1]) == 1)
assert(cautareElementMajoritar([2,4,2,5,2,7,2,2,2,5]) == 2)
assert(cautareElementMajoritar([2,4,2,5,2,7,2,2,2,5,4,3,1,3,5,5,3,2,2,54,2,201,21,3,4,5,2,43,2,1,2,4,2,2,2,24,2,1,2,2,1,2,2,2,2,4,2,2,2]) == 2)
"""
Algoritmul constă în parcurgerea șirului de la stânga la dreapta, păstrând un candidat și un contor. Inițial, candidatul este primul element din șir, iar contorul este 1. Pentru fiecare element următor din șir, dacă este egal cu candidatul curent, atunci contorul este incrementat cu 1, altfel contorul este decrementat cu 1. Dacă contorul ajunge la 0, candidatul este înlocuit cu elementul următor din șir, iar contorul este resetat la 1. La finalul parcurgerii, candidatul curent este candidatul final pentru elementul majoritar. Pentru a verifica dacă candidatul este elementul majoritar, parcurgem din nou șirul și numărăm câte apariții are candidatul. Dacă apare de mai mult de n/2 ori, atunci candidatul este elementul majoritar, altfel nu există element majoritar în șir.
"""