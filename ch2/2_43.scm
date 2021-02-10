(flatmap
  (lambda (new-row) 
          (map (lambda (rest-of-queens) (adjoin-position new-row k rest-of-queens))
               (queen-cols (- k 1)))) 
  (enumerate-interval 1 board-size))
; (queen-cols (- k 1)) 函数会被计算 board-size次, 本来只需要计算1次, 而这个函数底下是递归的, 相当于增加了很多冗余计算
; 2_42的实现是(queen-cols (- k 1))只计算1次, (enumerate-interval 1 board-size)计算len((queen-cols (- k 1)))次, 这个影响不大, 因为
; (enumerate-interval 1 board-size)函数只是简单的返回(1 2 ... board-size), 底下没有大量的递归函数