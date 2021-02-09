(define val4 (cons 1 (cons (cons 2 (cons (cons 3 (cons 4 '())) '()))
                            '())))
val4
(list 1 (list 2 (list 3 4)))
; 上面这俩是等价的

; 然后注意区分:
; val
; (define val5 (cons 2 (cons 3 (cons 4 '()))))
; val5
; (define val6 (list 2 (list 3 4)))
; val6