; 1. fixed-point func
; 2. sqrt func
(load "./ch1/p92_fixed_point.scm")

(define (golden-rate)
  (fixed-point (lambda (x) (+ (/ 1 x)
                              1))
               1.0))
(golden-rate)

; why golden ratio ϕ is fixed point of x -> 1 + 1/x
; 1 + 1/x = x
; x + 1 = x^2
; x^2 - x - 1 = 0
; a = 1, b = -1, c = -1
; (1 +/- √5) / 2
(/ (+ 1 (sqrt 5))
   2.0)
(/ (- 1 (sqrt 5))
   2.0)