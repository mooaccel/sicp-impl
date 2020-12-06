; normal-order evaluation 有什么作用? 没体会到
; normal-order evaluation can be an extremely valuable tool, 
; and we will investigate some of its implications 
; in Chapter 3 and Chapter 4.16 
; ??? 
; In Chapter 3 we will introduce stream processing, which is a way of handling apparently “inﬁnite” data structures by incorporating a limited form of normal-order evaluation. In Section 4.2 we will modify the Scheme interpreter to produce a normal-order variant of Scheme.
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
(test 0 (p))
https://sicp.readthedocs.io/en/latest/chp1/5.html
; normal-order evaluation懒惰求值的意思
