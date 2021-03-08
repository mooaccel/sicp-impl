(define (integers-starting-from n) (cons-stream n (integers-starting-from (+ n 1))))
(define (divisible? x y) (= (remainder x y) 0))
(define (sieve stream) 
  (cons-stream (stream-car stream) 
               (sieve (stream-filter (lambda (x) 
                                              (not (divisible? x (stream-car stream)))) 
                                     (stream-cdr stream))))) 

(define primes (sieve (integers-starting-from 2)))
(stream-ref primes 0)
(stream-ref primes 1)
(stream-ref primes 2)
(stream-ref primes 50)
(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) (stream-map + s1 s2))
; 带记忆化
(define integers (cons-stream 1 (add-streams ones integers)))
;(stream-car integers)
;(car (stream-cdr integers))
(stream-cdr (stream-cdr integers))
;(stream-ref integers 0)
;(stream-ref integers 1)
;(stream-ref integers 2)
;(stream-ref integers 3)
; 妙...
(define fibs
  (cons-stream 0 (cons-stream 1 
                              (add-streams (stream-cdr fibs) fibs))))
; fibs, 0, 1, 1, 2, 3, 5...
;       1, 1, 2, 3