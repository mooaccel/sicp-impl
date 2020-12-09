(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      ; 先后顺序有影响吧
      (combiner (term a)
                (accumulate combiner
                            null-value
                            term
                            (next a)
                            next
                            b))))