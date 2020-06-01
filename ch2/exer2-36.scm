(load "ch2/car-n.scm")
(load "ch2/cdr-n.scm")
(load "ch2/accumulate.scm")

; 需要对输入进行假设...不太好, 需要假定其中每个序列的元素相同
; 考虑了seqs为null的情况
(define (accumulate-n op init seqs)
  (if (null? seqs)
      '()
      (if (null? (car seqs)) ; 抽第一个list检查
          '()
          (cons (accumulate op init (car-n seqs))
                (accumulate-n op init (cdr-n seqs))))))

(define seqs '((1 2 3) (4 5 6) (7 8 9) (10 11 100)))
;(define seqs '())
seqs
(accumulate-n + 0 seqs) ; (22 26 118)