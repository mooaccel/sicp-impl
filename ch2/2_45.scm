; 可以定义出四个方向的划分
(define (split op1 op2)
  (lambda (painter n) 
          (if (= n 0)
              painter
              (let ((smaller ((split op1 op2) painter 
                                              (- n 1))))

                (op1 painter (op2 smaller smaller)))))

(define up-split (split below beside))
(define right-split (split beside below))


; 或者这样, 本来想着怎么去递归调用匿名函数的, 果然可以这样
; 参考了https://sicp.readthedocs.io/en/latest/chp2/45.html
(define (split big-combiner small-combiner)
    (define (inner painter n)
        (if (= n 0)
            painter
            (let ((smaller (inner painter (- n 1))))
                (big-combiner painter   
                              (small-combiner smaller smaller)))))
    inner)
; 最后是inner作为返回值, 而不是inner
