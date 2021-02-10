(define (accumulate op initial sequence) 
  (if (null? sequence) 
    initial 
    (op (car sequence) 
        (accumulate op initial (cdr sequence)))))

(define (make-pair-sum pair)
  (list (cadr pair) (car pair) (+ (car pair) (cadr pair))))

(define (enumerate-interval low high) 
  (if (> low high) 
      '() 
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq) 
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
    (flatmap (lambda (i)
                 (map (lambda (j) (list i j))
                      (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))
(unique-pairs 5)

(load "./ch1/1_23/prime.scm")

(define (prime-sum-pairs n)
  (define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))
  (define (make-pair-sum pair)
    (list (cadr pair) (car pair) (+ (car pair) (cadr pair))))
  (map make-pair-sum 
       (filter prime-sum? (unique-pairs n))))
(prime-sum-pairs 5)
(prime-sum-pairs 6)