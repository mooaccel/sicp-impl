### 为什么用stream?

* 1.传统思路
> for 循环挨个遍历, 然后进行处理, C/C++就是这样的

* 2.抽象化，更加清晰，但是效率可能低
> 2.2.3 Sequences as Conventional Interfaces

* 3.然后用延迟计算, 也就是流。既有效率又有抽象清晰度
> on-demand

经历了1->2->3
> stream可能只在某些场景下比较好?

本质上最终 流的计算模式的过程和传统思路差不多的。(比如计算一个区间内prime之和)
都是拿到一个元素然后进行一些逻辑计算，然后再下一个元素

### 可变性与延迟求值
```C
可变性与延迟求值 就是两个不相容的东西。
可变性会引入顺序，而且依赖于特定顺序
延时却是另外一个思路，让我们不显式关注order。。
延时是on-demand的, 逻辑是还有一定的处理顺序的(但是什么时候处理不一定，因为是按需的)，但是不要在这些顺序中插入赋值/变动等强依赖于order的语句。
```