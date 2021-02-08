;(define (squareList items)
;  (define (square x)
;    (* x x))
;  (define (squareListIterHelp remainItems answer)
;    (if (null? remainItems)
;        answer
;        (squareListIterHelp (cdr remainItems)
;                            (cons (square (car remainItems))
;                            answer))))
;  (squareListIterHelp items '()))
;(squareList (list 2 3 4 5 6))

;(define (squareList items)
;  (define (squareListIterHelp remainItems answer)
;    (if (null? remainItems)
;        answer
;        (squareListIterHelp (cdr remainItems)
;                            (cons answer
;                                  (square (car remainItems))))))
;  (squareListIterHelp items '()))
;(squareList (list 2 3 4 5 6))

; 相当于如下过程...
; (((((() . 4) . 9) . 16) . 25) . 36) 
(define val1 (cons '() 4))
(define val2 (cons val1 9))
(define val3 (cons val2 16))
(define val4 (cons val3 25))
; 刚好和list的定义是相反的...怪怪的
; 可以看到生成的并不是列表, 而是一个使用cons组织起的序对序列, 它组织起元素的方式和位置都搞错了.
(define val5 (cons val4 36))
val5
; (((((() . 4) . 9) . 16) . 25) . 36)

; (cons (cons (cons (cons '() 1) 4) 9) 16)


; ==这么改. 要想改成迭代过程的话

; 遇到nil就返回nil
; 这是一个迭代过程
(define (reverse seqs)
  (define (reverse-iter remainSeqs res)
    (if (null? remainSeqs)
        res
        (reverse-iter (cdr remainSeqs) 
                      (cons (car remainSeqs)
                            res))))
  (reverse-iter seqs '()))

; 第一种改法
;(define (squareList items)
;  (define (square x)
;    (* x x))
;  (define (squareListIterHelp remainItems answer)
;    (if (null? remainItems)
;        (reverse answer) ; 触底之后再reverse
;        (squareListIterHelp (cdr remainItems)
;                            (cons (square (car remainItems))
;                            answer))))
;  (squareListIterHelp items '()))
;(squareList (list 2 3 4 5 6))

; 第二种改法
(define (squareList items)
  (define (square x)
    (* x x))
  (define (squareListIterHelp remainItems answer)
    (if (null? remainItems)
        answer
        (squareListIterHelp (cdr remainItems)
                            (cons (square (car remainItems))
                            answer))))
  (squareListIterHelp items '()))
(squareList (reverse (list 2 3 4 5 6 7))) ; 在开始的时候reverse一下

; 时间复杂度增加O(n), 因为reverse过程
; 但是总的时间复杂度还是O(n)
; Θ和O的区别见具体数学(高德纳的书)...