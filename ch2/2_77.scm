; put/get
; 这个put/get放哪待优化
(load "./ch2/p256_generic_procedure/table_basic.scm")

; add/mul/...
(load "./ch2/p256_generic_procedure/apply_generic_use.scm")
; complex_number system
(load "./ch2/p256_generic_procedure/complex_number.scm")

(install-complex-package)

; 带个点因为是cons, 而不是list
; 底下是cons(3.2 4.5)
(define complex10 (make-complex-from-real-imag 3 4))
(define complex11 (make-complex-from-mag-ang 100 (/ 3.1415 2)))
complex10
complex11

(add complex10 complex11)
; 如果不对第一层的complex tag进行处理, 虽然可以这样, 可以但是不好
; (magnitude (cdr complex10))

;(angle complex10)
;(angle complex11)

; 第一次
; 派发给谁?
; 第二次根据是'rectangular 还是'polar调用
; (define (magnitude z) 
;   (apply-generic 'magnitude z)) 

(magnitude complex10)

;(define (apply-generic op . args)
; 两次dispatch
; 参数分别是:
; op: magnitude
; args: ((complex rectangular 3 . 4))

; op: magnitude
; args: ((rectangular 3 . 4))

; todo, 不太明白的:
;  (put 'magnitude '(complex) magnitude) 
; 这么加入进去的语法'(complex), 在'magnitude 'complex点生成一个可供dispatch的procedure
; 这个语法什么意思?
; 好像书上哪里有讲
; p246
; 这句话什么意思? 还是不懂...
; We use the list (rectangular) rather than the symbol rectangular to allow for the possibility of operations with multiple arguments, not all of the same type.