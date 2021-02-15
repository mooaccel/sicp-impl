;(define (lookup given-key set-of-records)
;  (cond ((null? set-of-records) false) 
;        ((equal? given-key (key (car set-of-records))) (car set-of-records)) 
;        (else (lookup given-key (cdr set-of-records)))))
(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false) 
        ((equal? given-key 
                 (key (car set-of-records))) 
          (car set-of-records)) 
        (else (lookup given-key (cdr set-of-records)))))
; entry ：取出当前节点
; left-branch ：转向树的左分支
; right-branch ：转向树的右分支
; key ：从节点中获取键
(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      #f
      (let ((entry-key (key (entry set-of-records))))
        (cond ((= given-key entry-key)
                (entry set-of-records))
              ; given-key比当前的entry-key更大, 所以超右边走
              ((> given-key entry-key)
                (lookup given (right-branch set-of-records)))
              ((< given-key entry-key)
                  (lookup given-key (left-branch tree-of-records)))))))