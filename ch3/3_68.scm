(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define integers (cons-stream 1 (add-streams ones integers)))

(define (pairs s t)
  (interleave (stream-map (lambda (x) (list (stream-car s) x)) 
                          t) 
              ; 这里没有delay...会无限递归
              (pairs (stream-cdr s) (stream-cdr t))))

;Aborting!: maximum recursion depth exceeded
(stream-head (pairs integers integers) 5)