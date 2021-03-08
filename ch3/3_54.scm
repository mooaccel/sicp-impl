(define (mul-streams s1 s2) (stream-map * s1 s2))
; 1 * 2 * 3 * 4
(define factorials (cons-stream 1 (mul-streams factorials 
                                               (stream-cdr integers))))

(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define integers (cons-stream 1 (add-streams ones integers)))

(stream-ref factorials 0)
(stream-ref factorials 1)
(stream-ref factorials 2)
(stream-ref factorials 3)