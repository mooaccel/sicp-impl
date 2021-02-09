(load "./ch2/2_29/2_29.scm")

(define test_usecase_01_mobile (make-mobile (make-branch 2 
                                                         (make-mobile (make-branch 7 6)
                                                                      (make-branch 8 4)))
                                            (make-branch 3 
                                                         5)))

(mobile-balance? test_usecase_01_mobile)

(define test_usecase_02_mobile (make-mobile (make-branch 10
                                                         (make-mobile (make-branch 4 6)
                                                                      (make-branch 6 4)))
                                            (make-branch 20
                                                         5)))

(mobile-balance? test_usecase_02_mobile)
