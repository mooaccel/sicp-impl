; list本身单独是个盒子???TODO
(define val (list 1 (list 2 (list 3 4))))
val
; (1 (2 (3 4)))
(define val2 (list 1 2 3 4))
val2
(define val3 (cons 1 (cons 2 (cons 3 (cons 4 '())))))
val3

(define val4 (cons 1 (cons (cons 2 (cons (cons 3 (cons 4 '())) '()))
                            '())))
val4
val