(load "./ch1/1_46/1_46.scm")

(define (fixed-point f first-guess)
  ;(define (good-enough? new-guess old-guess)
  ;  (< (/ (abs (- new-guess old-guess))
  ;             old-guess)
  ;     0.0001))
  (define (good-enough? x y) 
    (let ((tolerance 0.00001))
      (< (abs (- x y)) 
         tolerance)))
  ((iterative-improve good-enough? (lambda (guess) (f guess))) first-guess))

(fixed-point (lambda (x) 
                     (+ (square x)
                        (* -3 x)
                        4))
             1.5)
(fixed-point (lambda (y) 
                     (+ (sin y) (cos y)))
             1.0)
(fixed-point cos 1.0)
; ((lambda (x) 
;          (+ (square x)
;             (* -3 x)
;             4)) 1.9861184729707544)
;
; ((lambda (x) 
;          (+ (square x)
;             (* -3 x)
;             4)) 1.9968506613061563)