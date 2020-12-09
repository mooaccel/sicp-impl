; 不区分neg-point pos-point在区间的先后
(define (search f neg-point pos-point) 
  (let ((midpoint (average neg-point 
                           pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint 
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value) (search f neg-point midpoint))
                ((negative? test-value) (search f midpoint pos-point))
                (else midpoint))))))
(define (average a b) (/ (+ a
                            b)
                         2.0))
(define (close-enough? x y) 
  (< (abs (- x y)) 
     0.001))
(define (half-interval-method f a b)
  (let ((a-value (f a)) (b-value (f b))) 
       (cond ((and (negative? a-value) (positive? b-value)) 
              (search f a b))
             ((and (negative? b-value) (positive? a-value)) 
              (search f b a))
             (else (error "Values are not of opposite sign" a b)))))
(half-interval-method sin 2.0 4.0)
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0)
(define a 7)
(half-interval-method (lambda (x) 
                              (- (square x) 
                                 a)) 
                      2.0 
                      4.0)
; 相比较后面的p92的用不动点的方法去寻找根, 这种half-interval-method方法不会出现震荡...根据零点定理, 必然能找到解