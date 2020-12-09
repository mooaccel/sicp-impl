; [a, b], 左右都是闭区间
(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a result)
    (if (> a b)
        result
        ; 不然用(predicate (term a)) ? 待研究...todo
        (if (predicate (term a))
            (iter (next a) 
                  (combiner (term a) result))
            (iter (next a)
                  result))))
  (iter a null-value))