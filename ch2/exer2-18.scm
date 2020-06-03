(define (reverse seqs)
  (define (reverse-iter remainSeqs res)
    (if (null? remainSeqs)
        res
        (reverse-iter (cdr remainSeqs) 
                      (cons (car remainSeqs)
                            res))))
  (reverse-iter seqs '()))
(define list1 (list 1 4 9 16 25))
list1
(reverse list1)
(reverse (list 1 2 3 4 5))