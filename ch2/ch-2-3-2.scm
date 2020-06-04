(define (variable? x)
  (symbol? x))
(define (sameVariable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num) (and (number? exp) (= exp num)))
(define (makeSum a1 a2) 
  (cond ((=number? a1 0) a2)  ; 如果两个都是0, 那么也在这个分支
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2) (+ a1 a2)))
        (else (list '+ a1 a2))))  ; =number?是函数?
(define (makeProduct m1 m2) 
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) ; 第二个
  (cadr s))
(define (augend s)
  (caddr s))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  (cadr p))
(define (multiplicand p)
  (caddr p))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)  ; a b x这种都是
         (if (sameVariable? exp var) 1 0))
        ((sum? exp)
         (makeSum (deriv (addend exp) var)
                  (deriv (augend exp) var)))
        ((product? exp)
         (makeSum (makeProduct (multiplier exp)
                               (deriv (multiplicand exp) var))
                  (makeProduct (deriv (multiplier exp) var)
                               (multiplicand exp))))
        (else 
          (error "unknown expression type -- DERIV" exp))))

; 都用括号括起来了, 所以没优先级问题了...因为被list这么()表示出来的
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)

; symbol?的用法的一些尝试
;(define symbol1 'x)
;(symbol? symbol1) ; #t
;(define symbol2 '1)  ; 这个不是symbol...why
;(symbol? symbol2) ; #f
;(define symbol3 1)
;(symbol? symbol3) ; #f
;(define symbol4 +)
;(symbol? symbol4) ; #f
;(define symbol5 '+)
;(symbol? symbol5) ; #t

; list里面的变量可以类型不同
;(define val_test (list 1 'x 'a))
;val_test

; 测试number?
; (number? 1) ; #t
; (number? '1) ; #t 肯定了 '加在数字前面是没用的