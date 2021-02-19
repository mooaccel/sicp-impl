2.1 后面的区间算术 ch2.1-13/14/15/16这几道题还没做, 有点麻烦
2.2 图形语言ch2.2-50/51/52这几道题
2.5 符号代数2.92没做, 2.94(包括94)之后的没做

### 第二章学习感悟
第二章 Building Abstractions with Data
---
* 最重要的是学到了数据抽象
* 从2.1构建有理数系统, 然后是抽象屏障, 这个是水平方向的抽象屏障, 如图2-1, 在复数那个例子里对不同表示又可以使用竖直屏障, 然后采用2.4节的办法进行实现, 
---
* 在2.2.3 Sequences as Conventional Interfaces
主要是学到了enumerate, filter, map, accumulate这种计算模式能很好的把逻辑分开, 然后对list进行各种处理, 通过一些后面的习题, 可以进一步加深这里的理解
---
* 2.4以及2.5的例子绝大多数采用的都是data-directed style
* additivity其实和OCP开闭原则的开说的是一个东西
---
* 可以用precedure表示数据, 这个很惊艳, 2.1.3 What Is Meant by Data?(好好读读这一节!!!)
> In general, we can think of data as deﬁned by some collection of selectors and constructors, together with speciﬁed conditions that these procedures must fulﬁll in order to be a valid representation.
> we cannot distinguish this implementation from one that uses “real” data structures. 真正好的接口是让你没法区分底下到底采用的是什么实现, 只用管某一层向上的接口就行了, 比如cons/car/cdr函数.
we could implement cons, car, and cdr without using any data structures at all but only using procedures.
(define (cons x y) (lambda (m) (m x y))) 
(define (car z) (z (lambda (p q) p)))
后面的Exercise 2.6更是把非负整数用precedure表示, 确实很秀...!!!
* 然后后面书中说和message passing style风格有关系在第三章会进一步研究, todo, 第二章没详细讲message passing风格的例子
---
* 2.5 利用data-directed style进一步抽象, 设计如图2-23所示的通用型算术系统, 进一步抽象, 然后深刻体会到了data-directed style+通用操作的威力, 本质就是通过查table对操作dispatch!!!
* 2.5.2 研究的是类型转换...
* 2.5.3 Example: Symbolic Algebra里比较的是看到了"recursive data abstraction", 多项式的系数coeff本身又可以是其他多项式, 然后那个对象式的系数又进一步可以是其他多项式... 递归本质!!!p285
“recursive data abstraction,” in that parts of a polynomial may themselves be polynomials.
generic operations and our data-directed programming style可以很好的处理这种难题!!! 思路非常赞

---
* 总之就是 抽象再抽象, 然后模块化, 依赖于接口不依赖于实现, 要注意单元测试, 可以采用TDD, 这样还便于重构. 各个模块之间有时又需要打破它们的间隔, 比如2.5.2...这里就需要进行各种设计, 可能是设计难点
* 抽象可以是水平抽象屏障, 也可以是竖直抽象屏障
* 递归非常强大, 与closure数学特性有很大关系

另外还有summary_ch2.4.md这个2.4的小节总结