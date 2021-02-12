; 这是之前书本上的
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) 
  (and (variable? v1) 
       (variable? v2) 
       (eq? v1 v2)))
(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))
(define (sum? x) 
  (and (pair? x) 
       (eq? (car x) '+)))
(define (addend s) 
  (cadr s))
(define (augend s) 
  (caddr s))
(define (product? x) 
  (and (pair? x) 
       (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (deriv exp var)
  (cond ((number? exp) 0) 
        ((variable? exp) 
          (if (same-variable? exp var) 1 0)) 
        ((exponentiation? exp)
          (let ((u (base-component exp))
                (n (exponent-component exp)))

                    (let ((base_deriv_var (deriv u var))
                          (pre_product (make-product n
                                                     (make-exponentiation u
                                                                          (- n 1)))))
                        (make-product pre_product base_deriv_var))
              ))
        ((sum? exp) 
          (make-sum (deriv (addend exp) var) 
                    (deriv (augend exp) var)))
        ((product? exp)
          (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var)) 
                    (make-product (deriv (multiplier exp) var) (multiplicand exp))))
        (else
          (error "unknown expression type: DERIV" exp))))

(define (make-exponentiation base exponent)
  (cond ((= exponent 0) 1)
        ((= exponent 1) base)
        (else (list '** base exponent))))

(define (exponentiation? x) 
  (and (pair? x) 
       (eq? (car x) '**)))
(define (base-component x)
  (cadr x))
(define (exponent-component x)
  (caddr x))
