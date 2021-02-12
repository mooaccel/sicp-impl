(load "./ch2/2_58/deriv.scm")

(deriv (make-exponentiation 'x 0) 'x)
(deriv '(x * y) 'x)
(deriv '((x * y) * (x + 3)) 'x)