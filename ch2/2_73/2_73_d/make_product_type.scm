; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")
; =number?
(load "./ch2/2_58/=number.scm")
; tag
(load "./ch2/2_73/2_73_b/tag_basic.scm")

(define (install-make-product-package)
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
  ; interface to the rest of the system
  (put '* 'make-product make-product-impl)

  'done) ; 这个done啥意思

; 给其他模块用
(define (make-product x y)
  ((get '* 'make-product) x y)
)