; 利用了尾递归
(define (deep-reverse li)
  (define (reverse-iter li acc)
    (if (null? li)
        acc
        (let ((hd (car li))
              (tl (cdr li)))
          (if (list? hd)
              (reverse-iter tl (cons (reverse-iter hd '())  ; 注意这里的acc是'()代表全新的过程
                                     acc))
              (reverse-iter (cdr li) 
                            (cons hd acc))))
    ))
  (reverse-iter li '()))

(define x (list (list 1 2) (list 3 4)))
(reverse x)
(deep-reverse x)
(define x2 (list (list 1 2 (list 7 8 9)) (list 3 4 5) (list 6 7 8)))
(deep-reverse x2)

; 或者这么实现

(define (deep-reverse2 li)
  (define (reverse-iter li acc)
    (if (null? li)
        acc
        (let ((hd (car li))
              (tl (cdr li)))
          (reverse-iter tl
                        (cons (if (list? hd)
                                  (deep-reverse2 hd)
                                  hd)
                              acc)))))
  (reverse-iter li '()))
(deep-reverse2 x)
(deep-reverse2 x2)
 
; 感觉还是reverse-iter hd '()这么实现好一点...
; 可以看出函数式编程处理递归结构非常的方便, 哪怕是递归层数很深的