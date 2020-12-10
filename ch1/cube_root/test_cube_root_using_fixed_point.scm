(load "./ch1/cube_root/display_info.scm")

; 直接copy from 1_36.scm
; 跟踪近似值序列的fixed-point函数
(define tolerance 0.00001)
(define (fixed-point f first-guess-x)
  (define (close-enough? x y) 
    (< (abs (- x y)) 
       tolerance))
  (define (try guess-x step)
    (display-info guess-x step)  ; let之前不用加begin. why?
    (let ((next-guess-x (f guess-x)))
        (if (close-enough? guess-x next-guess-x)
            (begin 
              (display-info next-guess-x (+ step 1))
              next-guess-x)
            (try next-guess-x (+ step 1)))))
   (try first-guess-x 1))
(define (average a b) (/ (+ a
                            b)
                         2.0))

; 使用p98里的
(define (cube-root-v1 a)
  (fixed-point (lambda (x) (average x (/ a (square x))))
               1.0))
; 使用p33, exercise 1.8里的迭代方程
(define (cube-root-v2 a)
  (fixed-point (lambda (x) (/ (+ (/ a (square x))
                                 (* x 2))
                              3.0))
               1.0))

; (cube-root-v1 5000)
; (cube-root-v2 5000)
; 明显 使用p33, exercise 1.8里的迭代方程!!! 效率更高, why???