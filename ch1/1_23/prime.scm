(load "./ch1/1_23/smallest_divisor.scm")

(define (prime? n)
  (= n (smallest-divisor n)))
(prime? 5)
(prime? 100)