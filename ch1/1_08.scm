; 从1_07稍微改下就行了, 比较简单
; 但是不知道题目给的这个公式的原理...toResearch
(define (cuberoot-iter guess x)
  (let ((new-guess (improve guess x)))
    (if (good-enough? new-guess guess)
        new-guess
        (cuberoot-iter (improve guess x) x))))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(define (good-enough? new-guess old-guess)
  (< (/ (abs (- new-guess old-guess))
             old-guess)
     0.0001        ))

(define (cuberoot x) 
  (cuberoot-iter 1.0 x))
(cuberoot 100)
;(trace sqrt)
(cuberoot 0.00009)
(cuberoot 900000000000000000000000000000000000000000000000000000000000000000000000000000000000)

(define (cube x)
  (* x x x))
(cuberoot (* 3.1 3.1 3.1))
(cuberoot (* 5 5 5))
(cuberoot (* 7 7 7))