; 多了个step, 是侵入性的代码, 不太好...
; 代码参考的https://sicp.readthedocs.io/en/latest/index.html
; 先勉强凑合着用吧, 不然step看不清楚, 还得自己数
(define (display-info guess step)
  (newline)
  (display "Step: ")
  (display step)
  (display " ")
  (display "Guess: ")
  (display guess))