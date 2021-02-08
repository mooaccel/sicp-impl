(define zero (lambda (f) (lambda (x) x))) 
(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

; zero
(lambda (f) 
  (lambda (x) 
    x))

;(add-1 zero) = (lambda (f) (lambda (x) (f ((zero f) x))))
;(zero f) = ((lambda (f) (lambda (x) x)) f) = (lambda (x) x)
;((zero f) x) = ((lambda (x) x) x) = x
;so 
;(add-1 zero) = (lambda (f) (lambda (x) (f ((zero f) x)))) = 

;one = 
(lambda (f) 
  (lambda (x) 
    (f x)))
;two = 
(add1 one) = (lambda (f) (lambda (x) (f ((one f) x))))
           = (lambda (f) (lambda (x) (f (f x))))
(lambda (f) 
  (lambda (x) 
    (f (f x))))
; three = 
(add1 two) = (lambda (f) (lambda (x) (f ((two f) x))))
           = (lambda (f) (lambda (x) (f (f (f x)))))
(lambda (f) 
  (lambda (x) 
    (f (f (f x)))))

(+ 2 1)
((lambda (m)                        ; 展开 +
     (lambda (n)
        (lambda (f)
            (lambda (x)
                (m f (n f x))))))
 2
 1)
((lambda (n)
    (lambda (f)
        (lambda (x)
            (2 f (n f x)))))
1)
(lambda (f)
    (lambda (x)
        (2 f (1 f x))))  ; 带入2和1

(lambda (f)
    (lambda (x)
        (2 f (1 f x))))
(1 f x)
((lambda (f) 
  (lambda (x) 
    (f x)))
f
x)
((lambda (x) 
  (f x))
x)
(f x)

(lambda (f)
    (lambda (x)
        (2 f (f x))))
(2 f (f x))
((lambda (f) 
  (lambda (x) 
    (f (f x))))
f
(f x))
((lambda (x) 
  (f (f x)))
(f x))
(f (f (f x))) ; 为什么这里能代换? 不是normal顺序求值吗?

(lambda (f)
    (lambda (x)
       (f (f (f x)))))  ; ok
; 调用 (+ 2 1) 的计算结果和前面列出的定义 three 完全相同，证明我们定义的 + 函数是正确的。