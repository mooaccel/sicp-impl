; 关于变参的测试
(define (argument-test op . args)
  (display op)
  (display args)
  'done)
(argument-test 'for 1 2 3 4)
(argument-test 'for)
(argument-test 'for 1)
(argument-test 'for 1 2)