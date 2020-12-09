; 检测a
(define (nontrivial-square-root? a m)
    (and (not (= a 1))
         (not (= a (- m 1)))
         (= 1 (remainder (square a) m))))
; 为什么Miller-Rabin测试不会被561这种Carmichael Number数欺骗?
; 在congruent?里面的expmod多了一步检测
;          ((nontrivial-square-root? base m)
;            0)
; 存在数学证明, 如果这个nontrivial-square-root存在, 那么肯定不是prime, 证明待看
; 然后导致这一次的单次检测通不过 
; 如果用下面这个原理, 检测一半的数, 
; It is also possible to prove that if n is an odd number that is not prime, 
; then, for at least half the numbers a < n, computing a n−1 in this way will 
; reveal a nontrivial square root of 1 modulo n.
; 这句话的意思是存在在[1, n - 1]里面存在至少一半的数会让nontrivial-square-root?返回true
; 那就尽可能的去检测到这些数
; 但是因为不知道, 知道随机, 而随机会重复检测同一个数, 所以还是有可能出现检测的(ceiling (/ n 2))这么多数, 
; 却没有一个数在nontrivial-square-root集合里...那就刚好错过了.然后导致返回#t, 但是其实应该返回#f的.
; 如果这么实现的话, Miller-Rabin测试也是一个probabilistic algorithms.(并不能保证prime 100%正确)
; 除非是把 [1, n-1]范围内的每个数都检测到, 按个搜寻一遍, 这样就不是probabilistic algorithms了
(define (expmod base exp m)
    (cond ((= exp 0)
            1)
          ; 如果不满足条件, 返回一个特殊的值, 随便什么都可以, 比如0/-1/-10
          ((nontrivial-square-root? base m)
          -10)
          ;  0)
          ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
          (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))

; random(n) 生成的在[0, n - 1]之间
; random(n - 1) [0, n - 2]
; random(n - 1) + 1 [1, n - 1] ok
(define (random-non-zero-less-than-n n)
  (+ 1 (random (- n 1))))

; 1_27的变种
; num^(n-1) and 1 mod n
(define (congruent? num n)
  (= (expmod num (- n 1) n) 1))

(define (miller-rabin-test-pass? n)
    (define (try-it a)
        (congruent? a n))
    (try-it (random-non-zero-less-than-n n)))

(define (miller-rabin-test-multi-times n times)
    (cond ((= times 0)
            #t)
          ((miller-rabin-test-pass? n)
            (miller-rabin-test-multi-times n (- times 1)))
          (else
            #f)))

; (miller-rabin-test-multi-times? 19 25)
(define (MillerRabin-test n)
    (let ((times (ceiling (/ n 2))))
        (miller-rabin-test-multi-times n times)))

(MillerRabin-test 561)
(MillerRabin-test 1105)
(MillerRabin-test 1729)
(MillerRabin-test 2465)
(MillerRabin-test 2821)
(MillerRabin-test 6601)