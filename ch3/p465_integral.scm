(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (add-streams s1 s2) (stream-map + s1 s2))

; integrand是一串xi
(define (integral integrand initial-value dt)
  (define int (cons-stream initial-value 
                           (add-streams (scale-stream integrand dt) 
                                        int))) 
  int)
; C
; C + x1
; C + x1 + x2
; C + x1 + x2 + x3
; ...