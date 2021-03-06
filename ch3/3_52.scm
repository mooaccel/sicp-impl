; 3_52这个例子, 是一个反面典型例子, stream的程序里不要这么写, 这样会让我们关注顺序... 
; Part of the power of stream processing is that it lets us ignore the order in which events actually happen in our programs.
; presence of assignment, which forces us to be concerned with time and change.

; 如果改成无记忆化版本, 那么seq里的项会变的不一样, 这就很麻烦了, 因为会对同一个数重复运用accum

(load "./ch3/3_50/stream_enumerate_interval.scm")

(load "./ch3/3_50/display_stream.scm")

(define sum 0) 

(define (accum x) (set! sum (+ x sum)) 
                  sum) 
; [1, 20]
(define seq
  (stream-map accum (stream-enumerate-interval 1 20))) 
; [1, 2, 3, 4, 5, 6, 7,... 20]
; [1, 3, 6, 10, 15, 21, 28...]

; 把偶数过滤出来, [6, promis] 
(define y (stream-filter even? seq))
y
seq

(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0)) 
                 seq)) ; [10, promise]
z
seq

(stream-ref y 7) ; 偶数里面的第7项
seq
(display-stream z) 
seq



;   1
;   3
;   6
;   10
;   15

;   21
;   28
;   36
;   45
;   55

;   66
;   78
;   91
;   105
;   120

;   136
;   153
;   171
;   190
;   210