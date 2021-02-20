(define (make-withdraw initial-amount)
  (let ((balance initial-amount)) 
    (lambda (amount) 
      (if (>= balance amount) 
          (begin (set! balance (- balance amount)) 
                 balance) 
          "Insufficient funds"))))
(define (make-withdraw initial-amount)
  ((lambda (balance) 
    (lambda (amount) 
      (if (>= balance amount) 
          (begin (set! balance (- balance amount)) 
                 balance) 
          "Insufficient funds")))
  initial-amount))

; 大概清楚
https://sicp.readthedocs.io/en/latest/chp3/10.html