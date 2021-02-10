(define (enumerate-interval low high) 
  (if (> low high) 
      '() 
      (cons low (enumerate-interval (+ low 1) high))))

; flatmap不会改变顺序
(define (flatmap proc seq) 
  (accumulate append '() (map proc seq)))

(define (accumulate op initial sequence) 
  (if (null? sequence) 
    initial 
    (op (car sequence) 
        (accumulate op initial (cdr sequence))))) ; fold_right
