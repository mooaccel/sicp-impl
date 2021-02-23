(load "./ch3/p374_circuit/all_circuit_simula.scm")

(define a_in (make-wire))
(define b_in (make-wire))
(define c_in (make-wire))
(define s_out (make-wire))
(define c_out (make-wire))

(full-adder a_in b_in c_in
            s_out c_out)

(propagate)
(get-signal s_out)
(get-signal c_out)

(set-signal! a_in 1)
(set-signal! b_in 1)
(set-signal! c_in 1)
(propagate)
(get-signal s_out)
(get-signal c_out)