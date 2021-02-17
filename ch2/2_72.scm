; 三个维度
; 1. 多少个编码单元 O(m)
; 2. 如果是2_71的为范例, 跟树高h有关(书高=log(所有节点数)), 
; 最少的下降1层, 最大的下降n-1层, n代表叶子数量
; 3. 在每一层, 还需要考虑是否在左右节点的list之中, 才能决定超左右哪边走 O(n)

; 如果只考虑2,3 并以2_71为例子, 最不频繁O(n), 最频繁O(n^2)
; 如果考虑1,2,3, 就是O(m*n), O(m*n^2)