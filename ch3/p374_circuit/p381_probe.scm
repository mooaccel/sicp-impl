; name是一个标识符
(define (probe name wire)
    (add-action! wire
                 (lambda ()        
                    (newline)
                    (display name)
                    (display " ")
                    (display (current-time the-agenda))
                    (display "  New-value = ")
                    (display (get-signal wire)))))