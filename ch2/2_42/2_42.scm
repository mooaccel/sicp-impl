(load "./ch2/2_42/util_base.scm")
; k代表已经放置了几个皇后了
; position里只有k个元素
; 只需看第k个元素是否与前面的冲突即可
(define (equal-row? kth_col_pos pre_postion)
  (let ((filter_pre_postion (filter (lambda (pre_pos) (= pre_pos kth_col_pos)) 
                            pre_postion)))

     (not (= (length filter_pre_postion) 0))

  ))

; 只要第一次碰到了diagona? 那么就返回#t, 不再进行递归, 除非是进行到了最底层
; 只要在中间碰到了#t就会返回, 不会再进行接下来的检查
(define (diagona? kth_col_pos pre_postion)
  (define (is-diagona pre_postion ith)
    (if (null? pre_postion)
        #f
        (let ((modify_kth_col_pos_1 (- kth_col_pos ith))
              (modify_kth_col_pos_2 (+ kth_col_pos ith))
              (pre_pos (car pre_postion)))   

            (if (or (= modify_kth_col_pos_1 pre_pos) 
                    (= modify_kth_col_pos_2 pre_pos))
                #t
                (is-diagona (cdr pre_postion) (+ ith 1))
            )
        )))
  (is-diagona pre_postion 1))

(define (safe? k position)
  (let ((kth_col_pos (car position))
        (pre_postion (cdr position)))

        (and (not (equal-row? kth_col_pos pre_postion))
             (not (diagona? kth_col_pos pre_postion)))
        
        ))

(define empty-board '())

; 注意逆序!!!主要是为了方便后续处理...
; 把new-row这个编号加入到rest-of-queens里
; 往后面加吧, 所以不用cons, 给一个new-row, 返回一个list
(define (adjoin-position new-row k rest-of-queens)
  ;(append (rest-of-queens) (list new-row)))
  (cons new-row rest-of-queens))

(define (queens board-size) 
  ; queen-cols返回k时的所有方案表
  ; k代表当前在放置第几列的皇后
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions)) 
                (flatmap (lambda (rest-of-queens) 
                                 (map (lambda (new-row) (adjoin-position new-row k rest-of-queens)) 
                                      (enumerate-interval 1 board-size))) 
                         (queen-cols (- k 1)))))) 
  (queen-cols board-size))

; flatmap不会改变顺序
; (define (flatmap proc seq) 
;   (accumulate append '() (map proc seq)))

; 4依赖于3, 3依赖于2, 2依赖于1, 1依赖于0
; k = 0, (list '())
; (()) => (((1) (2) (3) (4))) =>flatten ((1) (2) (3) (4)))
; k = 1, 1 2 3 4,  ((1) (2) (3) (4))
;                  (1) -> ((1 1) (1 2) (1 3) (1 4))
;                  (list ((1 1) (1 2) (1 3) (1 4)))

; 每次迭代放置一个, 在新的一列
; 用坐标表示, (0, 2, *) 代表第一列放置在0, 第二列方式在2?
; k 4 3 2 1
; 书本上那个图的方案代表的编码方案
; ((3 7 2 8 5 1 4 6), ****)