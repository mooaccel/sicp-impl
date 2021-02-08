(define usCoins (list 50 25 10 5 1))
(define usCoinsRandom (list 25 10 50 1 5))  ; 顺序无影响
(define ukCoins (list 100 50 20 10 5 2 1 0.5))

;;; 可以重复拿, 那就是完全背包问题了...
;;; 相当于是决策树? 当有一条路通到叶子才行
;;(define (count-change amount)
;;  (define (cc amount kinds-of-coins)
;;    (cond ((= amount 0) 1)
;;          ((or (< amount 0) (= kinds-of-coins 0)) 0) ; 这条路走不通
;;          (else (+ (cc amount
;;                       (- kinds-of-coins 1)) ; 不取
;;                   (cc (- amount 
;;                          (first-denomination kinds-of-coins)) ; 取
;;                       kinds-of-coins)))))
;;  (cc amount 5))

; 这两个函数其实可以加上检测null? coinValues
; 但是不加也行, 因为目前它们是在noMore之后执行
;;; ==help function
; 从list里取第一个数值, 已经假设list已经排序(这里是大->小, 也可以小->大吧?)
(define (firstDenomination coinValues)
  (if (null? coinValues)
      (error "coinValues is null -- firstDenomination")
      (car coinValues)))
(define (exceptFirstDenomination coinValues)
  (if (null? coinValues)
      (error "coinValues is null -- exceptFirstDenomination")
      (cdr coinValues)))
; test null
; (firstDenomination '())
; (exceptFirstDenomination '())


; 判断list里面是否还有值
(define (noMore? coinValues)
  (null? coinValues))

(define (count-change amount)
  (define (cc amount coinValues)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (noMore? coinValues)) 0) ; 这条路走不通
          (else (+ (cc amount
                       (exceptFirstDenomination coinValues)) ; 不取, 从可取集里删除一个
                   (cc (- amount 
                          (firstDenomination coinValues)) ; 取
                       coinValues)))))
  (cc amount usCoinsRandom))

(count-change 100)
; 注意如果换成 ukCoins, 计算要很久...因为习题exer2-19并没有从本质上改进算法...