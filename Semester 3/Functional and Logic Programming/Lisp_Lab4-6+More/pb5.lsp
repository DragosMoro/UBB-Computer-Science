;b)Write a function to replace an element E by all elements of a list L1 at all levels of a given list L. 


;myAppend(l1l2...ln,k1k2...km) = 
; k1k2...km, if n = 0
; l1 U myAppend(l2...ln, k1k2...km), otherwise





;replaceList (E, R, l1l2..ln) = {
; (), if n = 0
; {replace(E, R, l1)} U replace(E, R, l2..ln), if l1 is a list
; R U replace(E, R, l2..ln), if E = l1
; {l1} U replace(E, R, l2..ln), otherwise

(defun replaceList (E R L)
    (cond
        ((null L) ())
        ((listp (car L)) (cons (replaceList E R (car L)) (replaceList E R (cdr L))))
        ((equal E (car L)) (cons R (replaceList E R (cdr L))))
        (t (cons (car L) (replaceList E R (cdr L))))
    )
)

(print( replaceList 3 '() '(1 2 3 4 5 3 5 3 6 3)))