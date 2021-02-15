(load "./ch2/2_63/2_63.scm")

(define (list->tree elements) 
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts) 
      (let ((left-size (quotient (- n 1) 2)))

        ; 得到左边结果left-result
        (let ((left-result (partial-tree elts left-size))) 

          (let ((left-tree (car left-result)) 
                ; 得到剩下的没在左子树的元素
                (non-left-elts (cdr left-result)) 
                ; 计算右边的尺寸
                ; n - left-size - 1
                (right-size (- n (+ left-size 1)))) 

              ; 得到this-entry和right-result
              (let ((this-entry (car non-left-elts)) 
                    (right-result (partial-tree (cdr non-left-elts) right-size)))

                (let ((right-tree (car right-result)) 
                      (remaining-elts (cdr right-result))) 

                    (cons (make-tree this-entry left-tree right-tree) 
                          remaining-elts))))))))
; (1 3 5 7 9 11)

(define (test-quotient n)
  (quotient (- n 1) 2))
;(test-quotient 2)
;(test-quotient 3)
;(test-quotient 4)
;(test-quotient 5)
(test-quotient 6)
;(test-quotient 7)

; (1 3 5 7 9 11)
; if n = 6
; 左 2 右3
; [ 1 3 ] 5 [7 9 11]
; 左 (1 3 5 7 9 11)  n = 2
; 左 0, 中1, 右3
; 返回这个左子树, [7 9 11] 3
; 左7 中9 右11 
; 运行结果:
; (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

; b O(n)
(list->tree '(1 3 5 7 9 11))