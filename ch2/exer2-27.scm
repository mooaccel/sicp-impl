; 遇到nil就返回nil
(define (reverse seqs)
  (define (reverse-iter remainSeqs res)
    (if (null? remainSeqs)
        res
        (reverse-iter (cdr remainSeqs) 
                      (cons (car remainSeqs)
                            res))))
  (reverse-iter seqs '()))
(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
; 题外话, 这样是不行的: 
; (define y (cons 1 (cons 2 331)))
; The object 331, passed as the first argument to car, is not the correct type;
; (reverse y)

(define (deepReverse seqs)
  (define (reverse-iter remainSeqs res)
    (if (null? remainSeqs)
        res
        (reverse-iter (cdr remainSeqs) 
                      (cons (if (not (pair? (car remainSeqs)))
                                (car remainSeqs)
                                (deepReverse (car remainSeqs)))
                            res))))
  (reverse-iter seqs '()))
(deepReverse x)

(define val (list (list (list 1 2 3) (list 4 5 6)) (list (list 7 8 9) (list 10 11 12))))
val
(deepReverse val)
