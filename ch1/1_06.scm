(define (new-if predicate then-clause else-clause) 
  (cond (predicate then-clause) 
        (else else-clause)))
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
; new-if随便改成个什么其他名字都会导致无限递归...

; 得到一个比guess稍优的结果
; 为什么这种specific方法能生效? 
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) 
             x)) 
     0.001))
; 起始为啥要选1.0?
(define (sqrt x) 
  (sqrt-iter 1.0 x))
; 学到了一种debug方法, https://sicp.readthedocs.io/en/latest/chp1/6.html
(trace sqrt-iter)
(sqrt 5)
;if 语句是一种特殊形式，当它的 predicate 部分为真时， then-clause 分支会被求值，否则的话， else-clause 分支被求值，两个 clause 只有一个会被求值。
