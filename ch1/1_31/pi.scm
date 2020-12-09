(load "./ch1/1_31/product.scm")

; 首先找term
; 1 2 3 4 5 6 7
;   2 4 4 6 6 8
;     3 3 5 5 7 7 
; 分子: n -> if even? n
;            else (n + 1) 
;   1 2 3 4 5 6
;   2 4 4 6 6 8
; 考虑偏移, n -> n + 1 
; 分母: n -> if odd? n 
;            else (n - 1)
; 考虑偏移, n -> n + 2 
(define (numerator-m n)
  (let ((nshift (+ n 1)))
       (if (even? nshift)
           nshift
           (+ nshift 1))))
(define (denominator-m n)
  (let ((nshift (+ n 2)))
       (if (odd? nshift)
           nshift
           (- nshift 1))))
;(define (term n)
;  (exact->inexact (/ (numerator-m n)
;                     (denominator-m n))))

(define (compute-pi precision)
  (* 4
     (product 
              (lambda (k) 
                (exact->inexact (/ (numerator-m k)
                                   (denominator-m k))))
              1
              (lambda (k) (+ k 1))
              precision)))
(compute-pi 100)
(compute-pi 1000)
(compute-pi 10000)
(compute-pi 100000)
(compute-pi 1000000)

;(define (term n)
;
;  (1))
;(define (search-for-primes-for-question n)
;  (let ((start-time (real-time-clock)))
;       (search-for-primes n 3)
;       (- (real-time-clock) start-time)))