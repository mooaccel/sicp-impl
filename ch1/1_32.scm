; 计算[a, b]对应的term之和, 左右都是闭区间
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a)
                                 result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))

; 1 8 27
(sum cube 1 (lambda (num) (+ num 1)) 3)
; 1 + 2 + 3 + .. + 10
; 11 * 5 = 55
(sum (lambda (x) x) 
     1 
     (lambda (num) (+ num 1)) 
     10)
; 216
(product cube 1 (lambda (num) (+ num 1)) 3)

; 1 * 2 * 3 * .. * 10 = 3628800
(product (lambda (x) x) 
         1 
         (lambda (num) (+ num 1)) 
         10)