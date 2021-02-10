;op (car sequence) (fold-right op in

(define (reverse sequence) 
  (fold-right (lambda (x y) (append y (list x)))  ; x是单个元素
              '() 
              sequence)) 

;(op result (car rest))
(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x))   ; y是单个元素
             '() 
             sequence))
(reverse (list 1 2 3 4))
(reverse2 (list 1 2 3 4))
; (append '() (list 1)) 无影响