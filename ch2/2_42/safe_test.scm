(load "./ch2/2_42/2_42.scm")

(equal-row? 5 '(1 2 3 4))
(equal-row? 1 '(1 2 3 4))
(length '(1 2 3 4)) ; 4
(length '()) ; 0
(define val2 (list 1))
(car val2)
(null? val2)
(null? (cdr val2))

(diagona? 4 (list 3 2 1))
(diagona? 2 (list 8 5 7 1))
(diagona? 2 (list 1 3))
(diagona? 2 (list 3 3))

(define base_case (list empty-board))
base_case
(define val3 (cons 1 base_case))
(list? val3)
(list? (cdr val3))
(pair? val3)
(pair? (cdr val3))
(cdr val3)
(car (cdr val3))

; 所以得把base情况设置成(list '())
(map (lambda (x) (cons 1 x)) (list '()))
; ('()) 
; =>
; ((1))

;  (flatmap (lambda (rest-of-queens) 
;                   (map (lambda (new-row) (adjoin-position new-row 99 rest-of-queens)) 
;                        (enumerate-interval 1 4))) 
;           (list empty-board))
;  ; ((1) (2) (3) (4))
;  (map (lambda (rest-of-queens) 
;                   (map (lambda (new-row) (adjoin-position new-row 99 rest-of-queens)) 
;                        (enumerate-interval 1 4))) 
;           (list empty-board))
; (((1) (2) (3) (4)))
; (list empty-board)
; (())
; ()经过map 一个元素 => (一个元素)
; 这个元素是啥? 
; (enumerate-interval 1 4)
; (1 2 3 4)
; => 
;                   (map (lambda (new-row) (adjoin-position new-row 99 '())) 
;                        (enumerate-interval 1 4))
;((1) (2) (3) (4))
; (()) => (((1) (2) (3) (4)))
(define val10 '(((1) (2) (3) (4)))
  )
(accumulate append '() val10)
; (cdr val10) => ()
; (null? (cdr val10)) => #t