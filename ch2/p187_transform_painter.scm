; 在基础的painter之外包装了一层
; 给的origin, corner1, corner2有什么关系?
(define (transform-painter painter origin corner1 corner2) 
  (lambda (frame) 
    (let ((m (frame-coord-map frame))) 
      (let ((new-origin (m origin))) 
        (painter (make-frame new-origin (sub-vect (m corner1) new-origin) 
                                        (sub-vect (m corner2) new-origin)))))))
; 通过frame, 把origin -> new-origin

; (sub-vect v1 v2), v1 - v2
; 关键是变换基底, 从frame => new-frame