24T-CSFF
* 新24 管 D 触发器仿真文件

*选择 TT, FF, SS三种模式进行仿真
.prot
.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" FF
.unprot

* 测试电路网表
.inc 'D:\VLSI_homework\final\24T_CSFF\TEST_CIRCUIT.net'
* 仿真电路网表
.inc 'D:\VLSI_homework\final\24T_CSFF\24T_CSFF.net'

.option post nomod 
.param SUPPLY = 1.2V
+ T = 0.0001n
+ Wp = '2.3675*Wn'
+ Wn = 1.1e-07
.temp 0
.global VSS VDD  VPW VNW COM1
.op vol


* 公共端
VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0


* 时钟信号为幅值1.1v 周期3ns 占空比50% 保持不变 10MHz
VIN1 CK 0 PULSE 0V 'SUPPLY' 0 0.01n 0.01n 50n 100n
* 输入信号为幅值1.1v 周期8ns 占空比50% 2MHz

.alter static
VIN IN  VSS PULSE 0V 0V 0n 0.1n 0.1n 250n 500n
.MEASURE TRAN 'p_avg' AVG POWER from=0n to=100u 
.tran 0.01n 100u 


.alter dynamic
VIN IN  VSS PULSE 0V 'SUPPLY' 0n 0.1n 0.1n 250n 500n
.MEASURE TRAN 'p_avg' AVG POWER from=0n to=100u 
.tran 0.01n 100u 


.end