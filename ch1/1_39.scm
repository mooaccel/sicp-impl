(load "./ch1/1_37.scm")

; 把负号放到分子上
; N1 = x
; N2 = -x^2
; N3 = -x^3
; ...

; D1 = 1  1
; D2 = 3  2
; D3 = 5  3
; ...

(define (dterm i)
  (- (* i 2)
     1))

(define (tan-cf x precision)
  (cont-frac (lambda (i) 
                     (if (= i 1) 
                         x
                         (- (square x))))
             dterm 
             precision))

(define pi 3.1415)
; 2.7182818284590455
(tan-cf 0 100)
(tan-cf (/ pi 12) 100)
(tan (/ pi 12))
(tan-cf (/ pi 8) 100)
(tan (/ pi 8))
(tan-cf (/ pi 6) 100)
(tan (/ pi 6))
(tan-cf (/ pi 4) 100)
(tan (/ pi 4))
(tan-cf (/ pi 3) 100)
(tan (/ pi 3))
; 这个为啥有问题...?why?
(tan-cf 1 100)
; 底下这俩都没问题?
(tan-cf (exact->inexact 1) 100)
(tan-cf 1.0 100)
; 用built-in tan
(tan 1.0)