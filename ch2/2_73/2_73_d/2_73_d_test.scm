(load "./ch2/2_73/2_73_d/deriv_type.scm")

(load "./ch2/2_73/2_73_d/make_sum_type.scm")
(load "./ch2/2_73/2_73_d/addend_type.scm")
(load "./ch2/2_73/2_73_d/augend_type.scm")
;(load "./ch2/2_73/2_73_d/make_product_type.scm")

; deriv
(load "./ch2/2_73/2_73_d/deriv_framework_02.scm")

(install-deriv-package)

(install-make-sum-package)
(install-addend-package)
(install-augend-package)
;(install-product-package)

(define sum-1 (make-sum 'x 
                        (make-sum 'x 14)))
sum-1
;(deriv '(+ (* 10 x) x) 'x)
;(deriv (make-sum 'x (make-product 'x (make-product 'x 'x))) 'x)

; (operator sum-1)
; (operands sum-1)
; ((get (operator sum-1) 'deriv) 
;  (operands sum-1) 'x)
; (addend (operands sum-1))
; (augend (operands sum-1))
;(addend (operands sum-1))


(deriv sum-1 'x)