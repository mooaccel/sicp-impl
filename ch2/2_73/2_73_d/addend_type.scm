; table put/get 
(load "./ch2/2_73/2_73_b/table_basic.scm")

(define (install-addend-package)
  ;; internal procedures
  (define (addend-impl s) 
    (car s))
  ; interface to the rest of the system
  (put '+ 'addend addend-impl)

  'done) ; 这个done啥意思

; 什么时候该加上contents有点问题
; 最好做到高内聚, 内部用的都是无tag的, 外部用的才有tag. 
; 然后把需要用tag的那部分内部的内聚到一起
; 目前就这么改了, 不太好, 因为在deriv里需要调用它
; 要不然合并这三个文件?
(define (addend s)
  ((get '+ 'addend) s)
)