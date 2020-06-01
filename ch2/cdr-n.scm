(define (cdr-n seqs)
  (map cdr seqs)) ; map是环境自带的
  

;(define s (list (list 1 2 3)
;                (list 4 5 6)
;                (list 7 8 9)
;                (list 10 11 12)))
;
;(cdr-n s)