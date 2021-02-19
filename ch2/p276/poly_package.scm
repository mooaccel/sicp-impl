(define (install-polynomial-package)
  ;; internal procedures 
  ;; representation of poly
  (define (make-poly variable term-list) 
    (cons variable term-list)) 
  (define (variable p) (car p)) 
  (define (term-list p) (cdr p)) 
  ; ⟨procedures same-variable? and variable? from section 2.3.2⟩
  (define (add-poly p1 p2) . . .) 
    ;⟨procedures used by add-poly⟩ 
  (define (mul-poly p1 p2) . . .) 
    ;⟨procedures used by mul-poly⟩
  ;; interface to rest of the system
  (define (tag p) 
    (attach-tag 'polynomial p)) 
  (put 'add '(polynomial polynomial)
    (lambda (p1 p2) (tag (add-poly p1 p2)))) 
  (put 'mul '(polynomial polynomial)
    (lambda (p1 p2) (tag (mul-poly p1 p2)))) 
  (put 'make 'polynomial
    (lambda (var terms) (tag (make-poly var terms)))) 

  'done)