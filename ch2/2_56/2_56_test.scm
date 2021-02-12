(load "./ch2/2_56/2_56.scm")

(make-exponentiation 'x 20)
(make-exponentiation 'x 0)
(make-exponentiation 'x 1)

(deriv (make-exponentiation 'x 0) 'x)
(deriv (make-exponentiation 'x 1) 'x)
(deriv (make-exponentiation 'x 2) 'x)
(deriv (make-exponentiation 'x 3) 'x)

; 5_56还不能处理多个乘积的情况, 5_57能处理
; (deriv '(* x y (+ x 3)) 'x)