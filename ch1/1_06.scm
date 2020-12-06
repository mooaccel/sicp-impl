(define (new-if predicate then-clause else-clause) 
  (cond (predicate then-clause) 
        (else else-clause)))
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

; 想测试后面的时候把new-if改成if, 不然会出不来
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x))) ; <- sqrt-iter 的返回值还要作为 new-if 的参数，因此 sqrt-iter 的调用不是尾递归
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

; 为什么先打印bad, 再打印good??
; evaluation的顺序标准啥的有规定吗? 答案如下, 来自https://sicp.readthedocs.io/en/latest/chp1/6.html
; Note: 你可能对 new-if 的输出感到疑惑，为什么 “bad” 会在 “good” 之前输出？事实是，函数式编程语言的解释器实现一般对参数的求值顺序并没有特定的规则，从左向右求值或从右向左求值都是可能的，而这里所使用的 MIT Scheme 使用从右往左的规则，仅此而已，使用不同的 Scheme 实现，打印的结果可能不同。
(new-if #t (display "good") (display "bad"))