(load "./ch2/2_47/2_47_cons.scm")
(load "./ch2/2_46.scm")

(define val1 (make-frame (make-vect 0.0 0.0)         ; origin
                      (make-vect 0.3 0.3)         ; edge1
                      (make-vect 0.6 0.6)))       ; edge2
(origin-frame val1)
(edge1-frame val1)
(edge2-frame val1)