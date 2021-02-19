; sparse as in the text 
(define (install-sparse-term-list) 
    ;inner 
    (define (adjoin-term term term-list) 
        (if (=zero? (coeff term)) 
            term-list
            (cons (term term-list))))  
 
    (define (first-term term-list) (car term-list)) 
    (define (rest-terms term-list) (cdr term-list)) 
    ;interface 
    (define (tag term-list) (attach-tag 'sparse term-list)) 
    (put 'adjoin-term 'sparse adjoin-term)  
    (put 'first-term '(sparse)  
        (lambda (term-list) (first-term term-list))) 
    (put 'rest-term '(sparse)  
        (lambda (term-list) (tag (rest-terms term-list)))) 
    'done) 
 
; dense from ex_2.89 
(define (install-dense-term-list) 
    ;inner 
    (define (adjoin-term term term-list)  
      (cond ((=zero? (coeff term)) term-list)  
            ((=equ? (order term) (length term-list)) 
              (cons (coeff term) term-list))  
            (else (adjoin-term term (cons 0 term-list)))))  
    (define (first-term term-list) 
      (make-term (- (length term-list) 1) 
                 (car term-list))) 
    (define (rest-terms term-list) 
      (cdr term-list)) 
    ;interface 
    (define (tag term-list) (attach-tag 'dense term-list)) 
    (put 'adjoin-term 'dense adjoin-term)  
    ; term-list用type-tag提取出来等于'dense就会调用first-term
    (put 'first-term '(dense)  
        (lambda (term-list) (first-term term-list))) 
    (put 'rest-term '(dense)  
        (lambda (term-list) (tag (rest-terms term-list)))) 
    'done) 

(define (adjoin-term term term-list)  
    ((get 'adjoin-term (type-tag term-list)) term term-list)) 
(define (first-term term-list) (apply-generic 'first-term term-list)) 
(define (rest-term term-list) (apply-generic 'rest-term term-list)) 

; 对于op只有一个参数的情况, (op 'dense) 或者 (op ('dense))这样查找
; 一个参数的情况在这里是 (op '(dense))查找
; (define (apply-generic op . args)
;   (let ((type-tags (map type-tag args))) 
;     (let ((proc (get op type-tags))) 
;       (if proc 
;           (apply proc (map contents args)) 
;           (error
;           "No method for these types: APPLY-GENERIC" (list op type-tags))))))