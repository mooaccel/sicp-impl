### [1]generic operations with explicit dispatch
如p239, 需要用if/else/cond来进行dispatch, 本质上相当于data-directed style的按row划分
每个操作就相当于一行
### [2]data-directed style
为了对[1]generic operations with explicit dispatch的出现的问题进行改造.
2.4.3所述两个问题 
* One weakness is that the generic interface procedures (realpart, imag-part, magnitude, and angle) must know about all the different representations.
* Another weakness of the technique is that even though the individual representations can be designed separately, we must guarantee that no two procedures in the entire system have the same name. 
主要是第一个问题generic interface procedures需要知道所有的representations.
然后[1]主要在于In the complex-number system developed in the previous section, the correspondence between operation name, data type, and actual procedure was spread out among the various conditional clauses in the generic interface procedures
这些dispatch的逻辑散落在四处, 比较分散.
所以引入了data-directed style, 
Data-directed programming is the technique of designing programs to work with such a table directly.
这样可以让问题通过table的colomn划分, 把这部分的逻辑集中到一起, 然后在操作里面通过get, 再dispatch到某个指定procedure上
除此之外data-directed style在Exercise 2.73 d这个小问题里
还可以把两个维度给互换一下, 其实就可以实现为data-directed style按操作进行集合在一起了, 只不过这里操作变成了"类型"

== 对于data-directed style
总之, 有一张表, 然后可以通过column或者row(通过改变get dim1 dim2=> get dim2 dim1)来进行dispatch
在原始对象上带有tag, 不像[1]那样的通过if/else来做explicit dispatch, data-directed style通过table来做dispatch
而table不仅可以选择按column划分, 像2.73那样, 还可以通过按row划分.

---
[1]generic operations with explicit dispatch和 [2]data-directed style
都属于intelligent operations

### [3]messagepassing-style
把一个类型有关的操作绑定在一起了
见例子2_75.scm
通过procedure表示数据!根据传进来的函数名(即message), 不同对象(即entity)会表现出不同的行为
这样方式感觉有点类似于OOP里面的多态对象...
[3]属于intelligent data objects