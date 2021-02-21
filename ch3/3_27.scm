(load "./ch3/p362_onedim_table.scm")

(define (make-table)
  (cons '*table* '()))

; 接收一个f
; 返回一个lambda
(define (memoize f)
  (let ((table (make-table))) 
    (lambda (x) 
      (let ((previously-computed-result 
              (lookup x table)))
         (or previously-computed-result 
             (let ((result (f x))) 
                (insert! x result table) 
                result))))))

(define memo-fib 
  (memoize (lambda (n)
              (cond ((= n 0) 0)
                    ((= n 1) 1)
                    (else (+ (memo-fib (- n 1)) (memo-fib (- n 2))))))))
; 本质上是dp, Dynamic programming problem
; 详细参考clrs ch15
; 这里解决的是最简单的fib问题
; 采用的是top-down方式来实现! 
; 与Leetcode里的题大多一般采用的bottom-up方式不同, 但是这两个方式有些许不同clrs 第三版中文版p221有解释不同以及怎么选择
; 一般情况下区别不大
; 这种top-down的方式还是不错的, 可以借鉴, 这道3_27也挺不错

;(memo-fib 1)
;(memo-fib 2)
;(memo-fib 3)
;(memo-fib 4)
;(memo-fib 5)
;(memo-fib 6)

; (memo-fib 7)

; 如果改成(memoize fib) 
; 当求10对应的斐波那契数时会分解成fib(9) + fib(8)
; 而不是memo-fib(9)+memo-fib(8), 所以不对!!! fib(9)和fib(8)还是会产生很多重复计算


; 其中的关于or的语法, 搞了个小例子
; (define val10 (or #f #f))
; val10
; (define val11 (or #f 10))
; val11
; 还可以参考p25