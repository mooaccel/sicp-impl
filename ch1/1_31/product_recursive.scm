; 计算[a, b]对应的term之和, 左右都是闭区间
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term 
                  (next a)
                  next
                  b))))