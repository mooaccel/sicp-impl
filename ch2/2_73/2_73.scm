(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) 
  (and (variable? v1) 
       (variable? v2) 
       (eq? v1 v2)))

; 把tag拿出来
(define (operator exp) (car exp)) 
(define (operands exp) (cdr exp)) ; if是list, 那么取出了所有剩下的

; 输入的exp有tag
(define (deriv exp var) 
  (cond ((number? exp) 0) 
        ((variable? exp) 
          (if (same-variable? exp var) 
              1 
              0)) 
        ; 通过get进行dispatch
        (else ((get 'deriv (operator exp)) 
               ;(operands exp)去掉了tag
               (operands exp) var)
        ))) 