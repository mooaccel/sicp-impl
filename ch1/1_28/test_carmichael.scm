(load "./ch1/1_28/miller_rabin.scm")

; 检查[1, n - 1]的每个数
(define (carmichael-test n)
  (define (carmichael-test-impl test-num)
    (cond ((= test-num n) #t)
          ; 使用费马小定理的变种 
          ((congruent? test-num n) 
           ; 继续检测
           (carmichael-test-impl (+ test-num 1)))
          (else #f)))
  (carmichael-test-impl 1))

(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)