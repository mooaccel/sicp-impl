(load "./ch3/p374_circuit/all_circuit_simula.scm")

(define a_in (make-wire))
(define b_in (make-wire))
(define s_out (make-wire))
(define c_out (make-wire))

(half-adder a_in b_in
            s_out c_out)

(propagate)
(get-signal s_out)
(get-signal c_out)

; 如图Figure 3.25, 如果在初始化的时候不执行一系列after-delay + propagate, 会导致e这个wire的初始值不正确, 它应该是1, 如果a, b初始都是0
; 也就是说少了这个的话可能会导致电路中间某些线的bit值不对, 也即整体电路没有处于正确的初始状态