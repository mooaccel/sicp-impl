(load "./ch2/p226_huffman_tree.scm")

(define (symbol-in-list? symbol symbol_list)
  (if (null? symbol_list)
      #f
      (cond ((eq? symbol (car symbol_list))
              #t)
            (else (symbol-in-list? symbol (cdr symbol_list))))))

; 得到当前节点符号(symbols tree) 
; 得到一个符号对应的bit list
(define (encode-symbol symbol tree)
  (let ((cur_symbol_list (symbols tree)))
    (if (not (symbol-in-list? symbol cur_symbol_list))
        (error "not exist this symbol: " symbol)
        (if (leaf? tree)
             ; 如果是leaf, 返回'()
             '()
             (let ((left_br (left-branch tree))
                    (right_br (right-branch tree)))
                    
                (let ((left_symbol_list (symbols left_br))
                      (right_symbol_list (symbols right_br)))

                    (if (symbol-in-list? symbol left_symbol_list)
                        (cons '0 (encode-symbol symbol left_br))
                        (cons '1 (encode-symbol symbol right_br)))
                ))
            ))))

(define (encode message tree)
  (if (null? message) 
      '() 
      (append (encode-symbol (car message) 
                             tree) 
              (encode (cdr message) tree))))