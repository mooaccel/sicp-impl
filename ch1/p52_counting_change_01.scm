; denomination: 面值
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; 可以重复拿, 那就是完全背包问题了...
; 比如(count-change 4)等于1
(define (count-change amount)
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount
                       (- kinds-of-coins 1))
                   (cc (- amount 
                          (first-denomination kinds-of-coins))
                       kinds-of-coins)))))
  (cc amount 5))

(count-change 100)

;; Counting change
