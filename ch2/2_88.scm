(put 'sub '(polynomial polynomial) 
       (lambda (x y) (tag (sub-poly x y)))) 
; p1 - p2
(define (sub-poly p1 p2) 
  (let ((negate_poly (negate p2)))
    (add-poly p1 negation_poly)))

(define (negation x) 
  (apply-generic '=zero? x))

(define (install-polynomial-negation-package)
  (define (negate-terms termlist) 
     (if (empty-termlist? termlist) 
         the-empty-termlist 
         (map (lambda (term) 
                ; negate是通用操作
                (make-term (order term) (negate (coeff t))) 
              )
              termlist)))
  (put 'negate '(polynomial)
          (lambda (poly) (make-polynomial (variable poly) 
                                          (negate-terms (term-list poly)))))

  'done)