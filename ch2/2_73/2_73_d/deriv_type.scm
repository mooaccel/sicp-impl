; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")
; =number?
(load "./ch2/2_58/=number.scm")
; tag
(load "./ch2/2_73/2_73_b/tag_basic.scm")

; 类似p244, 
; Operations: +/*/**
; Type: deriv
(define (install-deriv-package)
  ;; internal procedures
  (define (deriv-impl-sum exp var) 
    (make-sum (deriv (addend exp) var) 
              (deriv (augend exp) var)))
  ; interface to the rest of the system
  (put '+ 'deriv deriv-impl-sum)

  'done)