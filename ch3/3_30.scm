; 输入a, b输出s c 
(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire))) 
    (or-gate a b d) 
    (and-gate a b c) 
    (inverter c e) 
    (and-gate d e s) 
    'ok))
(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire)) 
        (c1 (make-wire)) 
        (c2 (make-wire))) 
    (half-adder b c-in s c1) 
    (half-adder a s sum c2) 
    (or-gate c1 c2 c-out) 
    'ok))

; n位bit的加法器
; 需要n个FA
; n 个a b s c_n_in c_n_out
; 假设最低位在最前面
; C初始怎么设置为0?
(define (ripple-carry-adder Ak Bk Sk C) 
   (define (iter A B S c_in c_out) 
     (if (null? A) 
         ; 为什么不是返回Sk, 整个S
         S 
         (begin (full-adder (car A) (car B) c_in 
                            (car S) c_out) 
                ; 前一级的输出是后一级的输入
                (iter (cdr A) (cdr B) (cdr S) 
                      (c_out) (make-wire))))) 
   (iter Ak Bk Sk C (make-wire)))

; 等后续的做完再测试3_30

; 总时延受进位信号串行化影响, n * delay of FA
; 每个FA的时延= 2*HA + 1*OR