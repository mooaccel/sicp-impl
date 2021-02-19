(define (install-polynomial-package)
  ;; internal procedures 
  ;; representation of poly
  (define (make-poly variable term-list) 
    (cons variable term-list)) 
  (define (variable p) (car p)) 
  (define (term-list p) (cdr p)) 
  ; ⟨procedures same-variable? and variable? from section 2.3.2⟩
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
  ;    (define (add-poly p1 p2) . . .) 
  ;      ;⟨procedures used by add-poly⟩ 
  ;    (define (mul-poly p1 p2) . . .) 
  ;      ;⟨procedures used by mul-poly⟩
  ;; interface to rest of the system
  (define (tag p) 
    (attach-tag 'polynomial p)) 
  (put 'add '(polynomial polynomial)
    (lambda (p1 p2) (tag (add-poly p1 p2)))) 
  (put 'mul '(polynomial polynomial)
    (lambda (p1 p2) (tag (mul-poly p1 p2)))) 
  ; 为了统一处理tag
  (put 'variable 'polynomial
    variable)
  (put 'term-list 'polynomial
    term-list)
  (put 'make 'polynomial
    (lambda (var terms) (tag (make-poly var terms)))) 

  'done)

(define (make-poly var terms)
  ((get 'make 'polynomial) var terms))
(define (variable poly)
  ((get 'variable 'polynomial) (contents poly)))
(define (term-list poly)
  ((get 'term-list 'polynomial) (contents poly)))

;(define (contents datum) 

