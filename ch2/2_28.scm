; 两种办法
; 1. 在子层生成新的, 然后返回之后append
; 2. 共用一个acc, 从子层返回之后acc上的累积元素将会变的更多
; 参数名是tree还是li不重要
(define (fringe tree)
  (define (fringe-iter tree acc)
    (if (null? tree)
        acc
        (let ((hd (car tree))
              (tl (cdr tree)))
          (if (list? hd)
              (fringe-iter tl (fringe-iter hd acc))
              (fringe-iter tl
                           (cons hd acc))))
    ))
  (reverse (fringe-iter tree '())))

(define x (list (list 1 2) (list 3 4)))
x
(fringe x)
(fringe (list x x))

; 名字还可以叫flatten, 和Ocaml 99Question的Q7是一个问题
; type 'a node =
;   | One of 'a 
;   | Many of 'a node list;;
; let flatten list =
;   let rec aux acc = function
;     | [] -> acc
;     | One x :: t -> aux (x :: acc) t
;     | Many l :: t -> aux (aux acc l) t in
;   List.rev (aux [] list);;
; 这个更简洁...
; 思路和这里的scheme写法完全一样, acc在递归的上下函数多层是共享的