; 这是之前书本上的
(load "./ch2/2_57/multi_add.scm")
(load "./ch2/2_57/multi_mul.scm")

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) 
  (and (variable? v1) 
       (variable? v2) 
       (eq? v1 v2)))

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