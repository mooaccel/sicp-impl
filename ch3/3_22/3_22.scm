(define (make-queue)
  (let ((front_ptr '()) 
        (rear_ptr '())) 
    (define (insert-queue! item)
      (let ((new_pair (cons item '())))
        (cond ((empty-queue?)
                (set! front_ptr new_pair) 
                (set! rear_ptr new_pair)
                front_ptr
                ) 
              (else 
                  (set-cdr! rear_ptr new_pair)
                  (set! rear_ptr new_pair)
                  front_ptr
                  )
        )))
    (define (delete-queue!)
      (cond ((empty-queue?)
              (error "DELETE! called with an empty queue"))
            (else 
                  (set! front_ptr (cdr front_ptr))
                  front_ptr)))
    (define (empty-queue?)
      (null? front_ptr))

    (define (dispatch mt)
      (cond ((eq? mt 'insert-queue!)
              insert-queue!)
            ((eq? mt 'delete-queue!)
              delete-queue!)
            ((eq? mt 'empty-queue?)
              empty-queue?)
            (else (error "Not exist this method" mt))))

    dispatch))

(null? '())
(null? (list 1))
(define que (make-queue))
que
((que 'empty-queue?))
((que 'insert-queue!) 1)
((que 'empty-queue?))
((que 'insert-queue!) 2)
((que 'delete-queue!))