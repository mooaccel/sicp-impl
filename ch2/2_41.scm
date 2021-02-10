(define (accumulate op initial sequence) 
  (if (null? sequence) 
    initial 
    (op (car sequence) 
        (accumulate op initial (cdr sequence))))) ; fold_right

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

; 1<=k<j<i<=n, 注意i最大
(define (unique-triple n)
  (flatmap (lambda (i)
              (map (lambda (pair) 
                           (cons i pair))
                   (unique-pairs (- i 1))))
          (enumerate-interval 1 n)))

(define (unique-triple-2 n)
  (flatmap (lambda (i)
              (map (lambda (pair) 
                           (cons i pair))
                   (flatmap (lambda (i)
                                (map (lambda (j) (list i j))
                                     (enumerate-interval 1 (- i 1))))
                            (enumerate-interval 1 (- i 1)))))
          (enumerate-interval 1 n)))

;      1 2 3 4
; =>  (*, *, *) *** *** *** 
; 1 ; for 2 3 4  
; 1 -> m * n 
;  
(unique-triple 4)
(unique-triple-2 4)
(unique-triple 5)
(unique-triple-2 5)
;(define (triple-sum-equal sum n)
;  (filter equal-sum? (unique-triple n)))

(define (triple-equal-sum sum n)
  (filter (lambda (triple) (= (accumulate + 0 triple) sum))
          (unique-triple n)))
(triple-equal-sum 8 6)
; 
(unique-triple 4)
; ((3 2 1) (4 2 1) (4 3 1) (4 3 2))
; ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))
(unique-pairs 3)
; ((2 1) (3 1) (3 2))