(define (squarer a b)
  (define (process-new-value) 
    (if (has-value? b) 
        (if (< (get-value b) 0) 
            (error "square less than 0: SQUARER" (get-value b))
            (set-value! a (sqrt (get-value b)) me))
        ; b没有值
        (if (has-value? a)
            (set-value! b (square (get-value a)) me)
            'ignore))) 

  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))

  (define (me request)
    (cond ((eq? request 'I-have-a-value) 
            (process-new-value))
          ((eq? request 'I-lost-my-value) 
            (process-forget-value))
          (else (error "Unknown request: ADDER" request))))

  (connect a me)  
  (connect b me)
  me)