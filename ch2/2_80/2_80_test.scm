; put/get
(load "./ch2/p256_generic_procedure/table_basic.scm")
;(load "./ch2/p256_generic_procedure/rational_number.scm")

(load "./ch2/2_80/2_80.scm")

(load "./ch2/p256_generic_procedure/ordinary_numbers.scm")

(install-scheme-number-package)
(install-scheme-number-=zero?-package)

(=zero? (make-scheme-number 0))
(=zero? (make-scheme-number 10))

; ====
(load "./ch2/p256_generic_procedure/rational_number.scm")

(install-rational-package)
(install-rational-=zero?-package)
(=zero? (make-rational 1 2))
(=zero? (make-rational 0 1))
(=zero? (make-rational 0 3))

(load "./ch2/p256_generic_procedure/complex_number.scm")
(install-complex-package)
(install-complex-=zero?-package)

(=zero? (make-complex-from-real-imag 0 0))
(=zero? (make-complex-from-real-imag 10086 10086))
(=zero? (make-complex-from-mag-ang 0 0))
(=zero? (make-complex-from-mag-ang 10086 10086))