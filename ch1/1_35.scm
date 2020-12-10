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
(define a (/ (+ 1 (sqrt 5))
                2.0))

(define b (/ (- 1 (sqrt 5))
                2.0))
a
b
(/ 1 a)
(/ 1 b)

; (1 + √5) / 2的倒数 = 2 / (√5 + 1) = 2(√5 - 1) / 4 = (√5 - 1) / 2

(define root_five (/ (sqrt 5) 2))
(root_five)
(+ root_five 0.5)
(- root_five 0.5)