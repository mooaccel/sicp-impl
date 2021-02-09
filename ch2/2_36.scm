(define (accumulate op initial sequence) 
  (if (null? sequence) 
    initial 
    (op (car sequence) 
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (define (car-n seqs)
    (map car seqs))
  (define (cdr-n seqs)
    (map cdr seqs))
  (if (null? (car seqs)) 
      '() 
      (cons (accumulate op init (car-n seqs)) 
            (accumulate-n op init (cdr-n seqs)))))

(define seqs '((1 2 3) (4 5 6) (7 8 9) (10 11 100)))
(accumulate-n + 0 seqs) ; (22 26 118)