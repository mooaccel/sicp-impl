(define (RC R C dt)
  (lambda (i_stream v0_initial_value)
    (add-streams (integral (scale-stream i_stream (/ 1 C)) 
                           v0_initial_value
                           dt) 
                 (scale-stream i_stream R))))