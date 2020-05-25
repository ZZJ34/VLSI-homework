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
+ T_Setup = Tsu
.temp 25
.global VSS VDD  VPW VNW COM1
.op vol


* 公共端
VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0


VIN1 CK 0 PWL 0n 0V 1n 0V 1.001n 'SUPPLY' 3n 'SUPPLY' 3.001n 0V 10n 0V 10.001n 'SUPPLY' 
VIN2 IN 0 PWL 0n 0V '10ns-T_Setup' 0V '10ns-T_Setup+0.001ns' 'SUPPLY'


.TRAN 0.0001n 30n 
+ START=Tsu   
+ SWEEP Tsu 30ps 40ps 1ps

.probe tran v(in) v(ck) c(q)


.end