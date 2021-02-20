(define (append x y)
  (if (null? x) 
      y 
      (cons (car x) (append (cdr x) y))))
(define x (list 'a 'b))  
(define y (list 'c 'd)) 
(define z (append x y))

z
(cdr x)
(cadr x)

(define (append! x y)
  (set-cdr! (last-pair x) y) x)
(define w (append! x y))
(define (last-pair x) 
  (if (null? (cdr x)) 
      x 
      (last-pair (cdr x))))
w
(cdr x)
x
; 注意现在x和w都是(a b c d)
; 图在草稿纸上画了, 这里不附图了, 比较简单, 简而言之就是append!能复用之前的空间
