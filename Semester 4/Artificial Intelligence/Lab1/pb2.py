import math
#aceasta functie returneaza distanta euclidiana dintre coordonate
def distanta(x1,y1,x2,y2):
    return math.sqrt(abs((x2 - x1)) ** 2 + abs((y2 - y1)) ** 2)


assert(distanta(1,1,1,1)==0)
assert(distanta(12,22,16,18)== 5.656854249492381)
assert(distanta(122,206,222,602) == 408.431144747802)