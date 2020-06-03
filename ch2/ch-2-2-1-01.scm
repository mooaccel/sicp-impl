(define list1 (list 1 2 3 4))
list1
; 不能判断n是否越界
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(list-ref list1 3)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(length list1)

; iterative process
; 下面这种实现是iterative style
; 是recursive procedure 但是因为scheme这种函数式编程语言都进行了tail recursive优化
; 其实本质是迭代的. 类似语法糖...
; 见第一章
; 注意区分recursive procedure和recursive process, 这是sicp引入的, 在第一章, 
i; 区分的目的就是为了看明白length-iter这种实现...
(define (length-iter items)
  (define (length-iter-help seqs count)
    (if (null? seqs)
        count
        (length-iter-help (cdr seqs) (+ 1 count))))
  (length-iter-help items 0))
(length-iter (list 1 100 3 3 4))

; recursive process
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) 
            (append (cdr list1) list2))))

(define squaresVals (list 1 4 9 16 25))
(define oddsVals (list 1 3 5 7))
(append squaresVals oddsVals)
(append oddsVals squaresVals)