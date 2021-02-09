(load "./ch2/2_37/2_37.scm")

; (3 * 4) (4 * 1)

; 3行  1行
(define m (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)))
(define v (list 1 2 3 4))
(matrix-*-vector m v)