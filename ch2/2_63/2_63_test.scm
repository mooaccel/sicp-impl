(load "./ch2/2_63/2_63.scm")

(define a (make-tree 7
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      (make-tree 5 '() '()))
                           (make-tree 9
                                      '()
                                      (make-tree 11 '() '()))))
(define b (make-tree 3
                           (make-tree 1 '() '())
                           (make-tree 7
                                      (make-tree 5 '() '())
                                      (make-tree 9
                                                 '()
                                                 (make-tree 11 '() '())))))
(define c (make-tree 5
                           (make-tree 3
                                      (make-tree 1 '() '())
                                      '())
                           (make-tree 9
                                      (make-tree 7 '() '())
                                      (make-tree 11 '() '()))))

(tree->list-1 a)
(tree->list-2 a)
(tree->list-1 b)
(tree->list-2 b)
(tree->list-1 c)
(tree->list-2 c)

; b
; 虽然 tree->list-1 和 tree->list-2 对于同样的树生成的列表一样，但是 tree->list-2 的复杂度比 tree->list-1 更低。
; 参考https://sicp.readthedocs.io/en/latest/chp2/63.html
; 关键在于append不是O(1)操作, tree->list-1有append, 所以更慢