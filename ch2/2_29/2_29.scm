;  ; A binary mobile consists of two branches
;  (define (make-mobile left right) 
;    (list left right))
;  ; structure, which may be either a number (representing a simple weight) or another mobile:
;  (define (make-branch length structure) 
;    (list length structure))

(define (make-mobile left right) (cons left right)) 
(define (make-branch length structure) (cons length structure))

;(define (left-branch mobile)
;  (car mobile))
;(define (right-branch mobile)
;  (cadr mobile))
;(define (branch-length branch)
;  (car branch))
;(define (branch-structure branch)
;  (cadr branch))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cdr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cdr branch))

; ; tree
; (define (mobile? something) 
;   (list? (cadr something)))
; ; tree or leaf
; (define (structure? something)
;   (if (null? something)
;       #f
;       (list? something)))
; (define (weight-of leaf)
;   (cadr leaf))
; tree
; 输入是branch
(define (mobile? something) 
  (pair? (cdr something)))
; tree or leaf
(define (structure? something)
  (if (null? something)
      #f
      (pair? something)))
(define (weight-of leaf)
  (cdr leaf))

(define (total-weight st)
  (define (aux st acc)
    (if (not (structure? st))  ; 不是structure则是0, 包括null
        0 ;其实不会执行到这里
        (if (mobile? st)
            (let ((left_branch (left-branch st))
                  (right_branch (right-branch st)))
                 (aux right_branch (aux left_branch acc)))
            (+ acc (weight-of st))
        )
    ))
  (aux st 0))

(define (structure-torque st)
    (* (branch-length st)
       (total-weight st)))

(define (same-torque? left_st right_st)
    (= (structure-torque left_st)
       (structure-torque right_st)))

(define (mobile-balance? mobile)
  (define (structure-balance? st)
    (if (mobile? st)
        (mobile-balance? (branch-structure st))
        #t))
  (let ((left_st (left-branch mobile))
        (right_st (right-branch mobile)))
    (and (same-torque? left_st right_st)
         (structure-balance? left_st)
         (structure-balance? right_st))))