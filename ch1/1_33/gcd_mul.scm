(load "./ch1/1_33/filtered_accumulate.scm")
(load "./ch1/1_33/gcd.scm")

(define (compute-mul-gcd-in-range n)
  (filtered-accumulate *
                       1 
                       (lambda (x) x)
                       1
                       (lambda (i) (+ i 1)) 
                       (- n 1)
                       (lambda (elem) (coprime? elem n))))

; 189
; 1 3 7 9和10互素 
(compute-mul-gcd-in-range 10)
; (gcd 1 10)
; (gcd 2 10)
; (gcd 3 10)
; (gcd 4 10)
; (gcd 5 10)
; (gcd 6 10)
; (gcd 7 10)
; (gcd 8 10)
; (gcd 9 10)