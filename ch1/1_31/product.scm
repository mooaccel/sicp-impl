; 其实可以把+/*函数都抽象出来...当然还要修改base, 加是0, 乘是1
; 计算[a, b]对应的term之和, 左右都是闭区间
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a)
                          result))))
  (iter a 1))
