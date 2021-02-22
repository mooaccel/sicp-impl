; time-segment, time-queue pair
(define (make-time-segment time queue) 
  (cons time queue))
(define (segment-time s) (car s)) 
(define (segment-queue s) (cdr s))

; 0代表初始time
(define (make-agenda) (list 0)) 
(define (current-time agenda) 
  (car agenda)) 
(define (set-current-time! agenda time)
  (set-car! agenda time)) 
; 返回segments, 即time-queue pairs 按time大小排序?
(define (segments agenda) (cdr agenda)) 
(define (set-segments! agenda segments)
  (set-cdr! agenda segments)) 
(define (first-segment agenda) 
  (car (segments agenda))) 
(define (rest-segments agenda) 
  (cdr (segments agenda)))
(define (empty-agenda? agenda) 
  (null? (segments agenda)))


; time怎么计算出来的?
(define (add-to-agenda! time action agenda)
  ; ?
  (define (belongs-before? segments) 
    (or (null? segments) 
        (< time (segment-time (car segments)))))
  (define (make-new-time-segment time action) 
    (let ((q (make-queue))) 
      (insert-queue! q action) 
      (make-time-segment time q)))
  ; add-to-segments实现的很好...
  (define (add-to-segments! segments) 
    (if (= (segment-time (car segments)) time) 
        (insert-queue! (segment-queue (car segments)) action) 
        (let ((rest (cdr segments))) 
          (if (belongs-before? rest) 
              ; 插入空隙
              (set-cdr! segments (cons (make-new-time-segment time action) 
                                       (cdr segments))) 
              (add-to-segments! rest)))))

  (let ((segments (segments agenda))) 
    (if (belongs-before? segments)   ; 应该放在最前面, 这个time最小
        (set-segments! agenda (cons (make-new-time-segment time action) 
                                    segments)) 
        (add-to-segments! segments))))

; 移除第一个item
(define (remove-first-agenda-item! agenda)
  (let ((q (segment-queue (first-segment agenda)))) 
    (delete-queue! q) 
    (if (empty-queue? q) 
        (set-segments! agenda (rest-segments agenda)))))

; 读访问第一个item, 并更新current time
(define (first-agenda-item agenda)
  (if (empty-agenda? agenda) 
      (error "Agenda is empty: FIRST-AGENDA-ITEM") 
      (let ((first-seg (first-segment agenda))) 
           (set-current-time! agenda (segment-time first-seg)) 
           (front-queue (segment-queue first-seg)))))