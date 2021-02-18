; p238 tag相关函数
(load "./ch2/p238_tag.scm")

; 修改版本的apply-generic, 多了类型转换, 即coercion
(define (apply-generic op . args)
  (define (raise-into src dst) 
        (let ((src_type (type-tag src)) 
              (dst_type (type-tag dst))) 
          (cond ((equal? src_type dst_type) 
                  src) 
                ; 从src_type可以提升不?
                ((get 'raise src_type)  
                  ; 提升一级src, 然后尝试进一步提升
                  (raise-into ((get 'raise src_type) (contents src)) dst)
                (else #f))))

  (let ((type-tags (map type-tag args))) 
    (let ((proc (get op type-tags))) 
      (if proc 
          (apply proc (map contents args)) 
          (if (= (length args) 2) 
              (if (= (length args) 2) 
               (let ((a1 (car args)) 
                     (a2 (cadr args))) 
                 (cond  
                   ; 尝试提升a1至a2
                   ((raise-into a1 a2) 
                      (apply-generic op (raise-into a1 a2) a2)) 
                   ; 如果提升不成功, 再尝试把a2提升至a1
                   ((raise-into a2 a1) 
                      (apply-generic op a1 (raise-into a2 a1))) 
                   (else (error "No method for these types" 
                         (list op type-tags))))))
              (error "No method for these types" (list op type-tags)))))))
