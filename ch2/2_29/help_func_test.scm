(load "./ch2/2_29/2_29.scm")

(define test_usecase_01_mobile (make-mobile (make-branch 2 
                                                         (make-mobile (make-branch 7 6)
                                                                      (make-branch 8 4)))
                                            (make-branch 3 
                                                         5)))
(define leaf1 (make-branch 2 10))
(weight-of leaf1)
(mobile? leaf1)
(mobile? (make-mobile (make-branch 7 6)
                       (make-branch 8 4)))
(structure? 5)
(structure? test_usecase_01_mobile)
(structure? leaf1)
(structure? 2)
(structure? '())
(not (structure? '()))