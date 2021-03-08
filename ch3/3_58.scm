; The result is the floating-point representation of (/ num den) with radix as the base. ?? 原理? todo待研究
; http://community.schemewiki.org/?sicp-ex-3.58 
(define (expand num den radix)
  (cons-stream (quotient (* num radix) den) 
               (expand (remainder (* num radix) den) den radix)))
(define s1 (expand 1 7 10))
(quotient (* 1 10) 7)
; stream-head是内置的
(stream-head s1 100)

(define s2 (expand 3 8 10))
(stream-head s2 100)