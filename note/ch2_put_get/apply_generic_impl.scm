; 在书本p238有实现
(define (type-tag datum) 
  (if (pair? datum) 
      (car datum) 
      (error "Bad tagged datum: TYPE-TAG" datum)))
(define (contents datum) 
  (if (pair? datum) 
      (cdr datum) 
      (error "Bad tagged datum: CONTENTS" datum)))
; 传入多个参数怎么处理的?
(define (apply-generic op . args)
  ; args传进来是一个元素的时候, 也是list, 相当于会加一层括号
  (newline)
  (display op)
  (newline)
  (display args)
  (let ((type-tags (map type-tag args))) 
  (newline)
  (display type-tags)
    (let ((proc (get op type-tags))) 
      ; if proc是什么语法?
      (if proc 
          (apply proc (map contents args)) 
          (error
          "No method for these types: APPLY-GENERIC" (list op type-tags))))))