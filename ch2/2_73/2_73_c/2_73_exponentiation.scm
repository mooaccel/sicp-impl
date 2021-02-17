; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")
; =number?
(load "./ch2/2_58/=number.scm")
; tag
(load "./ch2/2_73/2_73_b/tag_basic.scm")


(define (install-exponentiation-package)
  ;; internal procedures
  (define (make-exponentiation-impl base exponent)
    (cond ((= exponent 0) 1)
          ((= exponent 1) base)
          (else (attach-tag '** base exponent))))
  (define (base-component-impl x)
    (car x))
  (define (exponent-component-impl x)
    (cadr x))
  ; exp没有tag
  (define (deriv-impl exp var) 
    ; deriv需要重新dispatch, 所以是deriv
    (let ((u (base-component-impl exp))
          (n (exponent-component-impl exp)))

              (let ((base_deriv_var (deriv u var))
                    (pre_product (make-product n
                                               (make-exponentiation u
                                                                    (- n 1)))))
                  (make-product pre_product base_deriv_var))
        ))
  ; interface to the rest of the system
  ;(define (tag x) (attach-tag ' x)) 
  (put 'make-exponentiation '** make-exponentiation-impl)
  (put 'base-component '** base-component-impl)
  (put 'exponent-component '** exponent-component-impl)
  (put 'deriv '** deriv-impl) 
  'done)

; 给其他模块用
(define (make-exponentiation u n)
  ((get 'make-exponentiation '**) u n)
)
(define (base-component s)
  ((get 'base-component '**) (contents s))
)
(define (exponent-component s)
  ((get 'exponent-component '**) (contents s))
)