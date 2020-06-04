;(define x (list (list 1 2) (list 3 4) (list 5 6)))
;(define (fringe tree)
;  (cond ((null? tree) '())
;        ((not (pair? tree)) (list tree))
;        (else (append (fringe (car tree))
;                      (fringe (cdr tree))))))

;(fringe x)

;(define (count-leaves x)
;  (cond ((null? x) 0) ; 递归中也可能走到这里, 不仅仅是刚开始可能遇到它, 这相当于是base case 1
;        ((not (pair? x)) 1) ; base case 2
;        (else (+ (count-leaves (car x))
;                 (count-leaves (cdr x))))))

; 用不用自己的版本的append都行
;(define (append list1 list2)
;  (if (null? list1)
;      list2
;      (cons (car list1) 
;            (append (cdr list1) list2))))

(define (fringe tree)
    (cond ((null? tree)                         ; 空树
            '())
          ((not (pair? tree))                   ; 叶子
            (list tree))
          (else
            (append (fringe (car tree))         ; 累积左子树所有元素
                    (fringe (cadr tree))))))    ; 累积右子树所有元素

;(define val1 (list 1 2 3))
;val1
;(append '() val1)
;(append val1 '())