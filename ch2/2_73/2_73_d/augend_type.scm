; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")

(define (install-augend-package)
  ;; internal procedures
  (define (augend-impl s) 
    (cadr s))
  ; interface to the rest of the system
  (put '+ 'augend augend-impl)

  'done) ; 这个done啥意思

(define (augend s)
  ((get '+ 'augend) s)
)