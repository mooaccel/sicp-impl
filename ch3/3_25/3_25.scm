; 题干里说的:
; a table in which values are stored under an arbitrary number of keys and diﬀerent values may be stored under diﬀerent numbers of keys.
; 在父层节点也可以保存val...

; 基本和http://community.schemewiki.org/?sicp-ex-3.25答案一致
; 与之前的一二维的表示最大的变化在于每个key-value多了一层cons
; 其他则是实现层面的问题
; 这种多层的keys=>value pair感觉挺新鲜
; 这道题确实不容易...
(define (make-table)
  ; 内部先创建空表, 相当于make-table
  (let ((local-table (list '*table*))) 
    ; 注意这里是三层... 相当于在图3.23里把'math这种单个的tag也改成了pair
    (define (get-key table) (caaar table)) 

    (define (get-value item)  
        (if (pair? (car item)) 
            (if (null? (cdar item)) 
                #f ; 比如 
                (cdar item)) 
            ; 这个肯定是个item呀? 通过之前的实现... 这个else应该不会走到这里
            #f)) 

    (define (change-value item value) (set-cdr! (car item) value)) 

    (define (add-subtable table key value) (set-cdr! table  
                                                     (cons (cons (cons key value) 
                                                                 '()) 
                                                           (cdr table)))) 
    ; 用单个key去这一层的table里查找
    ; 如果找到, 结果可以再次被传进insert!/lookup的iter的table参数
    (define (assoc key table) 
        (cond ((null? table) #f)  
              ((equal? key (get-key table)) (car table)) 
              (else (assoc key (cdr table))))) 

    ; 直接输入keys为空怎么办?
    (define (lookup keys) 
         (define (iter keys table) 
             (if (null? keys) 
                 ; 为什么要display table...
                 (begin (newline)
                        (display table) (get-value table)) 
                 ;(get-value table)
                 (let ((result (assoc (car keys) (cdr table)))) 
                      (if result 
                          (iter (cdr keys) result) 
                          #f)))) 
         (iter keys local-table)) 

    (define (insert! value keys) 
       ; iter函数的目的是为了处理递归的每一层
       ; @table: 每一层的搜索子表, 开始是local-table这个全局表
       (define (iter value keys table) 
           (let ((result (assoc (car keys) (cdr table)))) 
                ; 下一级还需要处理吗?
                (if (null? (cdr keys)) 
                    (if result 
                        (change-value result value) 
                        (add-subtable table (car keys) value)) 
                    (if result 
                        (iter value (cdr keys) result) 
                        (begin (add-subtable table (car keys) '()) 
                               (iter value (cdr keys) (cadr table))))))) 
       (iter value keys local-table)) 

    (define (dispatch m) 
      (cond ((eq? m 'lookup-proc) lookup) 
            ((eq? m 'insert-proc!) insert!)
            ((eq? m 'print-proc) (display local-table))
            (else (error "Unknown operation: TABLE" m)))) 

    dispatch))

(define (insert! x value . keys) ((x 'insert-proc!) value keys)) 
(define (lookup x . keys) ((x 'lookup-proc) keys)) 
; print一个最上层的table
(define (print t) (t 'print-proc)) 
; 这种删除方式也很有趣...
(define (delete! t . keys) ((x 'insert-proc!) '() keys)) 