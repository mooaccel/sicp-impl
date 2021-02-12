; 判断是(1)还是(1 2)..
(define (single-operand? exp)
 (null? (cdr exp)))
;(single-operand? '(1))
;(single-operand? '(1 2))