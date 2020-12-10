(load "./ch1/cube_root/display_info.scm")

; from exercise 1.7/1.8

(define (cuberoot-iter guess a step)
  (display-info guess step)  ; 每次一进来都先print
  (let ((new-guess (improve guess a)))
    (if (good-enough? new-guess guess)
        (begin   ; 最后一次的数也要打印, 不然会漏
          (display-info new-guess (+ step 1))
          new-guess)
        (cuberoot-iter (improve guess a) a (+ step 1)))))

(define (improve guess a)
  (/ (+ (/ a
           (square guess))
        (* 2 guess))
     3))

(define (good-enough? new-guess old-guess)
  (< (/ (abs (- new-guess old-guess))
             old-guess)
     0.0001        ))
; 本质上来说求不动点的过程和这个过程是一样的!!!...

(define (cuberoot a) 
  (cuberoot-iter 1.0 a 1))