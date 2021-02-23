(define (make-wire)
  (let ((signal-value 0) 
        (action-procedures '())) 

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