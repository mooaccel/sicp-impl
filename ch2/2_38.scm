;(define (fold-left op initial sequence) 
;  (define (iter result rest) 
;    (if (null? rest) 
;        result 
;        (iter (op result (car rest)) (cdr rest)))) 
;  (iter initial sequence))
(fold-right / 1 (list 1 2 3 4))
(fold-left / 1 (list 1 2 3))
(fold-right cons '() (list 1 2 3))
(fold-left cons '() (list 1 2 3))
(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))
; 猜测是 op a b = op b a, 不是交换律, 是是结合律?