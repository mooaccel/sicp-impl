(load "./ch1/1_23/search_for_primes.scm")
(load "./ch1/1_24/fast-prime.scm")

; (define (prime? n) 
;   (fast-prime? n 10))

(search-for-primes-for-question 1000)
(search-for-primes-for-question 10000)
(search-for-primes-for-question 100000)
(search-for-primes-for-question 1000000)
(search-for-primes-for-question 10000000)
(search-for-primes-for-question 100000000)
(search-for-primes-for-question 1000000000)
; 3 3 4 4  7  5  5
; 1 2 2 4 13 28 82
; n比较小的时候可能运行还更慢, 但是随着n的增大, O(logn)算法明显更优, 