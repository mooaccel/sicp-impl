(load "./ch2/p366_make_table.scm")

; 创建一个新表?
(define coercion-table (make-table))

(define get-coercion (coercion-table 'lookup-proc))
(define put-coercion (coercion-table 'insert-proc!))