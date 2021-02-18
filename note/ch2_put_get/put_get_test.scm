(load "./note/ch2_put_get/apply_generic_impl.scm")

(load "./ch2/p366_make_table.scm")

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put 'magnitude '(polar) magnitude)

(define (magnitude z) 
  ;(display "magnitude call...")
  ;(display z)
  (apply-generic 'magnitude z)) 

; 传入的z = ((rectangular . 10) (polar joq . 20)) 
(define val1 (list (cons 'rectangular 10) (cons 'polar (cons 'joq 20))))
val1

; =====
(define val2 (cons 'polar (cons 'joq 20)))
(define val3 (cons 'polar (cons 'joq 30)))
;(apply-generic 'magnitude val2 val3)
; ((polar joq . 20) (polar joq . 30))
; type-tags (polar polar) 

; 随便捏造的一个函数, 用于测试
; '(polar polar) 两个参数都需要带有polar tag
; (get op type-tags) 会去找下面的这个函数
; (magnitude (polar polar))

; (put 'magnitude '(polar polar)
;  (lambda (x y) (+ (cdr x)
;                   (cdr y))))
  ;(lambda (x y) 
  ;  (
  ;    (newline)
  ;    (display x)
  ;    (newline)
  ;    (display y)
  ;  )))

(apply-generic 'magnitude val2 val3)