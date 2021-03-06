(define (stream-enumerate-interval low high)
    (if (> low high)
        '()
        (cons-stream
            low
            (stream-enumerate-interval (+ 1 low) high))))

;(define val10 (stream-enumerate-interval 1 10))
;(stream-car val10)
;(stream-cdr val10)