(define (double f)
  (lambda (x) 
          (f (f x))))
(define (inc x)
  (+ x 1))
(inc 55)
((double inc) 55)

; 5
(((double double) inc) 1)
; xx = lambda (x) (double (double (x)))
; double 接受一个过程, 返回一个过程
; inc 接受一个数, 返回一个数

; (double double) 返回一个过程, lambda (x) (double (double x))
; 再用这个过程去调用inc, 也即x = inc
; (double (double inc))
; (double (lambda (x) (inc (inc x)))) ; 令g = (lambda (x) (inc (inc x)))
; (lambda (x) (g(g(x))))
; 再应用x = 1
; (g(g(1))) = (g(3)) =  5

(((double (double double)) inc) 5)
(((double (lambda (x) (double (double x)))) inc) 5) ; 令g = (lambda (x) (double (double x)))
(((double g) inc) 5)
((h inc) 5)  ; 令h = (lambda (x) (g (g x)))
(?1 5)
  ?1 = (h inc) ; h, 输入inc, 输出就是?1 
  ?1 = (g (g inc)) 
     = (g (double (double inc))) 
     = (g (double j))         ; 令j = (lambda (x) (inc (inc x)))  ; j + 2
     = (g k)                  ; 令k = (double j) = (lambda (x) (j (j x))) ; k + 4 
     = (double (double k))
     = (double m)             ; 令m = (lambda x) (k (k x))  + 8 
     = n                      ; 令n = (lambda x) (m (m x))  + 16
(n 5)
(m (m 5))
(m ?2)
   ?2 = (m 5) = (k (k 5)) = (k (j (j 5))) = (k (j (inc (inc 5)))) = (k (j 7))
              = (k (inc (inc 7))) = (k 9)
              = (j (j 9)) = (j (inc (inc 9))) = (j 11) = (inc (inc 11)) = 13
(m 13)
= ... = 21

; (((double (double double)) inc) 5)