; (1 3 (5 7) 9)
(define val1 (list 1 3 (list 5 7) 9))
val1
(car (cdr (car (cdr (cdr val1)))))

; ((7))
(define val2 (list (list 7)))
val2
(car (car val2))

; (1 (2 (3 (4 (5 (6 7))))))
(define val3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
val3
(cadr (cadr (cadr (cadr (cadr (cadr val3))))))



