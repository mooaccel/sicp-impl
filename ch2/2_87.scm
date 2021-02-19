(load "./ch2/apply_generic_impl.scm")

(define (=zero? x) 
  (apply-generic '=zero? x))

(define (install-polynomial-=zero?-package)
  ; 定义的term-list本身cannot have a term-list with zero terms
  (put '=zero? '(polynomial)
          (lambda (poly)
            (let ((term_li (term-list poly)))
              (empty-termlist? term_li) 
            )
          ))

  'done)