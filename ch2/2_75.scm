; 类似于练习Exercise 2.4里面的用procedure表示数据
(define (make-from-real-imag x y)
  (define (dispatch op) 
    (cond ((eq? op 'real-part) 
            x) 
          ((eq? op 'imag-part) 
            y) 
          ((eq? op 'magnitude) 
            (sqrt (+ (square x) (square y)))) 
          ((eq? op 'angle) 
            (atan y x)) 
          (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op)))) 
  dispatch)
(define complex1 (make-from-real-imag 10 20))
complex1
(complex1 'real-part)
(complex1 'imag-part)

(define (make-from-mag-ang r a)
  (define (dispatch op) 
    (cond ((eq? op 'real-part) 
            (* r (cos a))) 
          ((eq? op 'imag-part) 
            (* r (sin a))) 
          ((eq? op 'magnitude) 
            r)
          ((eq? op 'angle) 
            a) 
          (else (error "Unknown op: MAKE-FROM-MAG-ANG" op))))
  dispatch)
(define complex2 (make-from-mag-ang 10 20))
complex2
(complex2 'real-part)
(complex2 'imag-part)

; messagepassing-style不需要通过table进行dispatch
; 而是依赖于对象本身, 不同类型的对象对通样的操作(比如real-part)会表现出不同的行为