https://sicp.readthedocs.io/en/latest/chp2/81.html
画蛇添足了, 如果install这个题目的package, 那么会进入无限递归, 不能像原来那样正常报错了(提示找不到某个方法)

; 先查找有没有procedure, 如果没有再尝试进行转换, 基于p265_coercion.scm, 这个逻辑就是在p265_coercion.scm里定义的