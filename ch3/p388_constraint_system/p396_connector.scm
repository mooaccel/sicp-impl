(define (make-connector)
        ; 保存持有的值
  (let ((value #f) 
        ; 持有值则保存这个值从哪传来的, 保存这个通知者, 即某个constraint
        (informant #f) 
        ; 一个connector可用与多个constraint产生联系
        (constraints '())) 

    (define (set-my-value newval setter)
      (cond ((not (has-value? me)) 
              (set! value newval) 
              (set! informant setter) 
              (for-each-except setter inform-about-value constraints)) 
            ((not (= value newval)) 
              (error "Contradiction" (list value newval))) 
            ; 如果有值存在, 而且value = newval, 那么忽略此次传播即可
            (else 'ignored)))
    ; retractor等于informant才能进行forget
    (define (forget-my-value retractor) 
      (if (eq? retractor informant) 
          (begin (set! informant #f) 
                 (for-each-except retractor inform-about-no-value constraints)) 
          'ignored))
    (define (connect new-constraint) 
      (if (not (memq new-constraint constraints)) 
          (set! constraints (cons new-constraint constraints))) 
      (if (has-value? me) 
          (inform-about-value new-constraint)) 
      'done)
    (define (me request) 
      (cond ((eq? request 'has-value?) 
              (if informant 
                  #t 
                  #f))
            ((eq? request 'value) value) 
            ((eq? request 'set-value!) set-my-value) 
            ((eq? request 'forget) forget-my-value) 
            ((eq? request 'connect) connect) 
            (else (error "Unknown operation: CONNECTOR" request))))

    me))

(define (for-each-except exception procedure list)
    (define (loop items)
        (cond ((null? items)
                  'done)
              ((eq? (car items) exception)
                  (loop (cdr items)))
              (else
                  (procedure (car items))
                  (loop (cdr items)))))

    (loop list))

; interface
(define (has-value? connector)
    (connector 'has-value?))
(define (get-value connector)
    (connector 'value))
(define (set-value! connector new-value informant)
    ((connector 'set-value!) new-value informant))
(define (forget-value! connector retractor)
    ((connector 'forget) retractor))
(define (connect connector new-constraint)
    ((connector 'connect) new-constraint))