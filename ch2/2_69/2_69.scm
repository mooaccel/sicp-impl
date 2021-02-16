(load "./ch2/p226_huffman_tree.scm")

(define (generate-huffman-tree pairs) 
  (successive-merge (make-leaf-set pairs)))

(define (only-one-elem? set)
  (null? (cdr set)))
; (make-leaf-set pairs)执行完之后, 按权重大小排序
; 小的在car这边, 形成新的节点之后再把节点通过adjoin-set放入leaf-set. 然后再递归调用successive-merge
(define (successive-merge leaf-set)
  (cond ((null? leaf-set) 
          '())
        ((only-one-elem? leaf-set)
          (car leaf-set))
        (else (let ((elem1 (car leaf-set))
                    (elem2 (cadr leaf-set)))
                    ; 怎么区分左和右? 这个不重要吧?
                    (let ((new_elem (make-code-tree elem1 elem2)))
                      (successive-merge (adjoin-set new_elem (cddr leaf-set))))
                    ))))