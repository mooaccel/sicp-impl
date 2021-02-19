(load "./ch2/p276/p276_poly.scm")
(load "./ch2/p276/poly_package.scm")

(load "./ch2/p245_book_code/table_basic.scm")

; 用修改版本的tag, 针对普通coeff数据优化
; (load "./ch2/2_78/modify_tag_system.scm")

(load "./ch2/2_91/2_91.scm")

(install-polynomial-package)

; 哪里用了=zero? adjoin-term
(load "./ch2/2_80/2_80.scm")
(install-scheme-number-=zero?-package)

(load "ch2/2_88.scm")
; negate
(install-polynomial-negation-package)

(load "./ch2/p238_tag.scm")

(define L1 (make-poly 'x (list (make-term 5 1) (make-term 1 -1))))
L1
(define L2 (make-poly 'x (list (make-term 2 1) (make-term 0 -1))))
L2
(term-list L2)
(newline)
(trace sub-terms)
(trace type-tag)
(sub-terms (term-list L1) (term-list L2))