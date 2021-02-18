; integer->rational
; rational->real
; real->complex

; (define (integer->rational n) 
;   (make-complex-from-real-imag (contents n)))
(define (install-raise-package)
  (put 'raise 'integer
    (lambda (x) (make-rational x 1)))
  (put 'raise 'rational
    (lambda (x) (make-real (/ (numer x)
                              (denom x)))))
  (put 'raise 'real
    (lambda (x) (make-from-real-imag x 0)))
  'done)

(define (raise x) (apply-generic 'raise x))