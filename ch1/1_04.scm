; (if (> b 0) + -) is operator
; a + | b |
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) 
   a 
   b))
; 4
(define valA (a-plus-abs-b 1 -3))
valA
; 8
(define valB (a-plus-abs-b 1 7))
valB

1_04. 有点神奇.返回值可以是operator...感觉写C/C++有点思维定式了,刚开始没看出来功能是啥.
>   在一些语言中, `+` 和 `-` 都是具有特殊作用的运算符(operator)，但是在scheme(和许多其他函数式语言)中, 它们只是函数.
https://sicp.readthedocs.io/en/latest/chp1/4.html
其实(if (> b 0) + -)返回的就是高阶函数了
; 补充例子, 进一步验证
(define Op (if (> 1 10) + -))
Op
(Op 100 200)