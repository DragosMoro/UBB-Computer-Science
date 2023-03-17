(defun munte(l f)
    (cond
        ((and (null (cdr l)) (= f 1)) t)
        ((and (<= (car l) (cadr l)) (= f 0)) (munte (cdr l) 0))
        ((and (>= (car l) (cadr l)) (= f 0)) (munte (cdr l) 1))
        ((and (>= (car l) (cadr l)) (= f 1)) (munte (cdr l) 1))
        (t nil)
    )
)

(defun main(l)
    (cond
        ((null l) nil)
        ((null (car l)) nil)
        ((null (cadr l)) nil)
        (t (munte l 0))
    )

)

(print(main '(10 18 29 17 11 10)))

(print(main '(5 4 3 2 3 4 5 4 3 2 3 4 5)))
(print(main '(5 6 5 4 3 2 1)))
