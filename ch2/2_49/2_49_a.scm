(load "./ch2/2_48/2_48.scm")
(load "./ch2/2_49/base.scm")

; segments->painter 给一个线段列表, 画出这些线, 但是用了延迟计算, 通过lambda实现(在这个上下文下叫做闭包)
; 等到真正想计算的时候, 再给这个闭包传入frame即可
; painter可以使用不同的frame, 进行灵活替换, 这里相当于OOP里的策略模式吧? 

(define (segments->painter segment-list) 
  (lambda (frame) 
    (for-each (lambda (segment) (draw-line ((frame-coord-map frame) 
                                            (start-segment segment)) 
                                           ((frame-coord-map frame) 
                                            (end-segment segment)))) 
    segment-list)))

(define (top_left_point) (make-vect 0.0 1.0))
(define (top_right_point) (make-vect 1.0 1.0))
(define (bottom_left_point) (make-vect 0.0 0.0))
(define (bottom_right_point) (make-vect 1.0 0.0))
(define outline_top (make-segment top_left_point top_right_point))
(define outline_right (make-segment top_right_point bottom_right_point))
(define outline_bottom (make-segment bottom_left_point bottom_right_point))
(define outline_left (make-segment top_left_point bottom_left_point))

(define (outline-painter outline-li) 
  (segments->painter outline-li))
(outline-painter (list outline_top outline_right outline_bottom outline_left))
