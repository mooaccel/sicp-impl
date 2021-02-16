; encode
(load "./ch2/2_68/2_68.scm")
; generate-huffman-tree 
(load "./ch2/2_69/2_69.scm")

; 注意书本上A对应频率2
(define pairs2_70 (list (list 'A 2)
                       (list 'BOOM 1)
                       (list 'GET 2) 
                       (list 'JOB 2)
                       (list 'SHA 3)
                       (list 'NA 16)
                       (list 'WAH 1)
                       (list 'YIP 9)))
(make-leaf-set pairs2_70)
(define sample_tree_2_70 (generate-huffman-tree pairs2_70))

; (
;  (leaf na 16) 
;  ((leaf yip 9) 
;   (((leaf a 2) 
;     ((leaf wah 1) 
;      (leaf boom 1) (wah boom) 2) (a wah boom) 4) 
;    ((leaf sha 3) 
;     ((leaf job 2) 
;      (leaf get 2) 
;      (job get) 
;      4) 
;     (sha job get) 
;     7) 
;    (a wah boom sha job get) 
;    11)
;   (yip a wah boom sha job get) 
;   20) 
;  (na yip a wah boom sha job get) 
;  36
; )

sample_tree_2_70

; (1 1 1 1 1 1 1 0 0 1 1 1 1 0)
(encode '(Get a job) sample_tree_2_70)

(encode (list 'Sha 'na 'na 'na 'na 'na 'na 'na 'na) sample_tree_2_70)

(encode '(Get a job) sample_tree_2_70)

(encode (list 'Sha 'na 'na 'na 'na 'na 'na 'na 'na) sample_tree_2_70)

(encode '(Wah yip yip yip yip yip yip yip yip yip) sample_tree_2_70)

(encode '(Wah Sha boom) sample_tree_2_70)

; 89个bit
; 如果定长编码, 最少需要3bit 2^3=8,  3*36词 = 108bit
; 哈夫曼编码节省108-89=19个bit
