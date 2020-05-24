24T-TGFF
* 经典24 管 D 触发器仿真文件

*选择 TT, FF, SS三种模式进行仿真
.prot
.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" SS
.unprot

* 测试电路网表
.inc 'D:\VLSI_homework\final\24T_TGFF\TEST_CIRCUIT.net'
* 仿真电路网表
.inc 'D:\VLSI_homework\final\24T_TGFF\24T_TGFF.net'

.option post nomod 
.param SUPPLY = 0.5V
+ T = 0.0001n
+ Wp = '2.3675*Wn'
+ Wn = 1.1e-07
.temp 70
.global VSS VDD  VPW VNW COM1
.op vol


* 公共端
VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0

* 时钟信号为幅值1.1v 周期3ns 占空比50% 保持不变
VIN1 CLK 0 PULSE 0V 'SUPPLY' 0 0.01n 0.01n 1.5n 3n
* 输入信号为幅值1.1v 周期8ns 占空比50% 

.alter static
VIN IN  VSS PULSE 0V 0V 2n 0.1n 0.1n 4n 8n
.MEASURE TRAN 'p_avg' AVG POWER from=0n to=200n 
.tran 0.001n 200n 


.alter dynamic
VIN IN  VSS PULSE 0V 'SUPPLY' 2n 0.1n 0.1n 5n 10n
.MEASURE TRAN 'p_avg' AVG POWER from=0n to=200n 
.tran 0.001n 200n 


.end