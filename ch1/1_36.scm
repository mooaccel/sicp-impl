; 
; (define (search-for-primes num count)
;   (define (next-odd n)
;     (if (even? n) 
;         (+ 1 n)
;         (+ 2 n)))
;   (cond ((= count 0)
;          (newline)
;          (display "are primes. end"))
;         ((prime? num)
;          (newline)
;          (display num)
;          (search-for-primes (next-odd num) (- count 1)))
;         (else (search-for-primes (next-odd num) count))))

(define (average a b) (/ (+ a
                            b)
                         2.0))
(define tolerance 0.00001)
(define (fixed-point f first-guess-x)
  (define (close-enough? x y) 
    (< (abs (- x y)) 
       tolerance))
  (define (try guess-x)
    (let ((next-guess-x (f guess-x)))
      (begin
        (newline)
        (display next-guess-x)
        (if (close-enough? guess-x next-guess-x)
            (begin 
             (newline)
             (display "close-enough, end compute.")
             next-guess-x)
            (try next-guess-x)))))
;   (try first-guess-x))
  (begin
   (newline)
   (display first-guess-x)
   (try first-guess-x)))

(define (compute-root)
  (fixed-point (lambda (x) (/ (log 1000)
                              (log x)))
               1.2))
; 4.555531964899801
(compute-root)

; scheme自带的是以自然对数为底的, 计算机著作里面比如具体数学, (log2) = 1
; (log2.71828) = 1
; x^x= 1000
; xlogx = log1000
; x = (log1000) / (logx)