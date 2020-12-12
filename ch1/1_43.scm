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

; iterative process todo? 怎么实现?
; f(f(f(x))) = f(g(x))
(define (repeated f n)
  (define (repeated-impl count g)
    (if (= count n)
        g
        (repeated-impl (+ count 1) 
                       (compose f g))))
  (repeated-impl 1 f))

((repeated square 3) 2)
; 2 -> 4 -> 16 -> 256 
((repeated square 2) 5)