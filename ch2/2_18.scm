; 遇到nil就返回nil
(define (reverse li)
  (define (reverse-iter li acc)
    (if (null? li)
        acc
        (reverse-iter (cdr li) 
                      (cons (car li) acc))))
  (reverse-iter li '()))
(reverse (list 1 4 9 16 25))
(define list1 (list 1 4 9 16 25))
list1
(reverse list1)
(reverse (list 1 2 3 4 5))

; 如果是用尾递归想优化stack的空间使用, 那么会造成一个反序的问题
; 否则, 如果不用那种方式, 只是递归函数的写法, 而不是递归过程, 此时顺序不会反
(define (factorby2 li)
  (if (null? li)
      '()
      (cons (* 2 (car li)) (factorby2 (cdr li)))))
(factorby2 (list 1 2 3 4 5))