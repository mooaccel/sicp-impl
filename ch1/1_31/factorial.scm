(load "./ch1/1_31/product.scm")

(define (facrorial x)
        (product (lambda (x) x)
                 1
                 (lambda (num) (+ num 1))
                 x))

(facrorial 5)
