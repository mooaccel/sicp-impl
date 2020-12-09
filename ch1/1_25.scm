(load "./ch1/1_16.scm")

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; 求这种数的效率太低
(expmod 1000000000 100000000 3)