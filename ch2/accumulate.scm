(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence))))) ;initial在触底base情况才会用, 不然就是一直传递

;(accumulate + 0 '(1 2 3 4 5))