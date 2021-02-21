(load "./ch3/3_25/3_25.scm")

; 其中一些代码的解释:
;  (define (get-value item)  
;      (if (pair? (car item)) 
;          (if (null? (cdar item)) 
;              #f ; 比如下面那段代码
;              (cdar item)) 
;          #f)) 
;  ; 这个逻辑就是上面代码的反映
;  (insert! t 90 'math 'mj 'aa)
;  (lookup t 'math 'mj 'aa)
;  (lookup t 'math 'mj)

(define t (make-table))
;((t 'insert-proc!) 25 (list 'peter))
;((t 'lookup-proc) (list 'peter))

(insert! t 'a 1 1)  
(lookup t 1 1)  
(insert! t 'b 2)  
(insert! t 'c 3)  
(insert! t 'c 2 3 4)  
(insert! t 'd 2 3 5)  
(insert! t 'e 2 3 6)  
(lookup t 3 4)  
(lookup t 2 3)  
(lookup t 2 3 4)  
(lookup t 1)  
(insert! t 'x 1 1)  
(insert! t 'y 2 3 4)  
(lookup t 1 1)  
(lookup t 2 3 4)  
(lookup t 2 3 4)  
