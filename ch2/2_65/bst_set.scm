; 两个有序list的intersection-set
(load "./ch2/2_61/2_61.scm")
; 两个有序list的union-set
(load "./ch2/2_62.scm")
; tree->list-2
(load "./ch2/2_63/2_63.scm")
; list->tree
(load "./ch2/2_64/2_64_bookcode.scm")

; set基于bst实现
; set1 and set2合起来
(define (bst-union-set set1 set2)
  (let ((list_set1 (tree->list-2 set1))
        (list_set2 (tree->list-2 set2)))
    (list->tree (union-set list_set1 list_set2))))

(define (bst-intersection-set set1 set2)
  (let ((list_set1 (tree->list-2 set1))
        (list_set2 (tree->list-2 set2)))
    (list->tree (intersection-set list_set1 list_set2))))