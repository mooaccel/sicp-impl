; s0, s1, s2, s3...
;(define (partial-sums s)
;  (define ps (cons-stream (stream-car s)
;                          (add-streams ps (stream-cdr s))))
;  ps)
(define (partial-sums s)
  (define ps (cons-stream (stream-car s)
                          (add-streams ps (stream-cdr s))))
  ps)

(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define integers (cons-stream 1 (add-streams ones integers)))
(define partial_sums_ret (partial-sums integers))
(stream-ref partial_sums_ret 0)
(stream-ref partial_sums_ret 1)
(stream-ref partial_sums_ret 2)
(stream-ref partial_sums_ret 3)
(stream-ref partial_sums_ret 4)