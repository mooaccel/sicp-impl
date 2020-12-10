; recursive process
; (define (cont-frac n d k)
;   (define (cont-frac-impl i)
;     (if (> i k)
;         0
;         (/ (n i)
;            (+ (d i) 
;               (cont-frac-impl (+ i 1))))))
;   (cont-frac-impl 1))

; iterative process
(define (cont-frac n d k)
  (define (cont-frac-impl i res)
    (if (= i 0)
        res
        (cont-frac-impl (- i 1) 
                        (/ (n i)
                           (+ (d i) 
                              res)))))

  (cont-frac-impl k 0))

(define (k-term-finite-cont-frac k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(k-term-finite-cont-frac 10)
(k-term-finite-cont-frac 11)
(k-term-finite-cont-frac 12)
; 1 ]=> (k-term-finite-cont-frac 10)
; ;Value: .6179775280898876
; 1 ]=> (k-term-finite-cont-frac 11)
; ;Value: .6180555555555556
; 1 ]=> (k-term-finite-cont-frac 12)
; Value: .6180257510729613
; 去k = 12, 能算出精确到4位的近似值(考虑四舍五入)