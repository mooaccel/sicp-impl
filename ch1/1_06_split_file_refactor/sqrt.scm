; 注意, 这个1_06_split_file_refactor
; load "相对路径/*.scm"
; 这个相对路径是相对于vscode打开而言的, 比如一般打开sicp-impl这一层.
; 把命令执行之前输出一下pwd即可
(load "./ch1/1_06_folder/improve.scm")
(load "./ch1/1_06_folder/good-enough.scm")

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (sqrt x) 
  (sqrt-iter 1.0 x))

(trace sqrt-iter)
(sqrt 10)