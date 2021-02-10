(load "./ch2/2_42/2_42.scm")

(queens 4)
(for-each (lambda (pos)
                    (begin
                        (newline)
                        (display pos)
                        ))
                (queens 8))