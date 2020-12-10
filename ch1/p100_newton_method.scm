(load "./ch1/p92_fixed_point.scm")

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
      (/ (- (g (+ x dx)) (g x))
         dx)))

(define (cube x) (* x x x))
((deriv cube) 5)

(define (newton-transform g) 
  (lambda (x) 
          (- x 
             (/ (g x) 
                ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
; g -> (newton-transform g) -> 求它的不动点

; x^2 = a
; g(x) = x^2 - a, g(x) = 0它的解
; 就是     的不动点... why
; f = (newton-transform g) = x - (x^2 -a)/2x
; f = (2^x2 - x^2 + a) / 2x
; f = (a/x + x) / 2, 即之前的average damp

(define (sqrt a)
  (newtons-method
    (lambda (x) (- (square x) a))
    1.0))
(sqrt 10)

; x^3 = a
; g = x^3 - a = 0 
; g' = 3x^2
; f = x - (x^3 - a)/3x^2
; f = (3x^3 - x^3 + a)/3x^2
; f = (2x^3 + a)/3x^2
; f =a(a/x^2 + 2x)/3
; 然后得到exercise1.8的方程... !!!

; 前提是g(x) is a differentiable function, 不然求不出g'(x)
; 要求一个g(x) = 0与x轴的交点 等价于 求  f(x) 与x的交点, 即不动点
; 求一个g(x) = 0与x轴的交点, 用牛顿法.
; 从一个点g(x)上的(x1, y1), 同时也是切线上的点, 到下一个点(x2, 0)
; y1 = g(x1)
; x2 = x1 - (y1/g'(x1))
; 令f(x) = x - g(x)/g'(x) , 从一个x能得到下一个x
; 也即寻找 x - g(x)/g'(x)函数的不动点, 即f(x)函数的不动点
; 不断下去求, 然后得到一个最终的x


; 牛顿法与不动点的wikipedia, todo待看
