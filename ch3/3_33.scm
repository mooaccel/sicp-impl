(load "./ch3/p388_constraint_system/all_constraint_system.scm")

; 2 * c = a + b
(define (averager a b c)
  (let ((mid (make-connector)) 
        (constant_2_connector (make-connector)))

;    (multiplier constant_2_connector c mid) 
;    (adder a b mid) 
;    (constant 2 constant_2_connector) 
;    'ok))
; 故意下面这么写的, 试着返回multiplier的constraint
    (adder a b mid) 
    (constant 2 constant_2_connector) 
    (multiplier constant_2_connector c mid) 
    ))

(define a (make-connector)) 
(define b (make-connector))
(define c (make-connector))
(define constraint_multiplier (averager a b c))
(probe "a symbol" a) 
(probe "b symbol" b)
(probe "c symbol" c)

(set-value! a 40 'user)
(set-value! c 80 'user)
(inform-about-no-value constraint_multiplier)
(has-value? a)
(has-value? b)
(has-value? c)

; 目前这个例子能验证为什么在adder/multiplier里, 对connector进行forget之后, 还要尝试调用process-new-value进行传播
;    (define (process-forget-value)
;        (forget-value! product me)
;        (forget-value! m1 me)
;        (forget-value! m2 me)
;        (process-new-value))
; 因为有可能forget掉的某些值还可以通过其他值传播过来...