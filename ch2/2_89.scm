;  5 4 3 2  1  0
; (1 2 0 3 -2 -5)
; 3 len 

(define (first-term term-list) 
  (make-term (- (len term-list) 1) 
             (car term-list))) 
(define (rest-terms term-list) 
  (cdr term-list))
; make-term不变
(define (make-term order coeff) (list order coeff))
; 同样假设了term的order比term-list里的所有order都大
(define (adjoin-term term term-list) 
   (cond ((=zero? (coeff term)) term-list) 
         ; (length term-list)是order + 1
         ((=equ? (order term) 
                 (length term-list)) (cons (coeff term) term-list)) 
         (else (adjoin-term term (cons 0 term-list))))) 