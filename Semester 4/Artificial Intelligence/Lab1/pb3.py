
def produsScalar(v1,v2):
    suma=0
    #verificam daca au acelasi numar de elemente
    if(len(v1)==len(v2)):
        for i in range(0,len(v1)):
            #facem produsul scalar al vectorilor
            suma = suma + v1[i]*v2[i]
    return suma


assert (produsScalar([0], [0]) == 0)
assert (produsScalar([1,0,2,0,3], [1,2,0,3,1]) == 4)
assert(produsScalar([1,0,2,0,3,1,0,70,9,0,43,0,12,0,0,0,7,0], [0,2,0,3,1,1,0,70,9,0,0,21,2,0,12,0,7,0]) == 5058)

