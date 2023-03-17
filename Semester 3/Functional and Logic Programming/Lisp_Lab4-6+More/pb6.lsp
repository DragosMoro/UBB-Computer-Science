
(defun myAppend (l1 l2)
  (cond
    ((null l1) l2)
    (t (cons (car l1) (myAppend (cdr l1) l2)))
  )
)

(defun twiceNthElem(l n pos)
  (cond
    ((null l) nil)
    ((equal n pos) (cons (car l) (cons (car l) (twiceNthElem (cdr l) n (+ 1 pos)))))
    (t (cons (car l) (twiceNthElem (cdr l) n (+ 1 pos))))
  )
)

(print(twiceNthElem '(1 2 3 4 5 6 7 8) 4 0))


;a)

(defun dublare(l n poz)
(cond
    ((null l) nil)
    ((equal n poz) (cons (car l) (cons (car l) (dublare (cdr l) n (+ 1 poz)))))
    (t(cons (car l) (dublare (cdr l) n (+ 1 poz))))
)
)

(print(dublare '(1 2 3 4 5 6 7 8) 4 0))

;model matematic
;
;functie(l1...ln, k1...kn) = {[], n=0
;                              
;
;
;
;}

(defun countLists(l)
  (cond
    ((null l) 1)
    ((listp (car l)) (+ (countLists (car l)) (countLists (cdr l))))
    (t (countLists (cdr l)))
  )
)
(print(countLists '(1 2 (3 (4 5 (6) 7) 8))))

(defun atomi(l contor)
(cond
    ((null l) contor)
    ((listp (car l)) (myAppend (atomi (car l) contor) (atomi (cdr l) contor)))
    ((atom (car l)) (atomi (cdr l) (+ 1 contor)))
    (t(atomi (cdr l) contor))
)
)

(defun lista_liniara(l)
(cond
    ((null l) t)
    ((listp (car l)) nil)
    (t (lista_liniara (cdr l)))
)

)
(print(lista_liniara '(1 2 4 (3) 8)))


(defun substituie(l e subs)
(cond 
    ((null l) nil)
    ((equal (car l) e) (cons subs (cdr l)))
    ((listp (car l)) (cons (substituie(car l) e subs) (cdr l)))
    (T(cons (car l) (substituie (cdr l) e subs)))
)
)
(print(substituie '((1 2) (3 4 5 6) 7 4 3 1) 3 22))


(defun substituie2(l e e1 niv)
(cond
(
(AND (atom l) (not (equal l e)))
l
)
(
(AND (atom l) (equal l e) (equal (mod niv 2) 0))
e
)
(
(AND (atom l) (equal l e) (equal (mod niv 2) 1))
e1
)
(
T
(mapcar #'(lambda (x)
(substituie2 x e e1 (+ niv 1))
)
l
)
)
)
)

(print(substituie2 '(1 2 (3 4 (3 6 (3 21) 9) 5 6) 7 4 3 1) 3 19 1))

(defun last_e(l)
(cond
    ((null l) nil)
    ((null (cdr l)) (car l))
    ((listp (car l)) (cons (last_e(car l))(last_e(cdr l))))
    (t(last_e(cdr l)))
))

(defun ultim_el(l)
(cond
    ((null l) nil)
    ((listp (car l)) (myAppend (ultim_el(last(car l))) (ultim_el(cdr l))))
    (t (cons(car l) (ultim_el(cdr l))))
)

)

(print(last_e '(a (b c) (d (e (f))))))
(print(ultim_el '(a (b c) (d (e (f))))))

(defun nr_impar(l c)
(cond 
    ((and (null l) (equal 1 (mod c 2))) t)
    ((and (null l) (equal 0 (mod c 2))) nil) 
    (t(nr_impar(cdr l) (+ c 1)))
)


)

(print(nr_impar '(1 2 3 4 3 2 3) 0))

(defun prim_el(l f)
(cond
    ((null l) nil)
    ((listp (car l)) (myAppend(prim_el(car l) 0) (prim_el(cdr l) f)))
    ((and (= f 0) (nr_impar l 0)) (cons (car l) (prim_el(cdr l) 1)))
    (t(prim_el(cdr l) 1))
)
)

(print(prim_el '(1 2 (3 4 3) 2 (3 2 (4 (1) 45) 4)) 0))


