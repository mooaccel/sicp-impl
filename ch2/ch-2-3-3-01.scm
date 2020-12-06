(define (elementOfSet? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (elementOfSet? x (cdr set)))))