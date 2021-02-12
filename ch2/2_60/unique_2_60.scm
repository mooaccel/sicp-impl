; equal?还能比较list
; O(n)
(define (element-of-set? x set)
  (cond ((null? set) false) 
        ((equal? x (car set)) true) 
        (else (element-of-set? x (cdr set)))))
; O(n)
(define (adjoin-set x set)
  (if (element-of-set? x set) 
      set 
      (cons x set)))
; O(n^2)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) 
          '()) 
        ((element-of-set? (car set1) set2)   ; if (car set1) 在set2里
          (cons (car set1) 
                (intersection-set (cdr set1) set2))) 
        (else (intersection-set (cdr set1) 
                                set2))))
; 在两者其中一个的就行, 把重复的排除出去
; 返回两个集合的union
; (union-set (cdr set1) set2) + (car set1 if this elem not in set2), 
; 分析时间复杂度的方法和intersection-set一样, 也是O(n^2)
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
          (union-set (cdr set1) 
                     set2))
        (else (cons (car set1) 
                    (union-set (cdr set1) 
                               set2)))))