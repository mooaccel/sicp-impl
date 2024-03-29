; iter-factorial.scm
(define (factorial n)
    (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* counter product)
                   (+ counter 1)
                   max-count)))
; 0
; (factorial 0)
; 0
; (factorial 1)
; 120
; (factorial 5)