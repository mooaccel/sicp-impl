; 先代换最后再近似, 思路很秀
; p(x) = 3x - 4x^3
(define (cube x) (* x x x)) 
(define (p x) 
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1)) 
      angle 
      (p (sine (/ angle 3.0)))))
(trace-entry p)
; (sine 3.1415)
; (sine (/ 3.1415 2))
(sine 12.15)
; 可以看到, p 共运行了 5 次。

; 时间复杂度 O(loga), a 每次都被除以 3.0 
; 空间会形成 sin a => p(sine a/3) => p(p(sine a/9)) , 所以空间复杂度也是O(loga)?
; 确实不太好理解...
; 看看下面这个验证例子
; https://sicp.readthedocs.io/en/latest/chp1/15.html
(sine 10)
(sine 30)
(sine 90)