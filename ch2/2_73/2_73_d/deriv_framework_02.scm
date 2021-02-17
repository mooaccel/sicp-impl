; deriv_02 把'deriv当type, 可以想象figure 2.22这张图的polar/rectangular是'deriv
(define (variable? x) 
  (symbol? x))
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
        ; type指的是这一层的deriv, 需要进行派发的这一层
        (else ((get (operator exp) 'deriv) 
               ;(operands exp)去掉了tag
               (operands exp) var)
              )))