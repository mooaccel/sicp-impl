(load "./ch2/p256_generic_procedure/ordinary_numbers.scm")
; 载入通用操作 add , sub , ...
(load "./ch2/p256_generic_procedure/apply_generic_use.scm")
; 采用覆盖的方式!!! 是非常方便的
(load "./ch2/2_78/modify_tag_system.scm")

(load "./ch2/p256_generic_procedure/table_basic.scm")

(install-scheme-number-package)
(define ten (make-scheme-number 10))
ten
(contents ten)
(type-tag ten)
(add ten ten)