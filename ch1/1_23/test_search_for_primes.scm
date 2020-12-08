(load "./ch1/1_23/search_for_primes.scm")

(search-for-primes-for-question 1000)
; (search-for-primes-for-question 10000)
; (search-for-primes-for-question 100000)
; (search-for-primes-for-question 1000000)
; (search-for-primes-for-question 10000000)
; (search-for-primes-for-question 100000000)
; (search-for-primes-for-question 1000000000)

;  ; if use num = num + 1 version
;  ; 1 ]=> (search-for-primes-for-question 1000)
;  ;Value: 1
;  1 ]=> (search-for-primes-for-question 10000)
;  ;Value: 2
;  1 ]=> (search-for-primes-for-question 100000)
;  ;Value: 3
;  1 ]=> (search-for-primes-for-question 1000000)
;  ;Value: 6
;  1 ]=> (search-for-primes-for-question 10000000)
;  ;Value: 20
;  1 ]=> (search-for-primes-for-question 100000000)
;  ;Value: 44
;  1 ]=> (search-for-primes-for-question 1000000000)
;  ;Value: 130

; 优化, 省略掉偶数的版本
; 1 ]=> (search-for-primes-for-question 1000)
; ;Value: 1
; 1 ]=> (search-for-primes-for-question 10000)
; ;Value: 1
; 1 ]=> (search-for-primes-for-question 100000)
; ;Value: 2
; 1 ]=> (search-for-primes-for-question 1000000)
; ;Value: 4
; 1 ]=> (search-for-primes-for-question 10000000)
; ;Value: 13
; 1 ]=> (search-for-primes-for-question 100000000)
; ;Value: 28
; 1 ]=> (search-for-primes-for-question 1000000000)
; ;Value: 85

; 不是严格的两倍, why?