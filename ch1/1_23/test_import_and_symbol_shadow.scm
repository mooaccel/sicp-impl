(load "./ch1/1_23/search_for_primes.scm")

; 最终显示
;1 ]=> (load "./ch1/1_23/search_for_primes.scm")
;Loading "./ch1/1_23/search_for_primes.scm"...
;  Loading "./ch1/1_23/prime.scm"...
;    Loading "./ch1/1_23/smallest_divisor.scm"...
;      Loading "./ch1/1_23/next_divisor.scm"... done
;    ... done
;  ... done
;... done
;Value: search-for-primes-for-question

; search-for-primes ->  prime.scm -> smallest_divisor.scm -> next_divisor.scm
; 
; -> denote import 

(define (next-divisor num)
  (newline)
  (display "old ver")
  (+ num 1))

(search-for-primes-for-question 10)