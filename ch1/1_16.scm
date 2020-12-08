; (define (fast-expt b n)
;   (cond ((= n 0) 1)
;         ((even? n) (square (fast-expt b (/ n 2))))
;         (else (* b (fast-expt b (- n 1))))))

; ab^n is unchanged from state to state.
; (b^n/2)^2= (b^2)^n/2,  (1)
; invariant quantity, 本质和算法导论里提到的loop invariant是一个东西, 是非常重要的一种思想
; ab^n, 令m = b^n, 即a*m是invariant quantity, 保持不变
; 初始: 1*b^n
; 变换: if n is even, 1*b^n -> 1*b^n/2, 再利用(1), 优化成iterative process
;      else n is odd, 1*b^n -> (1*b)*b^(n-1), 再利用even的方法.
; 最终: a*1  => 输出a
(define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b) (/ n 2) a))
          ((odd? n) (fast-expt-iter 
                       (square b) 
                       (/ (- n 1) 2) 
                       (* a b)))))
(define (fast-expt b n)
  (fast-expt-iter b n 1))
(fast-expt 2 11)
; (f 2 11 1)
; (f 2 10 2)
; (f 4 5 2)
; (f 4 4 8)
; (f 16 2 8)
; (f 256 1 8)
; (f 256 0 2048)
; => a = 2048


; 回忆之前的
; iterative process只需要固定数据的变量, 就可以完成计算, 中间停止了只要提供这些变量的信息, 还可以恢复, recursive process不行, 因为还有的信息被存储在栈里, 这部分信息在解释器里.
; iterative process只是表面用了递归调用而已, 实际因为尾递归优化, 确实是iterative process, 见p45
; 参考下面的:
; The contrast between the two processes can be seen in another way. In the iterative case, the program variables provide a complete description of the state of the process at any point. If we stopped the computation between steps, all we would need to do to resume the computation is to supply the interpreter with the values of the three program variables. 
; Not so with the recursive process. In this case there is some additional “hidden” information, maintained by the interpreter and not contained in the program variables, which indicates “where the process is” in negotiating the chain of deferred operations. The longer the chain, the more information must be maintained.
; [p45], When we discuss the implementation of procedures on register machines in Chapter 5, we will see that any iterative process can be realized “in hardware” as a machine that has a ﬁxed set of registers and no auxiliary memory. In contrast, realizing a recursive process requires a machine that uses an auxiliary data structure known as a stack.