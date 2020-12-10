(load "./ch1/1_37.scm")

; 1 2 1 1 4 1 1 6 1 1 8
; 1 2 3 4 5 6 7 8 9 10 11
;   2     2     2     2
;   2     5     8     11
; (remaind x 3) = 0/1  1
; (remaind x 3) = 2  ? 2 * step
;  (i+1)/3 * 2
(define (dterm i)
  (if (= (remainder i 3) 2)
      (* 2 (/ (+ i 1)
              3))
      1))

(define (compute-e precision)
  (+ (cont-frac (lambda (i) 1.0)
                dterm 
                precision)
     2))

; 2.7182818284590455
(compute-e 100)