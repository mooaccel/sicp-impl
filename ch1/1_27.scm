(load "./ch1/1_24/expmod.scm")
; in order to use prime?
(load "./ch1/1_23/prime.scm")

(define (congruent? num n)
  (= (expmod num n n) num))

; 检查[1, n - 1]的每个数
(define (carmichael-test n)
  (define (carmichael-test-impl test-num)
    (cond ((= test-num n) #t)
          ((congruent? test-num n) 
           ; 继续检测
           (carmichael-test-impl (+ test-num 1)))
          (else #f)))
  (carmichael-test-impl 1))

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)
(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)