(define (accumulate op initial sequence) 
  (if (null? sequence) 
    initial 
    (op (car sequence) 
        (accumulate op initial (cdr sequence)))))

(define val1 (list 1 2 3))
(define val2 (list 4 (list 5) 6))
(define val3 (list 7 8 9))

(append val2 val3)
(append val1 (append val2 val3))

;(append '() (list 1 2 3)) 都可以
;(append (list 1 2 3) '())
(define (enumerate-interval low high) 
  (if (> low high) 
      '() 
      (cons low (enumerate-interval (+ low 1) high))))

(define (generate-pair n)
  (accumulate
    append 
    '()
    (map (lambda (i) 
                 (map (lambda (j) 
                              (list i j)) 
                      (enumerate-interval 1 (- i 1)))) 
         (enumerate-interval 1 n))))

(define (flatmap proc seq) 
  (accumulate append '() (map proc seq)))

;(3 4)
;(3,1 3,2), (4,1 4,2, 4,3)
;1  
;2
;3
;4   2, 4  3, 4
(load "./ch1/1_23/prime.scm")

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(filter prime-sum? (generate-pair 5))
(define (make-pair-sum pair)
  (list (cadr pair) (car pair) (+ (car pair) (cadr pair))))
(map 
  make-pair-sum
  (filter prime-sum? (generate-pair 5)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (flatmap 
                            (lambda (i) 
                                    (map (lambda (j) 
                                                 (list i j)) 
                                         (enumerate-interval 1 (- i 1)))) 
                            (enumerate-interval 1 n)))))
(prime-sum-pairs 6)