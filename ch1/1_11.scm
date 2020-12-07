; recursive process.
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))
; 2
(f 2)
; 4
(f 3)
; 11
(f 4)
; 25
(f 5)
; 59
(f 6)
; ===
; (f 5)
; (+ f(4)       f(3) f(2))
; f(3)f(2)f(1)
; 0 1 2
(define (f-iter n)
  (define (f-iter-impl a b c i)
    (if (= i n)
        a
        (f-iter-impl b 
                     c 
                     (+ (* 3 a)
                        (* 2 b)
                        c)
                     (+ i 1))))
  (f-iter-impl 0 1 2 0))
(f-iter 0)
(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
; 0 1 2       0  2 
; 1 2 4       1  3
; 2 4 11      2  4
; 4 11 25     3  5
; 11 24 59    4  6
; 额外会多算2个数, 有点浪费, 改成取后面吧.
(define (f-iter-v2 n)
  (define (f-iter-impl a b c i)
    (if (= n i)
        c
        (f-iter-impl b 
                     c 
                     (+ (* 3 a)
                        (* 2 b)
                        c)
                     (+ i 1))))
  (if (< n 3)
      n
      (f-iter-impl 0 1 2 2)))
; bottom-up计算方法
(f-iter-v2 1)
(f-iter-v2 2)
(f-iter-v2 3)
(f-iter-v2 4)
(f-iter-v2 5)
(f-iter-v2 6)
; recursive process很直观, 好想也好实现, 但是效率不高
; 一般用bottom-up方法达到iterative process, 对线性和树形都管用, 但是关键在于看清初始条件和之后的计算进展之间的关系