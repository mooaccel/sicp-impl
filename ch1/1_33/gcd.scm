(define (gcd a b)
  (if (= b 0)
      a 
      (gcd b 
           (remainder a b))))

(define (coprime? i n)
    (and (< i n)
         (= 1 (gcd i n))))

; 1
; (gcd 1 10)

; gcd 的前后顺序?
; (gcd 10 2)
; (gcd 2 0)

; 直接多了一次调换? 是了
; (gcd 2 10)
; (gcd 10 2)
; (remainder 10 2) ; 0
; (remainder 2 10) ; 2
; (remainder 10 3) ; 10 = 3 *k + 1
; (remainder 3 10) ; 3 = 10 * 0 + 3