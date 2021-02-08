(define (cons2 x y) 
  (* (expt 2 x)
     (expt 3 y)))

(define (car2 z)
    (if (= 0 (remainder z 2))
        (+ 1 (car2 (/ z 2)))
        0))

(define (cdr2 z)
    (if (= 0 (remainder z 3))
        (+ 1 (car2 (/ z 3)))
        0))

; (define (car2 r)
;   )
; (define (cdr2 r)
; 
; (define pair (cons2 2 10))
; (car2 pair)
; (cdr2 pair)

(define r (cons2 3 4))
(car2 r)
(cdr2 r)