; https://sicp.readthedocs.io/en/latest/chp2/23.html
; if可以省略另外一个分支? 看这个例子好像可以啊. TODO, 待查...
;(define (for-each proc seqs)
;  (if (not (null? seqs))
;      (begin
;        (proc (car seqs))
;        (for-each proc (cdr seqs)))))
;(for-each (lambda (x) 
;                  (newline) 
;                  (display x))
;          (list 57 321 88))
;         ;'())

; 也可以省略else???
(define (for-each proc seqs)
  (cond ((not (null? seqs)) 
          (proc (car seqs)) 
          (for-each proc (cdr seqs)))))
(for-each (lambda (x) 
                  (newline) 
                  (display x))
          (list 57 321 88))