(define (make-term order coeff) (list order coeff))
(define (order term) (car term)) 
(define (coeff term) (cadr term))


(load "./ch2/p256_generic_procedure/ordinary_numbers.scm")
(install-scheme-number-package)
; 通用sub函数
(load "./ch2/p256_generic_procedure/apply_generic_use.scm")

; L1 / L2
; 比如:
; 2 x^3  => term, coeff: 2 order: 3
; div-poly相比div-terms去掉了变量x
; 这个算法的实现真不错!!!
(define (div-terms L1 L2)
  (if (empty-termlist? L1) 
      (list (the-empty-termlist) (the-empty-termlist)) 
      (let ((t1 (first-term L1)) 
            (t2 (first-term L2)))
        (if (> (order t2) 
               (order t1)) 
            (list (the-empty-termlist) L1) 
            (let ((new_coeff (div (coeff t1) (coeff t2))) 
                  (new_order (- (order t1) (order t2)))) 

                (let ((rest_of_result (div-terms (sub-terms L1
                                                            (mul-term-by-all-terms (make-term new_order new_coeff) L2))
                                                 L2))) 
                  ; 返回一个组合结果, 把第一个结果进行组合(adjoin-term), 相当于对term进行相加 
                  (cons (adjoin-term (make-term new_order new_coeff)
                                     (car rest_of_result))
                        ; remainder 传递上去就行了
                        (cdr rest_of_result))))))))

; todo, 测试待加
; 可以用2_91的那个例子作为小的示例, 用来理清代码逻辑

;  ; todo, prepare to impl
; term1 - term2
(define (sub-terms terms_1 terms_2)
  (cond ((empty-termlist? terms_1)
          (map (lambda (term)
                (make-term (order term) (negate (coeff t))))
               terms_2))
        ((empty-termlist? terms_2)
          terms_1)
        (else (let ((t1 (car terms_1))
                    (t2 (car terms_2)))
                (if (= (order t1) (order t2))
                    (adjoin-term (make-term (order t1) 
                                            (- (coeff t1)  ; todo, 改成通用sub, 然后dispatch的方式, 那样才能处理递归coeff是其他多项式的情况
                                               (coeff t2)))
                                 (sub-terms (cdr terms_1) (cdr terms_2)))
                    (if (> (order t1) (order t2))
                        (adjoin-term t1 (sub-terms (cdr terms_1) terms_2))
                        (adjoin-term (make-term (order t2) (negate (coeff t)))
                                     (sub-terms terms_1 (cdr terms_2))))))
                    )))

(define (div-poly poly1 poly2)
  (let ((var_poly1 (variable poly1))
        (var_poly2 (variable poly2)))
      (if (not (eq? var_poly1 var_poly2))
          (error "var_ploy1 and var_poly2 variable not equal! " (list var_poly1 var_poly2))
          (let ((poly1_term (term-list poly1))
                (poly2_term (term-list poly2)))
              (let div_result (div-terms poly1_term poly2_term)                 
                (let ((term_list_quotient (car div_result))
                      (term_list_remainder (cdr div_result)))
                  (cons (make-poly var_ploy1 term_list_quotient)
                        (make-poly var_ploy1 term_list_remainder))
                )
          ))
        )))