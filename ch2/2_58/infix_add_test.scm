(load "./ch2/2_58/deriv.scm")

(define val5 (make-sum 1 2))
val5
(sum? val5)
; (x + (y + 2))
(define val10 (make-sum 'x (make-sum 'y 2)))
val10
(define val11 '(x + (y + 2)))
val11
(sum? val10)
(addend val10)
(augend val10)
(addend val11)
(augend val11)