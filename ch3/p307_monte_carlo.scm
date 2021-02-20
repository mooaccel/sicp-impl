; (define (random-in-range low high) 
;   (let ((range (- high low))) 
;     (+ low (random range))))

(define (estimate-pi trials) 
  (sqrt (/ 6 (monte-carlo trials cesaro-test)))) 

; predicate
(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

; 得到一个比率
; 输入trials 实验总次数
; experiment 实验lambda 
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed) 
    (cond ((= trials-remaining 0) 
            (/ trials-passed trials))
          ((experiment) 
            (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) 
                      trials-passed)))) 

  (iter trials 0))