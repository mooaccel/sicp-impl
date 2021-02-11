(define (right-split painter n)
  (if (= n 0)
      painter 
      (let ((smaller (right-split painter (- n 1)))) 
         (beside painter (below smaller smaller)))))


; 划分成4块, 但是只有一个朝向
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1)))) 
        
          (let ((top-left (beside up up)) 
                (bottom-right (below right right)) 
                (corner (corner-split painter (- n 1)))) 
              
            (beside (below painter top-left) 
                    (below bottom-right corner))))
  ))
; @beside: draws the first painter’s image in the left half of the frame 
;            and the second painter’s image in the right half of the frame.
; @below: draws the first painter’s image below the second painter’s image

; 四个operation, 组成一个新的higher operation
; 返回一个lambda
(define (square-of-four tl tr bl br)
  (lambda (painter) 
          (let ((top (beside (tl painter) (tr painter))) 
                (bottom (beside (bl painter) (br painter)))) 
            (below bottom top))))

; identity这个操作是原封不动返回吗?
(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity 
                                  flip-vert 
                                  identity 
                                  flip-vert))) 
      (combine4 painter)
    ))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity rotate180 flip-vert)))
    (combine4 (corner-split painter n))
    ))