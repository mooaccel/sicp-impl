; todo, 目前采用的是两次导入会重复吧? 在最后的整个系统里, 先不管这些细节
; 传入多个参数怎么处理的?

(define (type-tag datum) 
  (if (pair? datum) 
      (car datum) 
      (error "Bad tagged datum: TYPE-TAG" datum)))
(define (contents datum) 
  (if (pair? datum) 
      (cdr datum) 
      (error "Bad tagged datum: CONTENTS" datum)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args))) 
    (let ((proc (get op type-tags))) 
      ; if proc是什么语法?
      (if proc 
          (apply proc (map contents args)) 
          (error
          "No method for these types: APPLY-GENERIC" (list op type-tags))))))