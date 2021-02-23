(load "./ch3/p374_circuit/all_circuit_simula.scm")

; or-gate override
(load "./ch3/3_29/3_29.scm")

(define input-1 (make-wire))
(define input-2 (make-wire))
(define output (make-wire))

(or-gate input-1 input-2 output)

(propagate)
(get-signal output)
;(get-signal output) 
;(set-signal! input-1 1)
;(propagate)
;(get-signal output) 
;

; 通过跑实际代码, 验证了之前的延时的推测
; 应该是2*inverter-delay + 1*and-gate-delay

; propagate按模拟时间顺序从小到大执行
; * 初始化每个都要执行一下