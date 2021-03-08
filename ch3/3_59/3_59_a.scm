(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define integers (cons-stream 1 (add-streams ones integers)))

(define (div-streams s1 s2)
    (stream-map / s1 s2))
(stream-head (div-streams ones integers) 10)
(define (integrate-series a)
  (mul-streams a                                  ; a0, a1, a2, ...
               (div-streams ones integers)))      ; 1/1, 1/2, 1/3, ...