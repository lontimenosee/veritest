# Verilog test

这里用来存放一些常见的手撕代码

## 遇到的问题
### 序列检测


- 没有给case放endcase
- 没有给输入输出列表定reg和wire（默认wire可以，但是reg要声明，尤其在输出时）
- localparam 需要定义时赋默认值

- 一个reg只能被一个always赋值

### 边沿检测

- 没有给tb文件加timescale
- 同一时序过程内对valid进行了两次非阻塞赋值，这会导致后面的结果覆盖前面的

## 仿真操作

### Questasim
- vlib work
- vmap work work

- vlog yourfile.v
- vlog tb_yourfile.v

- vsim -voptargs=+acc work.tb_module （注意要使用模块名，切记添加中间的命令，不然没波形）

- add wave -r /*
- run -all