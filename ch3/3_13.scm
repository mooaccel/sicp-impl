(define (last-pair x) 
  (if (null? (cdr x)) 
      x 
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x) 
  x)
(define z (make-cycle (list 'a 'b 'c)))
z
(cdr z)
(cddr z)
; 一直在cdr *了...死循环
(last-pair z)