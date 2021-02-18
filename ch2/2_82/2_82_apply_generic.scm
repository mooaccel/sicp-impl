; p238 tag相关函数
(load "./ch2/p238_tag.scm")

; 修改版本的apply-generic, 多了类型转换, 即coercion
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args))) 
    (let ((proc (get op type-tags))) 
      (if proc 
          (apply proc (map contents args)) 
          (let ((coerced_args (coerce type-tags args)))
            ; coerced-args如果在coerce执行失败的时候是#f
            (if coerced_args
                (let ((coerced_type_tags (map type-tag coerced_args)))
                  (let ((new-proc (get op coerced_type_tags))) 
                    (apply new-proc (map contents coerced_args))
                  ))
                (error "No method for these types" 
                       (list op type-tags)))  
          )))))

; type-tags是args的对应tag
; 这个逻辑实现的很好...
; 很清晰http://community.schemewiki.org/?sicp-ex-2.82
;; Generate a list of coercion procedures, and the apply each one to the 
;; corresponding arguement. 
(define (coerce type-tags args) 
   (define (iter tags) 
     (if (null? tags) 
         false 
         (let ((type-to (car tags))) 
           (let ((coercions 
                  (map (lambda (type-from) 
                         (if (eq? type-from type-to) 
                             (lambda (x) x) ; identity "coercion" for same-types 
                             (get-coercion type-from type-to))) 
                       ; 注意这里是扫描所有的type-tags
                       type-tags))) 
             (if (any-false? coercions) 
                 (iter (cdr tags)) 
                 (map (lambda (coercion arg) (coercion arg)) 
                      coercions 
                      args)))))) 
   (iter type-tags)) 

(define (any-false? items)
  (cond ((null? items)
          false)
        ; 碰到一个false, 就可以返回了
        ((not (car items)) 
          true)
        (any-false? (any-false? (cdr items)))))

; todo 1. 没有进行测试
; todo 2. 题目里说的那种不足够有效的场景指什么?

; 参考了答案
; Situation where this is not sufficiently general: 
; types: A B C 
; registered op: (op some-A some-B some-B) 
; registered coercion: A->B C->B 
; Situation: Evaluating (apply-generic op A B C) will only try (op A B C), (op B B B) and fail  
; while we can just coerce C to B to evaluate (op A B B) instead 
; (op (A B C))和(op (B B B))这两个才会进行get查找
; 但是不会进行(op (A B B))的get查找, 理论上能调用成功, 但是结果却不行.
; 根本原因在于多个参数形成的所有组合并没有进行逐个遍历, 漏掉了一部分, 但是类型×类型×类型这样会导致搜索空间太大了...