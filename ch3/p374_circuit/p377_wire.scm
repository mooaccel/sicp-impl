(define (make-wire)
  (let ((signal-value 0) 
        (action-procedures '()))     ; 这里其实是last in, first out性质, 但是无所谓, 例如Figure 3.25 half adder
                                     ; a的改变被or-gate, and-gate都盯着
                                     ; 所以a上面有两个回调action
                                     ; 在实际电子电路里, 这里是同时到达的, 但是这个所谓的同时, 可能在时间测度很小的时候, 也可能存在先后关系
                                     ; 所以a的改变先通知Figure 3.25的or-gate还是and-gate没啥影响, 我们也不应该依赖于这种特定顺序
                                     ; 所以在实现ch3.3.4电路模拟器的时候, 这里就无所谓了, 随便先传播给谁

    (define (set-my-signal! new-value) 
      (if (not (= signal-value new-value)) 
          (begin (set! signal-value new-value) 
                 (call-each action-procedures)) 
          'done)) 

    (define (accept-action-procedure! proc) 
      (set! action-procedures (cons proc action-procedures)) 
      ; 初始时会运行一次, 保证整体电路初始化正确, 见ch3/3_31.scm
      (proc)) 

    (define (dispatch m) 
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signal!) set-my-signal!)
            ((eq? m 'add-action!) accept-action-procedure!)
            (else (error "Unknown operation: WIRE" m))))

    dispatch))

(define (call-each procedures)
    (if (null? procedures)
        'done
        (begin
            ((car procedures))
            (call-each (cdr procedures)))))

(define (get-signal wire)
    (wire 'get-signal))

(define (set-signal! wire new-value)
    ((wire 'set-signal!) new-value))

(define (add-action! wire action-procedure)
    ((wire 'add-action!) action-procedure))