(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t) 
  (accumulate (lambda (x y) (+ x y)) 
              0 
              (map (lambda (elem) (if (list? elem)
                                      (count-leaves elem)
                                      1))
                   t)))

; flatten用map实现, 弄成各个节点的个数

(define x (cons (list 1 (list 5 3) 5 6) (list 3 4)))
(length x)
(count-leaves x)
(count-leaves (list (list 1 (list 2 3)) (list (list 4 5) (list 6 7))))