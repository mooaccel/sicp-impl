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
; 返回
;   57
;   321
;   88
;   ;Unspecified return value, 这个是因为cond在最后没有满足的cond的值没有定义. 见教材1.1.6

;
;(define (abs-v2 x)
;  (cond ((< x 0) (- x))
;        ))
;
;(define val1 (abs-v2 -5))
;val1
;(define val2 (abs-v2 10))
;val2
;; Unspecified return value

(define (abs-v3 x)
  (if (< x 0) 
      (- x)))

(define val1 (abs-v3 -5))
val1
(define val2 (abs-v3 10))
val2
; 这个是Unspecified return value, 和cond一样