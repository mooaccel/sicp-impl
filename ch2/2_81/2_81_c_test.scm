; 找不到两个参数是'complex 'complex 类型的exp函数,
; 所以考虑转换, 而由于(a)定义了转换规则.所以会递归调用apply-generic,然后导致无限递归

;(load "./ch2/p265_coercion.scm")
(load "./ch2/2_81/2_81_c.scm")

; put/get
(load "./ch2/p245_book_code/table_basic.scm")

(load "./ch2/p366_make_table.scm")
(define coercion-table (make-table))
(define get-coercion (coercion-table 'lookup-proc))
(define put-coercion (coercion-table 'insert-proc!))

(define (scheme-number->scheme-number n)
    n)

(put-coercion 'scheme-number 'scheme-number 
              scheme-number->scheme-number)

(load "./ch2/p256_generic_procedure/ordinary_numbers.scm")
(install-scheme-number-package)
; 因为使用的2_81_c的修改过的apply-generic, 所以不会再对相同类型进行coercion, 
; 相当于是一种防御型编程技术, 即是前面
;           (put-coercion 'scheme-number 'scheme-number 
;                         scheme-number->scheme-number)
; 也不会导致无限递归了
(apply-generic 'exp (make-scheme-number 1)
                    (make-scheme-number 2))
; 不使用 louis 的强制程序的话
; 可以正常报错
; 否则无限递归
