(load "./ch1/1_42.scm")

; recursive process
; (define (repeated f n)
;   (if (= n 1)
;       (lambda (x) (f x))
;       (compose f (repeated f (- n 1)))))
; ((repeated square 2) 5)

; 等同于
(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (lambda (x) 
               (f ((repeated f (- n 1)) x)))))
((repeated square 2) 5)

; iterative process todo? 怎么实现?