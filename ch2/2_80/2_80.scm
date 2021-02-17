(load "./ch2/apply_generic_impl.scm")

(define (=zero? x) 
  (apply-generic '=zero? x))

(define (install-scheme-number-=zero?-package)
  ;; internal procedures
  ; '(scheme-number)里面啥都行吧?
  (put '=zero? '(scheme-number)
    (lambda (value) (= value 0)))

  'done)

(define (install-rational-=zero?-package)
  ;; internal procedures
  (define (numer x)
      (car x))
  (define (denom x)
      (cdr x))
  ; (put '=zero? '(rational)代表 接受一个参数, 而且tag是rational的?
  ; todo, 还是不懂括号啥意思
  (put '=zero? '(rational)
        (lambda (r)
            (= 0 (numer r))))
  'done)

(define (install-complex-=zero?-package)
  (put '=zero? '(complex)
          (lambda (c)
              (and (= 0 (real-part c))
                   (= 0 (imag-part c)))))
  'done)