; https://en.wikipedia.org/wiki/Fixed_point_(mathematics)
; That is to say, c is a fixed point of the function f if f(c) = c. This means f(f(...f(c)...)) = f^n(c) = c 
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
(define (sqrt a)
  (fixed-point (lambda (x) 
                       (/ a x))
               2.0))
; (sqrt 5) 找不出来, 不收敛, 原因见p93
; 如果用找零点的那个方法做呢 x^2 = a => x^2 - a = 0
; 感觉也可以呀... 确实可以, 参考p89_half_interval_method.scm里的实现