(load "./ch2/2_73/2_73_c/2_73_exponentiation.scm")
; 前一个问题的
(load "./ch2/2_73/2_73_b/2_73_b_product.scm")
(load "./ch2/2_73/2_73_b/2_73_b_sum.scm")
; deriv
(load "./ch2/2_73/2_73.scm")

; 每一种类型都放在一起
; 然后install
(install-exponentiation-package)
(install-product-package)
(install-sum-package)

(make-exponentiation 'x 3)
(deriv (make-exponentiation 'x 3) 'x)
(deriv (make-exponentiation 'x 2) 'x)
(deriv (make-exponentiation 'x 1) 'x)
(deriv (make-exponentiation 'x 0) 'x)
(deriv (make-sum 'x (make-exponentiation 'x 3)) 'x)