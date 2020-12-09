(load "./ch1/1_33/filtered_accumulate.scm")

; 2 + 4 + 6 + 8 + 10 = 30
(filtered-accumulate +                
                     0
                     (lambda (x) x)
                     1
                     (lambda (i) (+ i 1))
                     10
                     even?)