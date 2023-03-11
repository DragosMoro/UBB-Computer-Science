#se transforma numarul din baza 10 intr-un string in baza 2
def decimalInBinar(n):
    if n == 0:
        return '0'
    binar = ''
    while n > 0:
        binar = str(n % 2) + binar
        n //= 2
    return binar

def mainBinar(nr):
    l=[]
    #se afiseaza elementele mai mici sau egale decat numarul dat 
    for i in range(1,nr+1):
        l.append(decimalInBinar(i))
    return l
assert(mainBinar(2) == ['1', '10'])    
assert(mainBinar(10) == ['1', '10', '11', '100', '101', '110', '111', '1000', '1001', '1010'])
assert(mainBinar(40) == ['1', '10', '11', '100', '101', '110', '111', '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111', '10000', '10001', '10010', '10011', '10100', '10101', '10110', '10111', '11000', '11001', '11010', '11011', '11100', '11101', '11110', '11111', '100000', '100001', '100010', '100011', '100100', '100101', '100110', '100111', '101000'])
