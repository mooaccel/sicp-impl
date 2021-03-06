(load "./ch3/3_50/3_50.scm")

(load "./ch3/3_50/stream_enumerate_interval.scm")

(load "./ch3/3_50/display_stream.scm")

(define one-to-ten (stream-enumerate-interval 1 10))

(define sum_st (stream-map + one-to-ten one-to-ten))

sum_st
(stream-cdr sum_st)
(display-stream sum_st)