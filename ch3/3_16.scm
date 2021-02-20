(define (count-pairs x)
  (if (not (pair? x)) 
      0 
      (+ (count-pairs (car x)) 
         (count-pairs (cdr x)) 
         1)))

(define x (list 'a 'b)) 
(define z1 (cons x x))
z1
(count-pairs z1) ; 这个错了, 因为存在共享
(define z2 (cons (list 'a 'b) (list 'a 'b)))
z2
(count-pairs z2)


(define x '(foo)) 
x
(define y (cons x x)) 
y
(define str2 (list y)) 
str2
(count-pairs str2) ; 4

(define x '(foo)) 
(define y (cons x x)) 
(define str3 (cons y y)) 
(count-pairs str3) ; 7 
; http://community.schemewiki.org/?sicp-ex-3.16