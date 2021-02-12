(list 'a 'b 'c) ; =>(a b c)
(list (list 'george)) ; =>((george))
; 嵌套的里面都是被'影响了?
(cdr '((x1 x2) (y1 y2))) ; =>((y1 y2))
(cadr '((x1 x2) (y1 y2))) ; => (y1 y2)
(car (cadr '((x1 x2) (y1 y2)))) ; => (y1 y2)
(cadr (cadr '((x1 x2) (y1 y2)))) ; => (y1 y2)
(car '(a short list)) ; #f
(cdr '(a short list)) 
(define val10 '((red shoes) (blue socks)))
val10
(define (memq item x)
  (cond ((null? x) false) 
        ((eq? item (car x)) x) 
        (else (memq item (cdr x)))))
; 不能对list 运用eq? 只能对symbol用吧        
(eq? '(red shoes) '(red shoes))
(memq 'shoes '(red shoes blue socks))