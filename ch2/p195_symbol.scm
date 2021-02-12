(define a 1) 
(define b 2)
(define c 3)
(define com '(a b c))
com
(define com2 (list a b c))
com2
; '()表明这个里面的每个都是字面值?
(list 'a b)
'(a b)

(define (memq item x)
  (cond ((null? x) false) 
        ((eq? item (car x)) x) 
        (else (memq item (cdr x)))))
(memq 'banana '(pear banana prune))
(define val3 '(xx (apple_fd sauce) y apple pear))
val3
(memq 'apple val3)