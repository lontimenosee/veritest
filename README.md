# Verilog test

这里用来存放一些常见的手撕代码

### 序列检测

遇到的报错

### commit1

- 没有给case放endcase
- 没有给输入输出列表定reg和wire（默认wire可以，但是reg要声明，尤其在输出时）
- localparam 需要定义时赋默认值



## 仿真操作

### Questasim
- vlib work
- vmap work work

- vlog yourfile.v
- vlog tb_yourfile.v

- vsim work.tb_module （注意要使用模块名）

- add wave -r /*
- run -all