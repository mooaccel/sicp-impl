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

; !!! 本质上迭代方程需要通过牛顿法获取, 牛顿法是在求g(x)=0的问题上存在的解法, (另外一种是折半查找法, 但是没有牛顿法高效)
; todo, 再研究下求解g(x) = 0的问题时这两种方法的优劣? todo->看wikipedia
; Newton’s method does not always converge to an answer, but it can be shown
; that in favorable cases each iteration doubles the number-of-digits accuracy 
; of the approximation to the solution. In such cases, Newton’s method will converge much more rapidly than the half-interval method.
; 折半查找即使不可导也可用, 这是能想到的一个点...

; 其实g(x)=0, 如果g(x)可导, 那么可用牛顿法, 那么本质上来说等价于求f(x) = (transform g(x))这个不动点问题
; x -> x - g(x)/g'(x) -> ... 不断地寻找x, 然后直到停止...最终其实还是要x不怎么变化... 那就是不动点问题, 可以想象零点问题的图的x不怎么变化
; 然后可以转换到这一类不动点问题上, 牛顿法用来找迭代方程!!! 然后根据这个迭代方程寻求更好的x...

; 牛顿法与不动点的wikipedia, todo待看
