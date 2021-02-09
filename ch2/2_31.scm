(define (square x)
  (* x x))

(define (tree-map op tree)
  (cond ((null? tree) '()) 
        ((list? tree) 
          (cons (tree-map op (car tree))
                (tree-map op (cdr tree))))
        (else (op tree))))

(define (square-tree tree) 
  (tree-map square tree))

(square-tree (list 9 (list 2 (list 3 4) 5) (list 6 7)))