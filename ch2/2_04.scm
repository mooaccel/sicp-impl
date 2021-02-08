(define (cons2 x y) 
  (lambda (m) (m x y))) 
(define (car2 z)
  (z (lambda (p q) p)))
(define (cdr2 z)
  (z (lambda (p q) q)))

(define pair (cons2 2 10))
(car2 pair)
(cdr2 pair)

这个方法确实惊艳, procedural representations