def elementeUnice(v):
    v= v.split()
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

def mainFunc(v):
    d = elementeUnice(v)
    s="" 
    #returnam elemetele care apar o singura data in sir
    for i in d:
        if(d[i] == 1):
           s+=i+" "
    return s

assert(mainFunc('ana ana') == "")
assert(mainFunc('ana ana are mere si pere si altceva') == "are mere pere altceva ")
assert(mainFunc('ana va va va va va va va va va va va da nu am ce sa mai zic aia este viata fratele meu eu ma joc sotron') == "ana da nu am ce sa mai zic aia este viata fratele meu eu ma joc sotron ")
