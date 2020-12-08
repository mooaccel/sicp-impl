(define (next-divisor num)
   (if (odd? num)
       (+ num 2)
       (+ num 1)))