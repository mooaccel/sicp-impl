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

; exponentiation
(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))
; 写成这样就报错了!!!很粗心, 也是scheme的解释器不提示哪一行有问题, 很难debug
; 会把底下这一层的问题上报. 然后还不提示是哪一层的问题
;  (and (pair? exp) (eq? (car xxx) '**)))
(define (base exp)
  (cadr exp))
(define (exponent exp)
  (caddr exp))
; 如果n是负数怎么办?
(define (makeExponentiation baseNum n)
  (cond ((=number? n 0) 1)
        ((=number? n 1) baseNum)
        ;((and (=number? baseNum) (=number? n)) (expt baseNum n))
        (else (list '** baseNum n))))
        ;; exponentiation

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((exponentiation? exp) ; 这种式子会不会被判断成variable?不敢保证, 所以放在了这个位置看
          (let ((u (base exp))
                (n (exponent exp)))
           (makeProduct (makeProduct n 
                                     (makeExponentiation u (- n 1)))
                        (deriv u var))))
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

(deriv '(** x 0) 'x)
(deriv '(** x 1) 'x)
(deriv '(** x 2) 'x)
(deriv '(** x 3) 'x)