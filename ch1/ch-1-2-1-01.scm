; 从1->n
(define (fact-iter curRes count target)
  (if (> count target)
      curRes
      (fact-iter (* curRes count) 
                 (+ count 1)
                 target)))

;(define (factorial n)
;  (fact-iter 1 1 n))

; 从n->1
(define (fact-iter-v2 curRes count)
  (if (= count 0)
      curRes
      (fact-iter-v2 (* curRes count) 
                    (- count 1))))

(define (factorial n)
  (fact-iter-v2 1 n))

(factorial 6) ; 1 * 2 * 3 * 4 * 5 * 6 = 720