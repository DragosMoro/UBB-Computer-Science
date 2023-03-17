(defun findDepth(l counter)
  (cond
    ((atom l) counter)
    (t (apply #'max (list (mapcar #' (lambda (a) (findDepth a (+ 1 counter))) l))))
  )
)

(print(findDepth '(1 2 3 (4 (2 5 4) 2) ) 0))