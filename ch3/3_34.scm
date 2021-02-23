(load "./ch3/p388_constraint_system/all_constraint_system.scm")

(define (squarer a b) 
  (multiplier a a b))
(define a (make-connector))
(define b (make-connector))
(probe "a" a)
(probe "b" b)

(squarer a b)
(set-value! a 3 'user)
(forget-value! a 'user)

(set-value! b 16 'user)
(has-value? a)
; 通过对 Louis 的 squarer 过程进行测试发现，当为 a 设置值的时候， b 的值可以正确地计算出来，但如果只为 b 设置值，那么 a 没有办法计算出来。