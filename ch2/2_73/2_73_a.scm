; 2_73 a
; 类似于2.4.3节复数运算系统的Data-Directed Programming设计,
; Data-directed programming is the technique of designing programs to work with such a table directly.
; 把performing a dispatch on the type of the expression这种任务不再在代码中用if/else体现, 这样没有体现OCP开闭原则
; 所以采用data-directed style, 把这部分的dispatching on type的任务抽出来放在一个table里, 然后基于操作/type维度做dispatch

; https://sicp.readthedocs.io/en/latest/chp2/73.html
; deriv 过程没有对 number? 和 same-variable? 使用数据导向处理的原因是，在求导程序中，数字被直接表示为Scheme数值类型，而变量被直接表示为Scheme的符号类型, 因此只使用 number?和 same-variable?这两种内置的谓词语句，就足以对这两中类型进行判断了，没有必要画蛇添足。
; 当然，如果一定要做的话，也不是不可以，但是这样一来，求导程序的每个包都要加上 number? 和 same-variable? 谓词，而这样的分派实际上是没有必要的。