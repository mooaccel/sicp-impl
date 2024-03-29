;(define (make-rat n d) (cons n d)) 

(define (gcd a b)
  (if (= b 0)
      a 
      (gcd b 
           (remainder a b))))
(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((numer-g (/ n g))
          (denom-g (/ d g)))
      (if (< denom-g 0)
          (cons (- numer-g) (- denom-g))
          (cons numer-g denom-g)))))

(define (numer x) (car x)) 
(define (denom x) (cdr x))

(define (add-rat x y) (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x))) (* (denom x) (denom y)))) 
(define (sub-rat x y) (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x))) (* (denom x) (denom y)))) 
(define (mul-rat x y) (make-rat (* (numer x) (numer y)) (* (denom x) (denom y)))) 
(define (div-rat x y) (make-rat (* (numer x) (denom y)) (* (denom x) (numer y))))
(define (print-rat x) (newline) (display (numer x)) (display "/") (display (denom x)))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))


;(print-rat one-half)
;(print-rat (add-rat one-half one-third))
;(print-rat (add-rat one-third one-third))