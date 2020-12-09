; https://en.wikipedia.org/wiki/Fixed_point_(mathematics)
; That is to say, c is a fixed point of the function f if f(c) = c. This means f(f(...f(c)...)) = f^n(c) = c 
(define (average a b) (/ (+ a
                            b)
                         2.0))
(define tolerance 0.00001)
(define (fixed-point f first-guess-x)
  (define (close-enough? x y) 
    (< (abs (- x y)) 
       tolerance))
  (define (try guess-x)
    (let ((next-guess-x (f guess-x)))
      (if (close-enough? guess-x next-guess-x)
          next-guess-x
          (try next-guess-x))))
  (try first-guess-x))
(fixed-point cos 1.0)
; 输入起始点是0.5貌似会死循环...
; 2.0是一个不动点
(fixed-point (lambda (x) 
                     (+ (square x)
                        (* -3 x)
                        4))
             1.5)
(fixed-point (lambda (y) 
                     (+ (sin y) (cos y)))
             1.0)
; 那岂不是1/x与x的交点?还刚好两个..对应两个平方根?
; (define (sqrt a)
;   (fixed-point (lambda (x) 
;                        (/ a x))
;                2.0))
; (sqrt 5) 找不出来, 不收敛, 原因见p93
; 如果用找零点的那个方法做呢 x^2 = a => x^2 - a = 0
; 感觉也可以呀... 确实可以, 参考p89_half_interval_method.scm里的实现

(define (sqrt a)
  (fixed-point (lambda (x) (average x (/ a x)))
               1.0))
(sqrt 5)
(sqrt 7)
; 原理解释, a看成常量, x是自变量
; 本来是想求x^2 = a, 所以是x = a / x
; 注意数形结合, 脑袋里要有函数的图像, x与反比例函数a/x有两个交点
; 刚好是a的两个平方根
; 但是直接用 a / x去求会震荡, 死循环.
; 为了优化, 迭代时的步骤迈小点, 引入平均 
; 然后相当于求 x = (average x (/ a x))的交点了
; 其实函数图已经变了, 但是x = (average x (/ a x))的交点是等价于之前x = a / x的. 
; 为什么等价, 虽然函数图像已经变了, 但是其实不动点是不变的, 
; 因为在不动点x1位置上a = x1^2, 
; a / x1 = (average x1 (/ x1^2 x1))
; 右边 = (x1 + x1) / 2 = x1, 左边 = 右边 = x1. 所以相当于证明了做个次函数变换之后不动点的值不变的证明...
; 所以通过求等价的x与(average x (/ a x))的交点, 就可以得到原来的x与a / x的交点, 也即求出了一个不动点