(define (inc x)
  (+ x 1))
(define (dec x)
  (- x 1))
(define (plus1 a b) 
  (if (= a 0) 
    b 
    (inc (plus1 (dec a) b)))) 
(trace plus1)
(plus1 4 5)
; recursive processes 
;  (+ 4 5)
;  (inc (+ 3 5))
;  (inc (inc (+ 2 5)))
;  (inc (inc (inc (+ 1 5))))
;  (inc (inc (inc (inc (+ 0 5)))))
;  (inc (inc (inc (inc 5))))
;  (inc (inc (inc 6)))
;  (inc (inc 7))
;  (inc 8)
;  (9)
; ======
(define (plus2 a b)
  (if (= a 0) 
    b 
    (plus2 (dec a) (inc b))))
(trace plus2)
(plus2 4 5)
; iterative processes
; 表面看起来是recursive procedure
; Its state is captured completely by its three state variables, and an interpreter need keep track of only three variables in order to execute the process.

; It will execute an iterative process in constant space, even if the iterative process is described by a recursive procedure. An implementation with this property is called tail-recursive.
;  (+ 4 5)
;  (+ 3 6)
;  (+ 2 7)
;  (+ 1 8)
;  (+ 0 9)
;  (9)