(define x (list 1 2 3)) 
(define y (list 4 5 6))
(append x y) ; (1 2 3 4 5 6) ?
(cons x y) ; ((1 2 3) 4 5 6) if y是一个list, 那就是在y这个list之前添加一个元素
(list x y) ; ((1 2 3) (4 5 6))
