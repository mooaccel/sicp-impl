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
  (let ((type-tags (map type-tag args))) 
    (let ((proc (get op type-tags))) 
      ; if proc是什么语法?
      (if proc 
          (apply proc (map contents args)) 
          (error
          "No method for these types: APPLY-GENERIC" (list op type-tags))))))
(define (real-part z) 
  (apply-generic 'real-part z)) 
(define (imag-part z) 
  (apply-generic 'imag-part z)) 
(define (magnitude z) 
  (apply-generic 'magnitude z)) 
(define (angle z) 
  (apply-generic 'angle z))
; 会打上tag
(define (make-from-real-imag x y) 
  ((get 'make-from-real-imag 'rectangular) x y)
) 
(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))