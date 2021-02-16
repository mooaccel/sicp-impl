; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")
; =number?
(load "./ch2/2_58/=number.scm")
; tag
(load "./ch2/2_73/2_73_b/tag_basic.scm")

(define (install-product-package)
  ;; internal procedures
  (define (make-product-impl x y)
        (cond ((or (=number? x 0) (=number? y 0))
                0)
              ((=number? x 1)
                y)
              ((=number? y 1)
                x)
              ((and (number? x) (number? y))
                (* x y))
              (else
                (attach-tag '* x y))))
  (define (multiplier-impl p) (car p))
  (define (multiplicand-impl p) (cadr p))
  ; exp没有tag
  (define (deriv-impl exp var) 
    ; deriv需要重新dispatch, 所以是deriv
    ; make-sum, make-product通过dispatch或者直接调用-impl都行, 只不过-impl版本少一次查表过程
    (make-sum (make-product (multiplier-impl exp) 
                            (deriv (multiplicand-impl exp) var)) 
              (make-product (deriv (multiplier-impl exp) var) 
                            (multiplicand-impl exp))))
  ; interface to the rest of the system
  ;(define (tag x) (attach-tag ' x)) 
  (put 'make-product '* make-product-impl)
  (put 'multiplier '* multiplier-impl)
  (put 'multiplicand '* multiplicand-impl)
  (put 'deriv '* deriv-impl) 
  'done)

; 给其他模块用
(define (make-product x y)
  ((get 'make-product '*) x y)
)
; 为什么要加上(contents s)
; multiplier是在外部调用的API函数, 输入参数s是带tag的
(define (multiplier s)
  ; 而dispatch之后, 内层的multiplier-impl是不带tag的
  ((get 'multiplier '*) (contents s))
)
(define (multiplicand s)
  ((get 'multiplicand '*) (contents s))
)