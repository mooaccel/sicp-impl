; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")
; =number?
(load "./ch2/2_58/=number.scm")
; tag
(load "./ch2/2_73/2_73_b/tag_basic.scm")

(define (install-make-sum-package)
  ;; internal procedures
  (define (make-sum-impl x y) 
    (cond ((=number? x 0)
            y)
          ((=number? y 0)
            x)
          ((and (number? x) (number? y))
            (+ x y))
          (else
            (attach-tag '+ x y))))
  ; interface to the rest of the system
  (put '+ 'make-sum make-sum-impl)

  'done) ; 这个done啥意思

; 给其他模块用
; 注意get第二个参数是'make-sum
(define (make-sum x y)
  ((get '+ 'make-sum) x y)
)