; (if (> b 0) + -) is operator
; a + | b |
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) 
   a 
   b))
; 4
(define valA (a-plus-abs-b 1 -3))
valA
; 8
(define valB (a-plus-abs-b 1 7))
valB