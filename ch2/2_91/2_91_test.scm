; first-term 
; rest-terms 
(load "./ch2/p276/p276_poly.scm")
(load "./ch2/p276/poly_package.scm")

(load "./ch2/p245_book_code/table_basic.scm")
(load "./ch2/p238_tag.scm")

(install-polynomial-package)
; (define val1 (list '(1 2) '(2 3) '(3 4)))
; val1
; (first-term val1)
; (rest-terms val1)

; x^5 - 1, term: (5 1)
(define L1 (make-poly 'x (list (make-term 5 1) (make-term 0 -1))))
L1
(define L2 (make-poly 'x (list (make-term 2 1) (make-term 0 -1))))
L2

(define (div-terms L1 L2)