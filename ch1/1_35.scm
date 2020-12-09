(load "./ch1/p92_fixed_point.scm")

(define (golden-rate)
  (fixed-point (lambda (x) (+ (/ 1 x)
                              1))
               1.0))
(golden-rate)