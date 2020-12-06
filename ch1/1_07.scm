; 优化good-enough, 注意别把除函数写成了\, 应该是/
; 太小的数, 按原先的写法0.001还不够, 还得0.000001这种, 但是又不好动态调整
; 太大的数, 应该设置成1/10这种, 0.001又太小了. 会导致计算不到稳定点附近. 因为0.001这种对大的数显得精度太高, 然后死循环了
(define (sqrt-iter guess x)
  (let ((new-guess (improve guess x)))
    (if (good-enough? new-guess guess)
        new-guess
        (sqrt-iter (improve guess x) x))))

(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? new-guess old-guess)
  (< (/ (abs (- new-guess old-guess))
             old-guess)
     0.001        ))

(define (sqrt x) 
  (sqrt-iter 1.0 x))
(sqrt 100)
;(trace sqrt)
(sqrt 0.00009)
(sqrt 900000000000000000000000000000000000000000000000000000000000000000000000000000000000)