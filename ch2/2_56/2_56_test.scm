(load "./ch2/2_56/2_56.scm")

(make-exponentiation 'x 20)
(make-exponentiation 'x 0)
(make-exponentiation 'x 1)

(deriv (make-exponentiation 'x 0) 'x)
(deriv (make-exponentiation 'x 1) 'x)
(deriv (make-exponentiation 'x 2) 'x)
(deriv (make-exponentiation 'x 3) 'x)