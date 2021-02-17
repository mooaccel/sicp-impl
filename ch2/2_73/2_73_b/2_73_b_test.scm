(load "./ch2/2_73/2_73_b/2_73_b_sum.scm")
(load "./ch2/2_73/2_73_b/2_73_b_product.scm")

; deriv
(load "./ch2/2_73/2_73.scm")

(install-sum-package)
(install-product-package)

(deriv 'x 'x)
(deriv 3 'x)

(define sum-1 (make-sum 'x (make-sum 'x 14)))
sum-1
(deriv sum-1 'x)
(deriv (make-sum 'x (make-product 'x (make-product 'x 'x))) 'x)
;((get 'deriv 'sum) (contents sum-1) 'x)
;(list 'sum 'x '3) 'x)

; 因为符号改成了'+ '*
; 而在deriv实现里, '+ '*既是操作符, 又是tag
; 所以可以下面这么写
; (operator exp)拿到操作符, 也即tag, 这是这个例子比较妙的一点, tag同时也是操作符
(deriv '(+ (* 10 x) x) 'x)