; integers
(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define integers (cons-stream 1 (add-streams ones integers)))

(define (pairs s t)
  (cons-stream (list (stream-car s) (stream-car t))
               (interleave
               ;(stream-append
                  ; 第一行剩余的
                  (stream-map (lambda (x) (list (stream-car s) x)) 
                           (stream-cdr t)) 
                  ; 递归处理的
                  (pairs (stream-cdr s) (stream-cdr t)))))
; s1放在s2前面
(define (stream-append s1 s2)
  (if (stream-null? s1) 
      s2 
      (cons-stream (stream-car s1) 
                   (stream-append (stream-cdr s1) s2))))

(define (interleave s1 s2)
  (if (stream-null? s1) 
      s2 
      (cons-stream (stream-car s1) 
                   (interleave s2 (stream-cdr s1)))))

(stream-head integers 10)
(stream-head (pairs integers integers) 10)
(stream-head (pairs integers integers) 20)
; if use stream-append,  ((1 1) (1 2) (1 3) (1 4) (1 5) (1 6) (1 7) (1 8) (1 9) (1 10)) ...