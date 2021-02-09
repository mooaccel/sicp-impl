(load "./ch2/2_29/total_weight.scm")

(define test_usecase_01_mobile (make-mobile (make-branch 100
                                                         (make-mobile (make-branch 7 6)
                                                                      (make-branch 8 4)))
                                            (make-branch 3 
                                                         5)))
; 结果返回15 = 5 + 6 + 4
test_usecase_01_mobile
(mobile? test_usecase_01_mobile)
(total-weight test_usecase_01_mobile)