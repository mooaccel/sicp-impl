; put/get
(load "./ch2/p245_book_code/tag_basic.scm")
(load "./ch2/p245_book_code/table_basic.scm")

(load "./ch2/p245_book_code/polar.scm")
(load "./ch2/p245_book_code/rectangular.scm")

; 获取make-from-real-imag
(load "./ch2/p245_book_code/apply_generic.scm")

(install-polar-package)
(install-rectangular-package)

(define complex1 (make-from-real-imag 11 22))

(real-part complex1)
(imag-part complex1)

(define complex2 (make-from-mag-ang 10 20))

(real-part complex2)
(imag-part complex2)