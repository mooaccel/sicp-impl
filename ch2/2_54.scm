;(equal?2 '(this is (a list)) '(this is a list))
;(equal?2 '(this is (abc (fdd) list)) '(this is (abc (fds) list)))
;(equal?2 '(this is (abc (fds) list)) '(this is (abc (fds) list)))
;(equal?2 'this 'this)
;
; cond内部为什么定义不了递归函数?
(define (isequal o1 o2)
  (cond ((or (null? o1) (null? o2))
            (if (or (not (null? o1)) 
                    (not (null? o2)))
                #f
                #t
            )
            )
        ((and (list? o1) (list? o2))
            (and (isequal (car o1) (car o2)) 
                 (isequal (cdr o1) (cdr o2))))
        (else (eq? o1 o2))))

(isequal '(this is a list) '(this is a list))
(isequal 'symbol 'symbol)
(isequal 'symbol 'another-symbol)
(isequal (list 'a 'b 'c) (list 'a 'b 'c))
(isequal (list 'a) (list 'a 'b 'c))