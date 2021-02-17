(load "./ch2/apply_generic_impl.scm")

(define (equ? x y) 
  (apply-generic 'equ? x y))

(define (install-scheme-number-equ?-package)
  ;; internal procedures
  (put 'equ? '(scheme-number scheme-number)
    (lambda (x y) (= x y)))
  'done)

(define (install-rational-equ?-package)
  ;; internal procedures
  (define (numer x)
      (car x))
  (define (denom x)
      (cdr x))
  (put 'equ? '(scheme-number scheme-number)
    (lambda (x y) (= x y)))
  ;; 新增
  (put 'equ? '(rational rational)
      (lambda (x y)
          (and (= (numer x) (numer y))
               (= (denom x) (denom y)))))
  'done)

(define (install-complex-equ?-package)
  (put 'equ? '(complex complex)
          (lambda (x y)
              (and (= (real-part x) (real-part y))
                   (= (imag-part x) (imag-part y)))))
  'done)