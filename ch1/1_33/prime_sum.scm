(load "./ch1/1_33/filtered_accumulate.scm")

(load "./ch1/1_23/prime.scm")
;(load "./ch1/1_24/fast-prime.scm")

(define (compute-sum-prime-in-range a b)
  (filtered-accumulate + 
                       0 
                       (lambda (x) x)
                       a
                       (lambda (i) (+ i 1)) 
                       b
                       prime?))
; 100以内质数之和 = 1060
(compute-sum-prime-in-range 2 100)