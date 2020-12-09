(load "./ch1/1_31/product.scm")

(define (factorial x)
        (product (lambda (x) x)
                 1
                 (lambda (num) (+ num 1))
                 x))

(factorial 5)

(factorial 10)