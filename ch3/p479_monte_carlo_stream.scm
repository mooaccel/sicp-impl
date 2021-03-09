(define random-init 0) 
(define (rand-update x) (+ x 1))

; 随机数序列
(define random-numbers
  (cons-stream random-init (stream-map rand-update random-numbers)))

; 两两一组
(define (map-successive-pairs f s) 
  (cons-stream (f (stream-car s) 
                  (stream-car (stream-cdr s))) 
               (map-successive-pairs f 
                                     (stream-cdr (stream-cdr s)))))

; 实验流, false, true
(define cesaro-stream (map-successive-pairs
                        (lambda (r1 r2) (= (gcd r1 r2) 1))
                        random-numbers))
;(stream-ref cesaro-stream 0)
;(stream-ref cesaro-stream 1)
;(stream-ref cesaro-stream 2)

(define (monte-carlo experiment-stream passed failed) 
  (define (next passed failed) 
    (cons-stream (/ passed (+ passed failed)) 
                 (monte-carlo (stream-cdr experiment-stream) passed failed))) 
  (if (stream-car experiment-stream) 
      (next (+ passed 1) failed) 
      (next passed (+ failed 1))))
; 所有的pi变成一个stream
(define pi (stream-map (lambda (p) (sqrt (/ 6 p))) 
                       (monte-carlo cesaro-stream 0 0)))
(stream-ref pi 0)
(rand)