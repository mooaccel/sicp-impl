(define (estimate-pi-using-unit-circle trials) 
  (* (monte-carlo trials unit-circle-test)
     4.0))

; predicate
; 单位圆 x^2 + y^2 <= 1
(define (unit-circle-test)
  (let ((x (random-in-range -1.0 1.0))
        (y (random-in-range -1.0 1.0)))
    (< (+ (square x)
          (square y))
       1)
  ))

; random n [0, n-1]
; [0, range - 1]
; [low, low + range - 1]
; [low, low + high - low - 1]
; [low, high - 1]
(define (random-in-range low high) 
  (let ((range (- high low))) 
    (+ low (random range))))

; 得到一个比率
; 输入trials 实验总次数
; experiment 实验precedure
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed) 
    (cond ((= trials-remaining 0) 
            (/ trials-passed trials))
          ((experiment) 
            (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) 
                      trials-passed)))) 

  (iter trials 0))
(estimate-pi-using-unit-circle 100)
(estimate-pi-using-unit-circle 1000)
(estimate-pi-using-unit-circle 10000)
;(estimate-pi-using-unit-circle 100000)
