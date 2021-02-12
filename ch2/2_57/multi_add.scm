(load "./ch2/2_57/single-operand.scm")

; (define (make-sum a1 . a2)
;   a1)
; (define (make-sum-2 a1 . a2)
;   a2)
; (make-sum 1 2)
; (make-sum-2 1 2)

(define (make-sum a1 . a2)
    (if (single-operand? a2)
        (let ((a2 (car a2)))
            (cond ((=number? a1 0)
                    a2)
                  ((=number? a2 0)
                    a1)
                  ((and (number? a1) (number? a2))
                    (+ a1 a2))
                  (else
                    (list '+ a1 a2))))
        (cons '+ (cons a1 a2))))

(define (sum? x)
    (and (pair? x)
         (eq? (car x) '+)))

(define (addend s)
    (cadr s))

(define (augend s)
    (let ((tail-operand (cddr s)))
        (if (single-operand? tail-operand)
            (car tail-operand)
            (apply make-sum tail-operand))))

; (define val1 (make-sum 1 2 3))
; val1
; ; (augend val1)
; (cddr val1)
; 
; (list 2 3)
; (make-sum (list 1 2 3))  ; 应该把list解开, 所以需要使用apply

; (define (test a . b)
;   (list 1 2 3 4))
; (apply test (list 1 23))

; (make-sum 1 2)
; (apply make-sum '(1 2))
; (make-sum 1 2 3)
; (apply make-sum '(1 2 3))

; apply函数将一个过程应用于一个表，也就是将表展开作为过程的参数。