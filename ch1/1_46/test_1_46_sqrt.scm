(load "./ch1/1_46/1_46.scm")

(define (sqrt a)
  (define (good-enough? new-guess old-guess)
    (< (/ (abs (- new-guess old-guess))
               old-guess)
       0.0001))
  (define (average x y)
    (/ (+ x y) 2))
  (let ((first-guess 1.0))
    ((iterative-improve good-enough? 
                        (lambda (guess) (average guess (/ a guess)))) first-guess)))

(sqrt 3)
(sqrt 4)
(sqrt 5)
(sqrt 7)
