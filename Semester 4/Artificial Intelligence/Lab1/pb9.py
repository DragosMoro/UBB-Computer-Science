def sumaSubMatrici(matrice, perechi):
    rezultat = []
    for pereche in perechi:
        p, q = pereche[0], pereche[1]
        r, s = pereche[2], pereche[3]
        suma = 0
        #calculam suma submatricilor determinate de coordonatele date
        for i in range(p, r+1):
            for j in range(q, s+1):
                suma += matrice[i][j]
        rezultat.append(suma)
    return rezultat

assert(sumaSubMatrici([[0, 2, 5, 4, 1],
[4, 8, 2, 3, 7],
[6, 3, 4, 6, 2],
[7, 3, 1, 8, 3],
[1, 5, 7, 9, 4]],[[1,1,3,3], [2,2,4,4]])==[38, 44])
assert(sumaSubMatrici([[0,1,2],
[4, 8, 2],
[6, 3, 5],
],[[0,0,1,1]])==[13])

assert(sumaSubMatrici([[8, 9, 3, 0, 1, 3, 5, 7, 1, 4], 
                       [4, 0, 0, 0, 5, 4, 1, 1, 0, 4], 
                       [4, 0, 4, 7, 9, 6, 6, 9, 6, 5], 
                       [6, 8, 4, 0, 7, 8, 3, 7, 4, 7], 
                       [9, 9, 6, 8, 5, 7, 0, 0, 9, 9], 
                       [5, 3, 8, 8, 5, 9, 2, 3, 2, 1], 
                       [8, 3, 7, 3, 8, 6, 6, 3, 0, 7], 
                       [3, 4, 0, 5, 5, 9, 1, 7, 1, 8], 
                       [1, 7, 2, 2, 8, 0, 5, 6, 5, 5], 
                       [6, 7, 2, 8, 6, 8, 5, 6, 5, 3]],
                      [[0,0,3,3],[4,4,8,8],[2,2,9,9]])==[57, 112, 326])


