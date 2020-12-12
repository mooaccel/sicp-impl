(define (inc x)
  (+ x 1))

; x->f(g(x))
(define (compose f g)
  (lambda (x) 
          (f (g x))))

((compose square inc) 6)