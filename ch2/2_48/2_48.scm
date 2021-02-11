(load "./ch2/2_46.scm")

(define (make-segment v_start v_end)
  (cons v_start v_end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))
