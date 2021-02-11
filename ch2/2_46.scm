(define (make-vect x y)
  (cons x y))

; 返回x坐标
(define (xcor-vect v)
  (car v))

; 返回y坐标
(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
                (xcor-vect v2))
             (+ (ycor-vect v1)
                (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1)
                (xcor-vect v2))
             (- (ycor-vect v1)
                (ycor-vect v2))))

(define (scale-vect v factor)
  (make-vect (* factor (xcor-vect v))
             (* factor (ycor-vect v))))