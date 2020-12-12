(load "./ch1/1_43.scm")

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3.0)))
((smooth square) 5)

(define (smooth-n-times f n)
  (let ((smooth-n (repeated smooth n)))
    (smooth-n f)))

((smooth-n-times square 10) 5)