#fuctia returneaza elementul care apare de 2 ori in vector
def elementDublu(vector):
    n = len(vector)
    #se calculeaza suma elementelor consecutive care apar doar o singura data
    suma_total = n*(n-1)//2
    #se calculeaza suma elementelor date care include si elementul dublu
    suma_vector = sum(vector)
    #elementul dublu este diferenta dintre suma elementelor listei date si suma elementelor consecutive
    element=suma_vector-suma_total
    return element
assert  (elementDublu([1,1])==1)
assert (elementDublu([1,2,3,4,5,6,7,8,4,9]) == 4)
assert (elementDublu([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,12,17,18]) == 12)  
