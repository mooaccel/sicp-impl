(define (frame-coord-map frame) 
  (lambda (v) (add-vect (origin-frame frame)
                        (add-vect (scale-vect (xcor-vect v) (edge1-frame frame)) 
                                  (scale-vect (ycor-vect v) (edge2-frame frame))))))
; 返回一个painter
; 注意看frame怎么和painter隔离的...
; painter就一个lambda, 可调用对象, 然后在这个上面再进行各种operation, 包括高级operation?
; 最后再调用这个lambda本身?
(define (segments->painter segment-list) 
  (lambda (frame) 
    (for-each (lambda (segment) (draw-line ((frame-coord-map frame) 
                                            (start-segment segment)) 
                                           ((frame-coord-map frame) 
                                            (end-segment segment)))) 
    segment-list)))