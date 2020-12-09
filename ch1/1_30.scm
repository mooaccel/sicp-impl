; 计算[a, b]对应的term之和, 左右都是闭区间
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result
                          (term a)))))
  (iter a 0))
; 1 8 27
; test for 
(sum cube 1 (lambda (num) (+ num 1)) 3)
; 1 + 2 + 3 + .. + 10
; 11 * 5 = 55
(sum (lambda (x) x) 
     1 
     (lambda (num) (+ num 1)) 
     10)