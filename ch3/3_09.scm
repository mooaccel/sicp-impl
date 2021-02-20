; 定义的位置制造一个全局env
(define (factorial n) 
  (if (= n 1) 
      1 
      (* n (factorial (- n 1)))))

(factorial 6) ; new env, new frame
n binding to 6
然后apply body
https://sicp.readthedocs.io/en/latest/chp3/9.html

(define (factorial n) 
  (fact-iter 1 1 n)) 
(define (fact-iter product counter max-count)
  (if (> counter max-count)
  product
  (fact-iter (* counter product) 
             (+ counter 1) 
             max-count)))

(fact-iter 1 1 6)
(fact-iter 1 2 6)
