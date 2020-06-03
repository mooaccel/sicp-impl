; 自己定义map
(define (map proc seqs)
  (if (null? seqs)
      '()
      (cons (proc (car seqs))
            (map proc (cdr seqs)))))

; 用自带的map也ok
(map abs (list -10 2.5 -11.6 17))
(map (lambda (x) (* x x))
     (list 1 2 3 4))