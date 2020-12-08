; 不用关注a和b的大小吗?
(define (gcd a b)
  (if (= b 0)
      a 
      (gcd b 
           (remainder a b))))
; 2
(trace-entry gcd)
; applicative-order
; (gcd 206 40)
; (gcd 40 6)
; (gcd 6 4)
; (gcd 4 2)
; (gcd 2 0)
; 如果是应用序, 4次

(gcd 206 40)
(gcd 40 (remainder 206 40))  ; (gcd 40 6)
; if (= (remainder 206 40) 0) false, 这一次判断需要执行1次
(gcd (remainder 206 40)       
     (remainder 40 (remainder 206 40))) ; (gcd 6 4)
; if (= (remainder 40 (remainder 206 40)) 0), false, 2次
(gcd (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ; (gcd 4 2)
; if ( = (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)  false, 4次 
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder 
            (remainder 40 (remainder 206 40))  ; 4 
            (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; (gcd 2 0)
; if (= (remainder 
;            (remainder 40 (remainder 206 40))  ; 4 
;            (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;            0)
; if ...  true ! 7次
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; 4次
返回2
; (1 + 2 + 4 + 7) + 4 = 14 + 4 = 18次