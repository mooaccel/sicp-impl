(define (install-drop-package)
  (put 'project 'complex
    (lambda (x) (make-real (real-part x))))
  (put 'project 'real
    (lambda (x) 
      ; 1/100在这里啥意思?
      (let ((rat (rationalize  
                   (inexact->exact x) 1/100))) 
        (make-rational 
          (numerator rat)
          (denominator rat)))))
  (put 'project 'rational
    (lambda (x) (make-scheme-number 
                  (round (/ (numer x) (denom x))))))
  'done)

(define (drop x) 
 (let ((project-proc (get 'project (type-tag x)))) 
   (if project-proc 
      ; 存在转换函数
       (let ((project_number (project-proc (contents x)))) 
         ; 然后再把project_number raise, 再和x对比
         (if (equ? x (raise project_number)) 
             ; 这样不丢失信息, 继续尝试进一步drop
             (drop project_number) 
             x)) 
       x))) 

; drop版
; todo, 没有测试
(define (apply-generic op . args)
  (define (drop-into src dst) 
        (let ((src_type (type-tag src)) 
              (dst_type (type-tag dst))) 
          (cond ((equal? src_type dst_type) 
                  src) 
                ; 从src_type可以drop不?
                ((get 'project src_type)  
                  ; drop一级src, 然后尝试进一步drop
                  (drop-into ((get 'project src_type) (contents src)) dst)
                (else 
                  #f))))

  (let ((type-tags (map type-tag args))) 
    (let ((proc (get op type-tags))) 
      (if proc 
          (apply proc (map contents args)) 
          (if (= (length args) 2) 
              (let ((a1 (car args)) 
                    (a2 (cadr args))) 
                (cond  
                  ; 尝试drop a1至a2
                  ((drop-into a1 a2) 
                     (apply-generic op (drop-into a1 a2) a2)) 
                  ; 如果drop不成功, 再尝试把a2 drop至a1
                  ((drop-into a2 a1) 
                     (apply-generic op a1 (drop-into a2 a1))) 
                  (else (error "No method for these types" 
                        (list op type-tags)))))
              (error "No method for these types" (list op type-tags))))))