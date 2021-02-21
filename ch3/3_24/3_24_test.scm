(load "./ch3/3_24/3_24.scm")

(define number-table (make-table =))  ; 以数字为关键字的表

((number-table 'insert-proc!) 10086 10086 'hello-moto)
((number-table 'lookup-proc) 10086 10086)

(define symbol-table (make-table eq?)) ; 以符号为关键字的表
((symbol-table 'insert-proc!) 'peter 'age 25)
((symbol-table 'lookup-proc) 'peter 'age)