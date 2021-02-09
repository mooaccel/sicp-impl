(load "./ch2/2_36.scm")

(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w) 
  (accumulate + 0 (map * v w)))

; ok
(define (matrix-*-vector m v) 
  (map (lambda (elem) 
               (accumulate + 0 (map * elem v))) 
       m))

; ok
(define (transpose mat) 
  (accumulate-n cons '() mat)) 

(define (matrix-*-matrix m n) 
  (let ((cols (transpose n))) 
    (map (lambda (row_m) 
                 (map (lambda (col) 
                              (dot-product row_m col)) cols)) m)))

; 参考了https://sicp.readthedocs.io/en/latest/chp2/37.html
(define (matrix-*-matrix2 m n) 
  (let ((cols (transpose n))) 
    (map (lambda (row_m) 
                 (matrix-*-vector cols row_m)) 
         m)))

; (map (lambda (x) (+ x 1)) (list 700 800 900))
; (map + (list 1 2 3) (list 40 50 60) (list 700 800 900))
