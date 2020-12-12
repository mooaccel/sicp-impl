; fast-expt
(load "./ch1/1_16.scm")

; repeated
(load "./ch1/1_43.scm")

; fixed-point/ average-damp
(load "./ch1/1_36.scm")

; n, average-damp应用几次?
; (average-damp(average-damp(raw-f)))
(define (search-root raw-f n)
  (let ((f-after-multi-average-damp ((repeated average-damp n) raw-f)))
      (fixed-point f-after-multi-average-damp 1.0)))

; x^2 = a
(search-root (lambda (x) (/ 10 x)) 1)
; x^3 = a
(search-root (lambda (x) (/ 64 (square x))) 1)
; x^4 = a
(search-root (lambda (x) (/ 81 (* x x x))) 2)
; x^5 = a
(search-root (lambda (x) (/ 243 (* x x x x))) 2)
; x^6 = a
(search-root (lambda (x) (/ 243 (* x x x x x))) 2)
; x^7 = a
(search-root (lambda (x) (/ 243 (* x x x x x x))) 2)
; x^8 = a
(search-root (lambda (x) (/ 1000 (* x x x x x x x))) 3)