(load "./ch2/2_73/2_73_b/2_73_b_sum.scm")

; deriv
(load "./ch2/2_73/2_73.scm")

(install-sum-package)

(deriv 'x 'x)
(deriv 3 'x)

;(deriv (list 'sum 'x '3) 'x)

(load "./ch2/2_73/2_73_b/tag_basic.scm")
(define sum-1 (make-sum 'x (make-sum 'x 14)))
sum-1
((get 'deriv 'sum) (contents sum-1) 'x)
;(list 'sum 'x '3) 'x)