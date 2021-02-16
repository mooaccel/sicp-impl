; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")
; =number?
(load "./ch2/2_58/=number.scm")
; tag
(load "./ch2/2_73/2_73_b/tag_basic.scm")

; 类似p244, 
; Operations: deriv一个
; Type: sum, product两种 
(define (install-sum-package)
  ;; internal procedures
  (define (make-sum x y) 
    (cond ((=number? x 0)
            y)
          ((=number? y 0)
            x)
          ((and (number? x) (number? y))
            (+ x y))
          (else
            (attach-tag 'sum x y))))
  (define (addend s) 
    (car s))
  (define (augend s) 
    (cadr s))
  ;(define (deriv-impl exp var) 
  ;  ; 调内部的make-sum和addend吧?
  ;  ; 然后调用deriv, 重新dispatch
  ;  (make-sum (deriv (addend exp) var) 
  ;            (deriv (augend exp) var)))
  ;; interface to the rest of the system
  ;(define (tag x) (attach-tag ' x)) 
  (put 'make-sum 'sum make-sum)
  (put 'addend 'sum addend)
  (put 'augend 'sum augend)
  ;(put 'deriv 'sum deriv-impl) 
  (put 'deriv 'sum (lambda (exp var) 
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var))))
  'done) ; 这个done啥意思

; 给其他模块用
(define (make-sum x y)
  ((get 'make-sum 'sum) x y)
)
; todo 为什么要加上(contents s)
(define (addend s)
  ((get 'addend 'sum) (contents s))
)
(define (augend s)
  ((get 'augend 'sum) (contents s))
)