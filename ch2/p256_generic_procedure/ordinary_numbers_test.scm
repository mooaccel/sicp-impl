; put/get
; 这个put/get放哪待优化
(load "./ch2/p256_generic_procedure/table_basic.scm")

; add/mul/...
(load "./ch2/p256_generic_procedure/apply_generic_use.scm")

(load "./ch2/p256_generic_procedure/ordinary_numbers.scm")

(install-scheme-number-package)

(define ordinary_number_10 (make-scheme-number 3))
(define ordinary_number_11 (make-scheme-number 4))
ordinary_number_10
ordinary_number_11
(add ordinary_number_10 ordinary_number_11)
(mul ordinary_number_10 ordinary_number_11)