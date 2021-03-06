(load "./ch3/3_50/stream_enumerate_interval.scm")

; prime?
(load "./ch1/1_23/prime.scm")

(define prime-st (stream-filter prime? 
                 (stream-enumerate-interval 10000 1000000)))
prime-st
(cdr prime-st)
(stream-cdr prime-st)
(stream-car (stream-cdr (stream-cdr prime-st)))