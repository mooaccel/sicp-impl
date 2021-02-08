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