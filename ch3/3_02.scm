(define (make-monitored f)
  (let ((count 0))
    (define (how-many-calls?)
      count)
    (define (reset-count)
      (set! count 0))
    (define (dispatch in) 
      (cond ((eq? in 'how-many-calls?) (how-many-calls?))
            ((eq? in 'reset-count) 
              (reset-count))
            (else (begin (set! count (+ count 1))
                         (f in)))))

    dispatch))

(define mf (make-monitored sqrt)) 
mf
(mf 'how-many-calls?)
(mf 144)
(mf 'how-many-calls?)
(mf 12)
(mf 'how-many-calls?)

(mf 'reset-count)
(mf 'how-many-calls?)

;(s 'how-many-calls?)