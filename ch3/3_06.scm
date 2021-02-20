(define random-init 0) 

;(define rand (let ((x random-init))
;  (lambda () (set! x (rand-update x)) x)))
(define (rand-update x) (+ x 1))

(define rand 
  (let ((x random-init)) 
    (define (dispatch message) 
      (cond ((eq? message 'generate) 
              (begin (set! x (rand-update x)) 
                     x)) 
            ((eq? message 'reset) 
              (lambda (new-value) (set! x new-value))))) 
    dispatch)) 
(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 1)
(rand 'generate)
(rand 'generate)