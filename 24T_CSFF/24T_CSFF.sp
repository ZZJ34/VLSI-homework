24T-CSFF
* 新24 管 D 触发器仿真文件

*选择 TT, FF, SS三种模式进行仿真
.prot
.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" TT
.unprot

* 测试电路网表
.inc 'D:\VLSI_homework\final\24T_CSFF\TEST_CIRCUIT.net'
* 仿真电路网表
.inc 'D:\VLSI_homework\final\24T_CSFF\24T_CSFF.net'

.option post nomod 
.param SUPPLY = 1.1V
+ T = 0.0001n
+ Wp = '2.3675*Wn'
+ Wn = 1.1e-07
.temp 100
.global VSS VDD  VPW VNW COM1
.op vol


* 公共端
VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0

* 时钟信号为幅值1.1v 周期3ns 占空比50% 
VIN1 CK VSS PULSE 0V 1.1V 0 0.01n 0.01n 1.5n 3n
* 输入信号为幅值1.1v 周期8ns 占空比50% 
VIN2 IN  0 PULSE 0V 1.1V 2.5n 0.01n 0.01n 4n 8n


.tran 0.001n 60n
.probe
.end