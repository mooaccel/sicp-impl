; 下面这样好像不行...
; x ∨ y = ¬(¬x ∧ ¬y)
; (define (or-gate a1 a2 output)
;   (define (or-action-procedure) 
;     (let ((new-value (logical-not (logical-and (logical-not (get-signal a1))
;                                                (logical-not (get-signal a2))))
;                      ))
;       (after-delay or-gate-delay
;                    (lambda () (set-signal! output new-value))))) 
; 
;   (add-action! a1 or-action-procedure) 
;   (add-action! a2 or-action-procedure) 
;   'ok)

(define (or-gate input-1 input-2 output)
    (let ((invert-1 (make-wire))
          (invert-2 (make-wire))
          (and-invert-1-invert-2 (make-wire)))
        (inverter input-1 invert-1)
        (inverter input-2 invert-2)
        (and-gate invert-1 invert-2 and-invert-1-invert-2)
        (inverter and-invert-1-invert-2 output))
    'ok)

; 应该是2*inverter-delay + 1*and-gate-delay
; 两个inverter的操作虽然是串行的实现, 但是真正计算not的时间很短, 关键是inverter-delay的时间
;        (inverter input-1 invert-1)
;        (inverter input-2 invert-2)
; 这两个操作的触发时机和最终的设置set-signal!的时间没差多少, 可以忽略
; 然后进入AND Gate, 假设两个输入都变化了, 那么触发两个and-action-procedure, 类似于前面inverter门的分析

; [===inverter-delay===][===and-gate-delay===][===inverter-delay===]
;  [===inverter-delay===][===and-gate-delay===][===inverter-delay===]
; [===and-gate-delay===]因为内部就是分别触发的, 所以输出output也可能改变两次
; 有点流水线化操作的感觉了