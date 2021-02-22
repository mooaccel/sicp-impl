* wire是一个object, 是基本元素, 通过message passing style方式实现, 然后看p378末尾注释
* 用or/and/inverter box去处理wire之间的组合
* event-driven, wire上相当于是注册了回调函数, 当wire的signal发生改变时就会调用它的回调函数, 
而为了模拟电路的delay, 一个wire上的回调函数执行的执行, 会把after-delay注册到agenda上
然后通过propagate去处理agenda里面的item, 从而使得经过模拟的延迟之后, output被设置
如果output这根wire也注册了回调, 那么继续执行output wire的回调, 其实也是after-delay 

Q1. 那么在更复杂一点的电路里, 比如half adder, 一次propagate能执行完吗? 能
> 两次propagate递归调用之间, 因为output的set-signal!, 会再次调用after-delay, 然后agenda又有新的项到来
> 从而下次propagate又可以执行item
> 只需在外部触发一次

* 每次调用propagate才会设置cur time, 然后下次after-delay调用时再根据cur time + 不同delay即可
Q2. 链式回调思想. 进一步理了下
* we can say that the primitive function boxes form the primitive elements of the language, that wiring boxes together provides a means of combination, and that specifying wiring patterns as procedures serves as a means of abstraction.
通过连线提供组合, 在一开始设置好电路的pattern, 然后各级回调都设置好, 其实就是各个or/and...
然后前面的set-signal之后=>after-delay=>propagate=>set-signal=>after-delay=>propagate...
只有第一次的propagate是手动触发, 后面都是递归触发
从而形成了链式回调...