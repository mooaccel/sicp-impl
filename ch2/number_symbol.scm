(symbol? 1)
(define val1 'x)
(symbol? '1) ; 为什么这个是#f
(symbol? 'x)
(number? '1) ; 这个是#t
(number? 'x)
(+ '1 '2)  ; '施加在数字上面会给eval?