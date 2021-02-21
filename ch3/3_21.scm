(load "./ch3/p357_queue.scm")

(define (print-queue que)
  (newline)
  (display (car que))
  'done)

(define q1 (make-queue))
q1
(print-queue q1)
(insert-queue! q1 'a)
(print-queue q1)
(insert-queue! q1 'b)
(print-queue q1)
(delete-queue! q1)
(print-queue q1)
(delete-queue! q1)
(print-queue q1)
