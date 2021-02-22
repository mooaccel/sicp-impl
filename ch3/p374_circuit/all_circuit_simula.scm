; queue
(load "./ch3/p357_queue.scm")
; inverter, and-gate
(load "./ch3/p374_circuit/p375_and_gate_inverter.scm")
; or-gate
(load "./ch3/3_28/3_28.scm")
; half-adder, full-adder
(load "./ch3/p374_circuit/p373_full_half_adder.scm")
; wire [ add-action!等 ]
(load "./ch3/p374_circuit/p377_wire.scm")
; after-delay
(load "./ch3/p374_circuit/p380_after_delay.scm")
; probe
(load "./ch3/p374_circuit/p381_probe.scm")
; propagate
(load "./ch3/p374_circuit/p381_propagate.scm")
; agenda
(load "ch3/p374_circuit/p383_agenda.scm")

; 用于测试的the-agenda实例
(define the-agenda (make-agenda))
(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)


; 在agenda的(first-agenda-item agenda)更新time
; 在after-delay获取time