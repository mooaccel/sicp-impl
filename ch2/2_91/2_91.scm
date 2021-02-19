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
; (define (order term) (car term)) 
; (define (coeff term) (cadr term))

; todo, 测试待加
; 可以用2_91的那个例子作为小的示例, 用来理清代码逻辑