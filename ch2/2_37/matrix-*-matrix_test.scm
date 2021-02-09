(load "./ch2/2_37/2_37.scm")

(define m (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)))
(matrix-*-matrix m 
                 (transpose m))
(matrix-*-matrix2 m 
                 (transpose m))