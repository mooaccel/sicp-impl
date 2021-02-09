(load "./ch2/2_37/2_37.scm")

(define m (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)))

(transpose m)

; 便于观看, 把注释放这了
; (define (accumulate op initial sequence) 
;   (if (null? sequence) 
;     initial 
;     (op (car sequence) 
;         (accumulate op initial (cdr sequence)))))

; (define (accumulate-n op init seqs)
;   (define (car-n seqs)
;     (map car seqs))
;   (define (cdr-n seqs)
;     (map cdr seqs))
;   (if (null? (car seqs)) 
;       '() 
;       (cons (accumulate op init (car-n seqs)) 
;             (accumulate-n op init (cdr-n seqs)))))