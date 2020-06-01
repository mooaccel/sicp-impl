; ===先研究一下pair?
(define x (cons 1 2))
(pair? x) ; #t
(define y1 (cons 100 '()))
(pair? y1) ; #t
(define y2 (cons '() 100))
(pair? y2) ; #t
(define y3 (cons '() '()))
(pair? y3) ; #t
(define z1 1)
(pair? z1) ; #f

; 教材上的源码, 中文版P73, 计算叶子节点的数量(其实就是单个的格子总数)
; 不像list, 必须是nil结尾, 这个count-leaves什么都能计算, 只要是由pair组成的
; 最终对单个的格子数求和
; x可能是null('())/单个的格子(z1)/各种复合情况
(define (count-leaves x)
  (cond ((null? x) 0) ; 递归中也可能走到这里, 不仅仅是刚开始可能遇到它, 这相当于是base case 1
        ((not (pair? x)) 1) ; base case 2
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (readable-print-num-of-leaves x)
  (newline)
  (display "x = ")
  (display x)
  (newline)
  (display "num of leaves = ")
  (display (count-leaves x))
  (newline))

; 在目前的mit-scheme里面, 不能用nil, 需要用'()替代
; ===学习null?
;(define nulllist '())
;(null? nulllist) ; #t

(readable-print-num-of-leaves '())
;x = ()
;num of leaves = 0

(readable-print-num-of-leaves x)
;x = (1 . 2)
;num of leaves = 2

(readable-print-num-of-leaves y1)
;x = (100)
;num of leaves = 1

(readable-print-num-of-leaves y2)
;x = (() . 100)
;num of leaves = 1

(readable-print-num-of-leaves y3)
;x = (())
;num of leaves = 

(readable-print-num-of-leaves z1)
;x = 1
;num of leaves = 1

(define nonlistval 
  (cons 1 
        (cons 2 
              (cons 3 4))))
nonlistval
; (1 2 3 . 4)

(pair? nonlistval)
; #t

(list? nonlistval)
; #f

(readable-print-num-of-leaves nonlistval)
;x = (1 2 3 . 4)
;num of leaves = 4

;注意底下两种情况的轻微差别!!!这种差别会有什么影响吗? 对其他针对树的算法, TODO待研究
;count-leaves的话没影响
(define val1 (cons (list 1 2) (list 3 4)))
(define val2 (cons (list 1 2) (cons 3 4)))

(readable-print-num-of-leaves val1)
;x = ((1 2) 3 4)
;num of leaves = 4

(readable-print-num-of-leaves val2)
;x = ((1 2) 3 . 4)
;num of leaves = 4