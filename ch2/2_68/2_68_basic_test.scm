; 导入sample-tree
(load "./ch2/2_67.scm")
(load "./ch2/2_68/2_68.scm")

; (define a_symbol 'A)
; (define symbol_list_1 (symbols sample-tree))
; ; (symbol-in-list? 'A symbol_list_1)
; symbol_list_1
; (eq? a_symbol (car symbol_list_1))

; (encode (list 'A 'D 'A 'B 'B 'C 'A) sample-tree)

; A: 0
(encode-symbol 'A sample-tree)
; B: 1 0
(encode-symbol 'B sample-tree)
; C: 1 1 1
(encode-symbol 'C sample-tree)
; D: 1 1 0
(encode-symbol 'D sample-tree)