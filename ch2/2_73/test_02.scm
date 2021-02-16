; =number?
(load "./ch2/2_58/=number.scm")
(load "./ch2/2_73/2_73_b/tag_basic.scm")

(define (make-sum x y) 
  (cond ((=number? x 0)
          y)
        ((=number? y 0)
          x)
        ((and (number? x) (number? y))
          (+ x y))
        (else
          (attach-tag 'sum x y))))

(define (addend s) 
  (car s))
(define (augend s) 
  (cadr s))
(define (deriv2 exp var) 
  ; 调内部的make-sum和addend吧?
  (make-sum (deriv2 (addend exp) var) 
            (deriv2 (augend exp) var)))
; 递归下去的一层怎么派发???

(define sum-1 (make-sum 'x 13))
sum-1
(addend (contents sum-1))
(augend (contents sum-1))
(deriv2 (contents sum-1) 'x)
;(list 'sum 'x '3) 'x)