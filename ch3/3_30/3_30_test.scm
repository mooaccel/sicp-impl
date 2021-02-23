(load "./ch3/p374_circuit/all_circuit_simula.scm")

(load "./ch3/3_30/3_30.scm")

(define c_0_in (make-wire))

(define a_0_in (make-wire))
(define b_0_in (make-wire))
(define s_0_out (make-wire))

; (ripple-carry-adder (list a_0_in) (list b_0_in) (list s_0_out) c_0_in) 
; 
; (propagate)
; (get-signal s_0_out)
; 
; (set-signal! a_0_in 0)
; (set-signal! b_0_in 1)
; (propagate)
; (get-signal s_0_out)

; 4 bits  1 0 1 0 + 1 1 1 1 =  1 0 0 1
; A = (list 0 1 0 1)
; B = (list 1 1 1 1)
; S = (list 0 0 0 0)
(define a_1_in (make-wire))
(define b_1_in (make-wire))
(define s_1_out (make-wire))
(define a_2_in (make-wire))
(define b_2_in (make-wire))
(define s_2_out (make-wire))
(define a_3_in (make-wire))
(define b_3_in (make-wire))
(define s_3_out (make-wire))
; 低位在car位置
(ripple-carry-adder (list a_0_in a_1_in a_2_in a_3_in) 
                    (list b_0_in b_1_in b_2_in b_3_in) 
                    (list s_0_out s_1_out s_2_out s_3_out) 
                    c_0_in) 
(propagate)
(define (get-all-a)
  (newline)
  (display "A = ")
  (display (get-signal a_3_in))
  (display (get-signal a_2_in))
  (display (get-signal a_1_in))
  (display (get-signal a_0_in)))
(define (get-all-b)
  (newline)
  (display "B = ")
  (display (get-signal b_3_in))
  (display (get-signal b_2_in))
  (display (get-signal b_1_in))
  (display (get-signal b_0_in)))
(define (get-all-s)
  (newline)
  (display "S = ")
  (display (get-signal s_3_out))
  (display (get-signal s_2_out))
  (display (get-signal s_1_out))
  (display (get-signal s_0_out)))
(get-all-a)
(get-all-b)
(get-all-s)

; test1
; A = 1010
(set-signal! a_1_in 1)
(set-signal! a_3_in 1)
; B = 1111
(set-signal! b_0_in 1)
(set-signal! b_1_in 1)
(set-signal! b_2_in 1)
(set-signal! b_3_in 1)
; C should be 1001
(propagate)
(get-all-a)
(get-all-b)
(get-all-s)


; delay只是粗略估算能估算准, 要按实际的看
; 不同的改变情况会导致不同的delay...