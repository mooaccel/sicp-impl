;  0   1
;  1   1 1
;  2   1 2 1
;  3   1 3 3 1
;  4   1 4 6 4 1
;  
;      0 1 2 3 4
; 
;      col == 0 || row == col => 1
     
; (define (pascal row col)
;   (let ((pre_row (- row 1))
;         (pre_col (- col 1)))
;        (if (or (= col 0) (= row col))
;            1
;            (+ (pascal (- row 1) col)
;               (pascal (- row 1) (- col 1))))))

; 没有进行越界检查
; (define (pascal row col)
;        (if (or (= col 0) (= row col))
;            1
;            (let ((pre_row (- row 1))
;                  (pre_col (- col 1)))
;                 (+ (pascal (- row 1) col)
;                    (pascal (- row 1) (- col 1))))))

(load "./ch1/factorial.scm")

(define (pascal row col)
  (if (or (< row 0) (< col 0) (< row col))
      0
      (/ (factorial row)
         (* (factorial col)
            (factorial (- row col))))))

; 1
(pascal 4 4)
(pascal 4 2)
(pascal 3 1)
(pascal 2 2)
(pascal 1024 256)
(pascal 4 5)