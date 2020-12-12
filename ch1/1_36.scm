; 
; (define (search-for-primes num count)
;   (define (next-odd n)
;     (if (even? n) 
;         (+ 1 n)
;         (+ 2 n)))
;   (cond ((= count 0)
;          (newline)
;          (display "are primes. end"))
;         ((prime? num)
;          (newline)
;          (display num)
;          (search-for-primes (next-odd num) (- count 1)))
;         (else (search-for-primes (next-odd num) count))))

; 参考https://sicp.readthedocs.io/en/latest/chp1/36.html
(define (average a b) (/ (+ a
                            b)
                         2.0))
(define tolerance 0.00001)
(define (fixed-point f first-guess-x)
  (define (display-info guess step)
    (newline)
    (display "Step: ")
    (display step)
    (display " ")
    (display "Guess: ")
    (display guess))
  (define (close-enough? x y) 
    (< (abs (- x y)) 
       tolerance))
  (define (try guess-x step)
    (display-info guess-x step)  ; let之前不用加begin. why?
    (let ((next-guess-x (f guess-x)))
        (if (close-enough? guess-x next-guess-x)
            (begin 
              (display-info next-guess-x (+ step 1))
              next-guess-x)
            (try next-guess-x (+ step 1)))))
   (try first-guess-x 1))

(define (compute-root f)
  (fixed-point f 
               1.2))

; 输入一个f, 输出一个f
(define (average-damp f)
  (lambda (x) 
      (average x
               (f x))))

; 对比发现，不带平均阻尼的计算使用了 37 步，另一方面，使用平均阻尼的计算只使用了 13 步，说明平均阻尼有助于计算快速收敛。
; (compute-root (lambda (x) (/ (log 1000)
;                               (log x))))
; (compute-root (average-damp (lambda (x) (/ (log 1000)
;                              (log x)))))
; 
; scheme自带的是以自然对数为底的, 计算机著作里面比如具体数学, (log2) = 1
; (log2.71828) = 1
; x^x= 1000
; xlogx = log1000
; x = (log1000) / (logx)