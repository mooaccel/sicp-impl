; 5  4  3  2  1
; 50 25 10 5  1
(define (count-charge target n)
  (cond ((= target 0) 1)
        ((or (< target 0) (= n 0)) 0)
        (else (+ (count-charge target (- n 1))
                 (count-charge (- target (acquire-first-in-orderedset n)) n)))))
; 4
(f 11 5)

+ (f 11 4) (f -39 5)
+ (+ (f 11 3) (f -14 4)) 0
+ (f 11 2) (f 1 3)  0 
(f 11 1)f (6 2) + (f 1 2)(f -9 3)
(f 11 0)(f 10 1) (f 6 1)(f 1 2)       (f 1 1)
0 (f 10 0)(f 9 1) (f 6 0)(f 5 1) (f 1 1)      (f 1 0)(f 0 1)
             1              1       1                  1
; 还是看https://sicp.readthedocs.io/en/latest/chp1/14.html吧