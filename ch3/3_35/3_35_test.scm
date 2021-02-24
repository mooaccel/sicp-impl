(load "./ch3/p388_constraint_system/all_constraint_system.scm")
(load "./ch3/3_35/3_35.scm")

(define a (make-connector)) 
(define b (make-connector))

(squarer a b)

(probe "a" a) 
(probe "b" b) 

(set-value! a 11 'user)
(forget-value! a 'user)
(has-value? a)
(has-value? b)
;(set-value! b 11 'user)
;(set-value! b 112 'user)