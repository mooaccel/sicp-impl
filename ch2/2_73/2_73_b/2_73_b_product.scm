(load "./ch2/2_73/2_73_b/table_basic.scm")

(define (install-product-package)
  ;; internal procedures
  (define (make-product m1 m2) (list '* m1 m2))
  (define (multiplier p) (cadr p))
  (define (multiplicand p) (caddr p))
  (define (deriv exp var) 
    (make-sum (make-product (multiplier exp) 
                            (deriv (multiplicand exp) var)) 
              (make-product (deriv (multiplier exp) var) 
                            (multiplicand exp))))
  ;; interface to the rest of the system
  ;(define (tag x) (attach-tag ' x)) 
  (put 'deriv '(product) deriv))