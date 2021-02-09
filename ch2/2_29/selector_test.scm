(load "./ch2/2_29/2_29.scm")

(define mob (make-mobile 5 10))
(left-branch mob)
(right-branch mob)

(define branch (make-branch 100 12))
(branch-length branch)
(branch-structure branch)
(structure? '())
(null? '())
(not (structure? (make-branch 7 6)))
(mobile? (make-branch 7 6))
(weight-of (make-branch 7 6))
