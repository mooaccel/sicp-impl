(define (constant value connector)
  (define (me request) 
    ; 什么情况可能执行这里?
    (error "Unknown request: CONSTANT" request)) 

  (connect connector me) 
  (set-value! connector value me) 

  me)