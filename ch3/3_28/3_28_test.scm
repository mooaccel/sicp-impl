(load "./ch3/p374_circuit/all_circuit_simula.scm")

(define input-1 (make-wire))
(define input-2 (make-wire))
(define output (make-wire))

(or-gate input-1 input-2 output)

(get-signal output)
(propagate)
(get-signal output) 
(set-signal! input-1 1)
(propagate)
(get-signal output) 
