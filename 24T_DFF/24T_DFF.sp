24T-DFF
* 经典24 管 D 触发器仿真文件

*选择 TT, FF, SS三种模式进行仿真
.prot
.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" TT
.unprot

* 测试电路网表
.inc 'D:\VLSI_homework\final\24T_DFF\TEST_CIRCUIT.net'
* 仿真电路网表
.inc 'D:\VLSI_homework\final\24T_DFF\24T_DFF.net'

.option post =2
.param SUPPLY = 1.1V
.param T = 0.0001n
.temp 125
.global VSS VDD  VPW VNW 
.op



VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0

VIN1 CLK 0 PWL 0 0V 1n 0V  1.01n  1.1V  2.0n 1.1V 2.01n 0V
VIN2 IN  0 PWL 0 0V 1.5n 0V  1.51n  1.1V 

.tran 0.001n 10n
.probe
.end