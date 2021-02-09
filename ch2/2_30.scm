; 注意map输入是list, 输出也是list, 和foreach不同
(define (square-tree tree)
  (map (lambda (sub_tree)  ; map内部输入一个元素, 输出一个元素
          (if (list? sub_tree)
              (square-tree sub_tree)
              (* sub_tree sub_tree)))
       tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))