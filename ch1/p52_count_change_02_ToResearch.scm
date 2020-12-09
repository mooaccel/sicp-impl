; 1美元等于100美分
; n = 5
; 50, 25, 10, 5, 1
; pennies (1¢), nickels (5¢), dimes (10¢)

; 怎么处理多次兑换的问题? 比如100 = 50 + 50
; 区别在于递归的时候, n要不要变?
; if 可以重复
; f(target, n) = f(target, n - 1) + f(target - d, n)
; f(100, 5) = f(100, 4)             +                f(50, 5)
; f(100, 5) = f(100, 3) + (75, 4)   +          f(50, 4) + f(25, 5)

; if 不能重复
; f(target, n) = f(target, n - 1) + f(target - d, n - 1)
;f(100, 5) = f(100, 4) +                  f(50, 4)
;            f(100, 3) + f(75, 3)         f(50, 3) + f(25, 3)

; base情况
; 当target > 0, but n = 0, f() = 0, 没有零钱可以用了
;             , if n != 0, 继续换
; target = 0, f() = 1, 已经兑换完了, 计数+1
; target < 0, f() = 0, 不能这样换, 这条路径走不通

; 5   4   3   2  1
; 50, 25, 10, 5, 1
(define (acquire-first-in-orderedset x)
  (cond ((= x 5) 50)
        ((= x 4) 25)
        ((= x 3) 10)
        ((= x 2) 5)
        ((= x 1) 1)
        ; else ??怎么处理
        (else 0)))
;(define (count-charge target n)
;  (cond ((= target 0) 1)
;        ((< target 0) 0)
;        ((and (> target 0) (= n 0)) 0)
;        (else (+ (count-charge target (- n 1))
;                 (count-charge (- target (acquire-first-in-orderedset n)) n)))))
; 优化逻辑, 这是等价的, 因为到(= n 0) eval的时候target必然是> 0的
(define (count-charge target n)
  (cond ((= target 0) 1)
        ((or (< target 0) (= n 0)) 0)
        (else (+ (count-charge target (- n 1))
                 (count-charge (- target (acquire-first-in-orderedset n)) n)))))
; 292
(count-charge 100 5)

(count-charge 11 5)
; todo1, 研究下or/and 是不是有短路评估? 应该是
; todo2, 研究下cond是不是也有短路评估? if就是只有一条路径会生效, 会因为application order产生细微影响
; todo3, 冗余计算消除问题, 如何用dp(dynamic programming)消除?
;        这种是top-down的计算模式, 采用top-down with memoization可以解决
;        [clrs, 第三版英文p365]. The ﬁrst approach is top-down with memoization. 2 In this approach, we write the procedure recursively in a natural manner, but modiﬁed to save the result of each subproblem (usually in an array or hash table). The procedure now ﬁrst checks to see whether it has previously solved this subproblem. If so, it returns the saved value, saving further computation at this level; if not, the procedure computes the value in the usual manner. We say that the recursive procedure has been memoized; it “remembers” what results it has computed previously.
;        或者是用C/C++语言这种, 手动写for循环, 然后带个table, 叫bottom-up method. Leetcode上有这种题

; 尝试用C++写
; #include <iostream>
; #include <unordered_map>
; 
; class CountCharge {
;  public:
;   CountCharge() {
;       change_ht_[5] = 50;
;       change_ht_[4] = 25;
;       change_ht_[3] = 10;
;       change_ht_[2] = 5;
;       change_ht_[1] = 1;
;   }
; 
;   int GetCountCharge(int target, int n) {
;       if (target == 0) {
;           return 1;
;       } else if (target < 0 || n == 0) {
;           return 0;
;       } else {
;           return GetCountCharge(target, n - 1) + GetCountCharge(target - change_ht_[n], n);
;       }
;   }
;  private:
;   //  5   4   3   2  1
;   //  50, 25, 10, 5, 1
;   std::unordered_map<int, int> change_ht_;
; };
; 
; int main() {
;     CountCharge countCharge;
;     std::cout << countCharge.GetCountCharge(100, 5) << '\n';
; }

; top-down with memoization待研究