(load "./ch3/p388_constraint_system/all_constraint_system.scm")

(define (cv const_val)
  (let ((z (make-connector)))
    (constant const_val z)
    z))

(define (c+ x y)
  (let ((z (make-connector))) 
    (adder x y z) 
    z))
; z = x - y 
; z + y = x
(define (c- x y)
  (let ((z (make-connector))) 
    (adder z y x) 
    z))
(define (c* x y)
  (let ((z (make-connector))) 
    (multiplier x y z) 
    z))
; z = x / y
; x = z * y
(define (c/ x y)
  (let ((z (make-connector))) 
    (multiplier z y x) 
    z))

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) 
              (cv 5))
          x) 
      (cv 32))
  ) 

(define C (make-connector)) 
(define F (celsius-fahrenheit-converter C))