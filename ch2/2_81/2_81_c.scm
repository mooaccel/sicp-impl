; p238 tag相关函数
(load "./ch2/p238_tag.scm")

; 修改版本的apply-generic, 多了类型转换, 即coercion
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args))) 
    (let ((proc (get op type-tags))) 
      (if proc 
          (apply proc (map contents args)) 
          (if (= (length args) 2) 
              (let ((type1 (car type-tags)) 
                    (type2 (cadr type-tags)) 
                    (a1 (car args)) 
                    (a2 (cadr args))) 
                ; 如果类型相同, 那么返回错误, 不进行类型之间的coercion
                (if (eq? type1 type2)
                    (error "类型相同, 不进行coercion, No method for these types" (list op type-tags))
                ; 不同才执行
                    (let ((t1->t2 (get-coercion type1 type2)) 
                          (t2->t1 (get-coercion type2 type1))) 
                      (cond (t1->t2 
                              (apply-generic op (t1->t2 a1) a2)) 
                            (t2->t1 
                              (apply-generic op a1 (t2->t1 a2))) 
                            (else (error "No method for these types" (list op type-tags)))))) 
              (error "No method for these types" (list op type-tags))))))))
