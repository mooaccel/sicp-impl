; put/get
; 这个put/get放哪待优化
(load "./ch2/p256_generic_procedure/table_basic.scm")

; add/mul/...
(load "./ch2/p256_generic_procedure/apply_generic_use.scm")

(load "./ch2/p256_generic_procedure/rational_number.scm")

(install-rational-package)

(define rational10 (make-rational 4 5))
(define rational11 (make-rational 2 5))
rational10 
rational11
(add rational10 rational11)
(mul rational10 rational11)