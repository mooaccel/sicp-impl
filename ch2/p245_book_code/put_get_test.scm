; 表操作
(load "./ch2/p366_make_table.scm")
(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(define (attach-tag type-tag contents) (cons type-tag contents))

(define (make-from-real-imag x y) (cons x y)) 
;; interface to the rest of the system
(define (tag x) (attach-tag 'rectangular x)) 

(put 'make-from-real-imag 'rectangular
  (lambda (x y) (tag (make-from-real-imag x y)))) 
((get 'make-from-real-imag 'rectangular) 1 2)