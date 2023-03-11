def ceiMaiMulti1(matrice):
    linii = len(matrice)
    coloane = len(matrice[0])
    index_nr_maxim_de_1 = 0
    index=coloane-1
    for i in range(0, linii):
      flag=0
      while(index >=0 and matrice[i][index]==1):
        flag=1 
        index-=1
        if(flag==1):
          index_nr_maxim_de_1 = i
      if index_nr_maxim_de_1==0 and matrice[0][coloane-1]==0:
        return 0
    return index_nr_maxim_de_1

assert(ceiMaiMulti1([[0,1],[1,1]]) == 1)
assert(ceiMaiMulti1([[0,0,0,1,1],
           [0,1,1,1,1],
           [0,0,1,1,1],
           [0,0,0,1,1]]) == 1)

assert(ceiMaiMulti1([[0,0,0,1,1,1,1,1],
           [0,0,0,1,1,1,1,1],
           [0,0,1,1,1,1,1,1],
           [0,0,0,1,1,1,1,1],
           [1,1,1,1,1,1,1,1],
           [0,0,0,0,0,0,0,0],
           [0,0,0,1,1,1,1,1],
           [0,1,1,1,1,1,1,1]]) == 4)
