; 1, 2, 4, 8, 16...
(define (add-streams s1 s2) (stream-map + s1 s2))
(define s (cons-stream 1 (add-streams s s)))

(stream-ref s 0)
(stream-ref s 1)
(stream-ref s 2)
(stream-ref s 3)