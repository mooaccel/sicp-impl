; 自底向上计算fib(n)
; 其实是利用了Dynamic programming的思想
; 如果是自顶向下的计算, 添加一个memo做cache也可以节省计算量
; a, b => b, a+b
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        a
        (fib-iter b (+ a b) (- count 1))))
  (fib-iter 0 1 n))
(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)