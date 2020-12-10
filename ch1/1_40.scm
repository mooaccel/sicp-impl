(load "./ch1/p100_newton_method.scm")

; g(x) = x^3+ ax^2+ bx + c. 求g(x) = 0的零点.
; g'(x) = 3x^2 + 2ax + b
; f(x) = x - g(x)/g(x)

(define (cube x) (* x x x))
(define (cubic a b c)
  (newtons-method
    (lambda (x) 
            (+ (cube x)
               (* a (square x))
               (* b x)
               c))
    1.0))
(cubic 3 2 1)
(cubic 2 5 5)