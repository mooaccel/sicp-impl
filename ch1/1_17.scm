(define (halve x)
  (/ x 2.0))
(define (double x)
  (* x 2.0))
; a * b
; 看成b个a
; recursive实现
; (define (mul a b)
; 或者用 (= b 0) 0也行, 最终还是能计算到base情况, 没有什么本质区别
;   (cond ((= b 1) a)
;         ((even? b) (double (mul a (halve b))))
;         ((odd? b) (+ a 
;                      (double (mul 
;                               a 
;                               (halve (- b 1))))))))
; 尝试优化成iterative process
; m + a*b 是invariant
; 初始 m = 0
; 中间状态转换, 把a*b逐渐转化到m里
;             类似于1_16的公式, 可以写出
;             a * b = (2a) * (b/2) (1)
;             a * b, b个a相加
;             a -> double a 
;             b -> halve b
; 最终 返回m
(define (mul-iter a b m)
    (cond ((= b 0) m)
          ((even? b) (mul-iter 
                       (double a) 
                       (/ b 2) 
                       m))
          ((odd? b) (mul-iter 
                       (double a) 
                       (/ (- b 1) 2) 
                       (+ m a)))))
(define (mul a b)
  (mul-iter a b 0))
(trace-entry mul-iter)
(mul 5 10)
(mul 4 50)