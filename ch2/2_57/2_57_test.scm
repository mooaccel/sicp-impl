(load "./ch2/2_57/2_57.scm")

;(define val1 (make-sum 1 2 3 4 5))

(deriv '(* x y (+ x 3)) 'x)
(deriv '(+ (* x y) (* 2 x y) (* 3 x y)) 'x)