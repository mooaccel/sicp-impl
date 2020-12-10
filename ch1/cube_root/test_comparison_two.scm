; cuberoot
(load "./ch1/cube_root/test_cube_root_using_exercise_1_08.scm")
; cube-root-v2
(load "./ch1/cube_root/test_cube_root_using_fixed_point.scm")


(cuberoot 5000)
(cube-root-v2 5000) 


;  1 ]=> (cuberoot 5000)
;  Step: 1 Guess: 1.
;  Step: 2 Guess: 1667.3333333333333
;  Step: 3 Guess: 1111.5561550758432
;  Step: 4 Guess: 741.0387856364214
;  Step: 5 Guess: 494.0288921480814
;  Step: 6 Guess: 329.35942356003267
;  Step: 7 Guess: 219.58831319084615
;  Step: 8 Guess: 146.42677329592777
;  Step: 9 Guess: 97.69558228208444
;  Step: 10 Guess: 65.30501016400508
;  Step: 11 Guess: 43.92747451511453
;  Step: 12 Guess: 30.148709578294547
;  Step: 13 Guess: 21.932767976339203
;  Step: 14 Guess: 18.086515201092954
;  Step: 15 Guess: 17.15261539556624
;  Step: 16 Guess: 17.099922175455468
;  Step: 17 Guess: 17.099759468315167
;  ;Value: 17.099759468315167
;  
;  1 ]=> (cube-root-v2 5000)
;  Step: 1 Guess: 1.
;  Step: 2 Guess: 1667.3333333333333
;  Step: 3 Guess: 1111.5561550758432
;  Step: 4 Guess: 741.0387856364214
;  Step: 5 Guess: 494.0288921480814
;  Step: 6 Guess: 329.35942356003267
;  Step: 7 Guess: 219.58831319084615
;  Step: 8 Guess: 146.42677329592777
;  Step: 9 Guess: 97.69558228208444
;  Step: 10 Guess: 65.30501016400508
;  Step: 11 Guess: 43.92747451511453
;  Step: 12 Guess: 30.148709578294547
;  Step: 13 Guess: 21.932767976339203
;  Step: 14 Guess: 18.086515201092954
;  Step: 15 Guess: 17.15261539556624
;  Step: 16 Guess: 17.099922175455468
;  Step: 17 Guess: 17.099759468315167
;  Step: 18 Guess: 17.09975946676697
;  ;Value: 17.09975946676697

; 除了cube-root-v2 5000多了第18步(由于内部采用的good-enough/close-enough不一样导致的, 也即没有采用exercise1.8的优化...)
; 其他完全一样, 说明fixed-point的计算, 背后本质其实还是牛顿迭代优化法...
; 这俩的迭代优化方程完全一样, 都是exercise 1.8那个, fixed-point的本来是average damp的, 
; 被我自己改的, 想看看区别...结果还是exercise 1.8更优, 所以又引出了一个问题, 怎么设计更优的牛顿迭代方程?
; 有没有最优的?
; 至于终止条件的话, 还是exercise 1.7的更好...