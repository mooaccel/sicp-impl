; 给的list假定nonempty
; 返回最后一个pair(最后一定要是一个pair..., cdr pair == null)
; 只适用于list
(define (last-pair seqs)
  (if (null? (cdr seqs))
      seqs
      (last-pair (cdr seqs))))

(last-pair (list 23 72 149 34))

; 有问题的测试值
; 所以明白为啥不叫last-elem了...
(define testVal (cons 1 
                      (cons 2 3)))
testVal
; (last-pair testVal)
; The object 3, passed as the first argument to cdr, is not the correct type.