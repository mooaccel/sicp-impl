(load "./ch2/2_65/bst_set.scm")

(define ut (bst-union-set (list->tree '(1 2 3 4 5))
                          (list->tree '(1 3 5 7 9))))
ut
(list->tree (tree->list-2 ut))