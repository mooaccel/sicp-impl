; https://sicp.readthedocs.io/en/latest/chp3/17.html
(define (count-pairs x)
    (length (inner x '())))

(define (inner x memo-list)
    (if (and (pair? x)
             (false? (memq x memo-list)))
        ; 只有当第一次遇到pair才会把这个pair放进list
        (inner (car x)
               (inner (cdr x)
                      (cons x memo-list)))
        memo-list))

(define x '(foo)) 
x
(define y (cons x x)) 
y
(define str2 (list y)) 
str2
(count-pairs str2)

(define x '(foo)) 
(define y (cons x x)) 
(define str3 (cons y y)) 
(count-pairs str3)