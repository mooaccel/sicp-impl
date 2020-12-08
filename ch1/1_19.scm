; 这个题目的思路真的太秀了...
; 这个背后的数学原理是什么? 办法通用吗? 感觉可以应用于类似fib(n)的其他数列? 待研究, 是不是可以?
; 时间复杂度O(logn), 空间复杂度O(1)
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (define (pp p q)
    (+ (square p) (square q)))
  (define (qq p q)
    (+ (* 2 p q) (square q)))
  (cond ((= count 0 ) b)
        ((even? count)
         (fib-iter a
                   b
                   (pp p q)
                   (qq p q)
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
; 0 1 1 2 3 5 8 13 21
; 0 1 2 3 4 5 6 7  8
(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)