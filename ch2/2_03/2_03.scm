(load "./ch2/2_02.scm")

(define (length-of-rectangle rectangle)
  )
(define (width-of-rectangle rectangle)
  )
(define (perimeter-rectangle r)
  (let ((length (length-of-rectangle rectangle))
        (width (width-of-rectangle rectangle)))
    (* 2 
       (+ length width))))

(define (area-rectangle r)
  (let ((length (length-of-rectangle rectangle))
        (width (width-of-rectangle rectangle)))
       (* length width)))

; 2_03 先不做了, 思路都比较清晰, 剩下都是体力活