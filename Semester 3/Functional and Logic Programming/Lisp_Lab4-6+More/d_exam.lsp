;d1

(defun d1(l e e1)
(cond
    ((and (atom l) (not(equal l e))) l)
    ((and (atom l) (equal l e)) e1)
    (t (mapcar #'(lambda (x)
    (d1 x e e1)) l))
)
)

(print (d1 '(1 2 3 4 (3 1 5 (3 10 2)) 7 3 1) 3 99))

;d2
(defun substituie(l e e1 niv)
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
(substituie x e e1 (+ niv 1))
)
l
)
)
)
)
; main(l, e, e1) = substituie(l,e,e1,0)
; aceasta este functia main
; main(l:list, e:element, e1:element)
(defun main(l e e1)
(substituie l e e1 0)
)
;(print (main '(1 d (2 d (d))) d f))

;d3 mai tarziu

;d4 mai tarziu

;d5


(defun d5(l niv k)
(cond
    ((and(atom l) (not(equal niv k))) l)
    ((and (atom l) (equal niv k)) 0)
    (t(mapcar #'(lambda (x)
    (d5 x (+ 1 niv) k)
    )l))
)
)

(defun main_d5(l k)

    (d5 l 0 k)
)

(print (main_d5 '(a (1 (2 b)) (c (d))) 2))

;d6 e facut

;d7 e cu mapcan

(defun d7(l niv)
(cond
    ((or(and(atom l)(not(numberp l))(equal(mod niv 2) 1))(numberp l)) l)
    ((and(atom l)(not(numberp l))(equal(mod niv 2) 0)) nil)
    (t(mapcar #'(lambda(x)
    (d7 x (+ 1 niv))
    )l))
)
)


(print (d7 '(a (1 (2 b)) (c (d) e (q (d d (w q) f) g) h)) 0))

(defun elimina(l niv)
(cond
(
(AND (atom l) (not (numberp l)) (equal (mod niv 2) 1))
(list l)
)
(
(AND (atom l) (not (numberp l)) (equal (mod niv 2) 0))
NIL
)
(
(AND (atom l) (numberp l))
(list l)
)
(T
(list (mapcan #'(lambda (x)
(
elimina x (+ niv 1)
)
)
l
)
)
)
)
)

;d8 mai tarziu

;d9 mai tarziu

;d10 mai tarziu

;d11

;d12 e facut

;d13

(defun d13(l niv)
(cond
    ((and(numberp l)(equal(mod l 2) 1)(equal(mod niv 2) 0))(+ l 1))
    ((atom l) l)
    (t(MAPCAR #'(lambda(x)
    (d13 x (+ niv 1))
    )l))
)
)

(print (d13 '(1 2 3 4 (3 1 5 (3 10 2)) 7 3 1 3) 0))


(defun d14(l)
    (cond
        ((and(numberp l) (equal(mod l 3) 0)) nil)
        ((atom l) (list l))
        (t(list(mapcan #'d14 l)))
    )
)
(defun main_d14(l)
(car (d14 l))
)
(print (main_d14 '(1 2 3 4 (3 1 5 (3 10 2)) 7 3 12)))

(a (b (g)) (c (d (e)) (f)))