(load "./ch2/2_69/2_69.scm")

(define pairs (list (list 'A 4)
                    (list 'B 2)
                    (list 'C 1)
                    (list 'D 10)))
(make-leaf-set pairs)
(define sample_tree_02 (generate-huffman-tree pairs))
;(
;  ((leaf a 4) 
;   ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) 
;   (a b d c) 
;   8)
;)