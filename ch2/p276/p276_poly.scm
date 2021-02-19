(define (add-poly p1 p2) 
  (if (same-variable? (variable p1) (variable p2)) 
      (make-poly (variable p1) 
                 (add-terms (term-list p1) (term-list p2))) 
      (error "Polys not in same var: ADD-POLY" (list p1 p2)))) 
(define (mul-poly p1 p2) 
  (if (same-variable? (variable p1) (variable p2)) 
      (make-poly (variable p1) 
                 (mul-terms (term-list p1) (term-list p2))) 
      (error "Polys not in same var: MUL-POLY" (list p1 p2))))

(define (mul-terms L1 L2) 
  (if (empty-termlist? L1) 
      (the-empty-termlist) 
      (add-terms (mul-term-by-all-terms (first-term L1) L2) 
                 (mul-terms (rest-terms L1) L2)))) 

; 用一个term t1去乘一个term list
; 返回一个新的term list
(define (mul-term-by-all-terms t1 L) 
  (if (empty-termlist? L) 
      (the-empty-termlist) 
      (let ((t2 (first-term L))) 
        (adjoin-term (make-term (+ (order t1) (order t2)) 
                                (mul (coeff t1) (coeff t2))) 
                     (mul-term-by-all-terms t1 (rest-terms L))))))

(define (adjoin-term term term-list) 
  (if (=zero? (coeff term)) 
      term-list 
      (cons term term-list))) 

(define (the-empty-termlist) '()) 
(define (first-term term-list) (car term-list)) 
(define (rest-terms term-list) (cdr term-list)) 
(define (empty-termlist? term-list) (null? term-list)) 
(define (make-term order coeff) (list order coeff))