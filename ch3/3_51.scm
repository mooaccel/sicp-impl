; 3_51这个例子展示了 记忆化, 
; https://sicp.readthedocs.io/en/latest/chp3/51.html

(load "./ch3/3_50/stream_enumerate_interval.scm")

(define (display-line x)
    (newline)
    (display x))

(define (show x)
  (display-line x) (* x x))

(define x
  (stream-map show (stream-enumerate-interval 0 10))) ; 只有流的 stream-car 部分被求值(延迟求值的效果)
;x
;(stream-cdr x)
;(stream-cdr (stream-cdr x))
(stream-ref x 5) 
(stream-ref x 7)


;(display-line 10)
;(show 10)