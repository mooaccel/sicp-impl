; put/get
(load "./ch2/p256_generic_procedure/table_basic.scm")

(load "./ch2/p256_generic_procedure/ordinary_numbers.scm")
(load "./ch2/2_79/2_79.scm")

(install-scheme-number-package)
(install-scheme-number-equ?-package)

(equ? (make-scheme-number 10)
      (make-scheme-number 10))
(equ? (make-scheme-number 10)
      (make-scheme-number 1008611))

(load "./ch2/p256_generic_procedure/rational_number.scm")

(install-rational-package)
(install-rational-equ?-package)
(equ? (make-rational 1 2)
      (make-rational 1 2))
(equ? (make-rational 1 2)
      (make-rational 10086 10086))


(load "./ch2/p256_generic_procedure/complex_number.scm")
(install-complex-package)
(install-complex-equ?-package)

(equ? (make-complex-from-real-imag 1 2)
      (make-complex-from-real-imag 1 2))
(equ? (make-complex-from-real-imag 1 2)
      (make-complex-from-real-imag 10086 10086))
(equ? (make-complex-from-mag-ang 1 2)
      (make-complex-from-mag-ang 1 2))
(equ? (make-complex-from-mag-ang 1 2)
      (make-complex-from-mag-ang 10086 10086))