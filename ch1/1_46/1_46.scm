; 从1.1.7的sqrt利用牛顿法得到迭代方程, 然后写下第一个例子
; 再到学习fixed-point的例子.
; 其实已经能发现到这两个例子的相似之处了
; sqrt也可以用fixed-point实现.
; 但是终究背后的原理是一样的, 也就是这道1.46的题目的意义所在 => 再次进行抽象, 把背后的iterative improvement抽象出来
; 然后可以用来重新实现fixed-point和sqrt等!

; good-enough? 应该有两个个input参数
; improve 一个input参数
(define (iterative-improve good-enough? improve)
  (lambda (first-guess) 
    (define (try guess)
      (let ((next-guess (improve guess)))
        (if (good-enough? guess next-guess)
            next-guess
            (try next-guess))))
    (try first-guess)))