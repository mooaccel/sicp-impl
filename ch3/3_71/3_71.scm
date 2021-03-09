; integers
(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define integers (cons-stream 1 (add-streams ones integers)))

; 形成pairs, 根据权重排序
(define (weighted-pairs s t weight) 
  (cons-stream 
   (list (stream-car s) (stream-car t)) 
   (merge-weighted 
      (stream-map (lambda (x) (list (stream-car s) x)) 
                  (stream-cdr t)) 
      (weighted-pairs (stream-cdr s) (stream-cdr t) weight) 
      weight))) 

(define (merge-weighted s1 s2 weight) 
   (cond ((stream-null? s1) s2) 
         ((stream-null? s2) s1) 
         (else 
          (let ((s1car (stream-car s1)) 
                (s2car (stream-car s2))) 
            (let ((w1 (weight s1car)) 
                  (w2 (weight s2car))) 
              (cond ((< w1 w2) 
                     (cons-stream s1car 
                                  (merge-weighted (stream-cdr s1) s2 weight))) 
                    ((> w1 w2) 
                     (cons-stream s2car 
                                  (merge-weighted s1 (stream-cdr s2) weight))) 
                    (else 
                     (cons-stream 
                      s1car 
                      (cons-stream 
                       s2car ;; must include both in case of ties! 
                                  (merge-weighted 
                                   (stream-cdr s1) 
                                   (stream-cdr s2) 
                                   weight)))))))))) 

(define (Ramanujan s) 
         (define (stream-cadr s) (stream-car (stream-cdr s))) 
         (define (stream-cddr s) (stream-cdr (stream-cdr s))) 
         (let ((scar (stream-car s)) 
               (scadr (stream-cadr s))) 
                (if (= (sum-triple scar) (sum-triple scadr))  
                        (cons-stream (list (sum-triple scar) scar scadr) 
                                                 (Ramanujan (stream-cddr s))) 
                        (Ramanujan (stream-cdr s))))) 
; x是一个用list表示的pair
(define (triple i) (* i i i))
(define (sum-triple x) (+ (triple (car x)) 
                          (triple (cadr x)))) 
(define ramanujan_numbers 
        (Ramanujan (weighted-pairs integers integers sum-triple))) 
(stream-ref ramanujan_numbers 0) 
(stream-ref ramanujan_numbers 1) 
(stream-ref ramanujan_numbers 2) 
(stream-ref ramanujan_numbers 3) 
(stream-ref ramanujan_numbers 4) 
(stream-ref ramanujan_numbers 5) 