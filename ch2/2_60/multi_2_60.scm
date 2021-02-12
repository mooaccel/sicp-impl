; 还需要借助这个, 虽然功能一样, 但是名字有区别
(define (element-of-set? x set)
  (cond ((null? set) false) 
        ((equal? x (car set)) true) 
        (else (element-of-set? x (cdr set)))))
; O(n)
(define (multi-element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (multi-element-of-set? x (cdr set)))))
; O(1)
(define (multi-adjoin-set x set)
  (cons x set))
; (car set1) 看看是不是也在set2里面, 如果在准备把它加入
; 在加入之前还需要看看是否已经在交集里了...
; 时间复杂度O(n^2)?
; 如果是可以重复的set1, set2, 这个intersection操作更复杂
(define (multi-intersection-set set1 set2)
  (if (or (null? set1) (null? set2)) 
      '() 
      (let ((check_elem (car set1))
            (sub_inter_set (multi-intersection-set (cdr set1) set2)))

        (if (element-of-set? check_elem sub_inter_set)
            sub_inter_set
            (if (multi-element-of-set? check_elem set2)
                (cons check_elem sub_inter_set)
                (sub_inter_set)))
      )))

; 但是union简单
; O(n), 因为要操作set1, 除非用指针直接连接, 那样是O(1)
(define (multi-union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (append set1 set2))))

(multi-adjoin-set 1 (list 1 2 3 4))
(multi-union-set '(1 2 3) '(3 4 5 6))
(multi-intersection-set '() (list 1 2 3))
(multi-intersection-set (list 1 2 1 2) (list 1 2 1 2))
(multi-intersection-set (list 1 2 2 3) (list 1 2 2 3 4))