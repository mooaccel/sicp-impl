;solution1 by myself
;(define (squareSum x y)
;  (+ (* x x)
;     (* y y)))
;(define (sumOfTwoLargeSquare a b c)
;        (cond ((and (< a b) (< a c)) (squareSum b c))
;              ((and (< b a) (< b c)) (squareSum a c))
;              (else (squareSum a b))))

;solution2 from other
(define (sumOfTwoLargeSquare a b c)
  (- (+ (square a)
        (square b)
        (square c))
     (square (min a b c))))
(define (square x)
        (* x x))

; test case 1
; 9 + 16 = 25
(define valA
  (sumOfTwoLargeSquare 3 4 2))
valA
; test case 2
; 32
(define valB
  (sumOfTwoLargeSquare 3 4 4))
valB

