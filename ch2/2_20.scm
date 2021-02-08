; 多了一对()就有问题了...
;(define (f x y . z)
;  ((newline)
;  (display x)
;  (display y)
;  (display z)
;  (let ((list1 z))
;    (list? list1))))

; 这个版本没有问题
;(define (f x y . z)
;  (newline)
;  (display x)
;  (display y)
;  (display z)
;  (let ((list1 z))
;    (list? list1)))
;(f 1 2 3 4 5 6)

(define (g . w) 
  (list? w))
(g 1 2 3 4 5 6)

; lambda的另外一种
;(define g2 (lambda (arg1 . w)
;  (display arg1)
;  (newline)
;  (display w)
;  (list? w)))
;(g2 1 2 3 4 5 6)

; 正确代码
;(define g2 (lambda (arg1 . w)
;  (display arg1)
;  (display w)
;  (map (lambda (x) (* arg1 x))
;       w)))

;(g2 12 10 20 30 40 50 60)
;; (define g2 (lambda (arg1 . w)
;; ; 这样就不行... why?就多了一对括号
;; ; The object #!unspecific is not applicable.
;;   ((display arg1)
;;   (display w)
;;   (map (lambda (x) (* arg1 x))
;;        w))))
;; (g2 12 10 20 30 40 50 60)

; 相似奇偶性
; 看了答案, 写的真秀...用filter真妙啊
; https://sicp.readthedocs.io/en/latest/chp2/20.html
(define (sameParity pivot . args)
  (filter (if (even? pivot)
              even?
              odd?)
          (cons pivot args)))

(sameParity 1 2 3 4 5 6 7)
(sameParity 2 3 4 5 6 7)
;(define (g . w) w)
;(g)
; 为啥这样不行?
(define g (lambda (. w) w))
(g)