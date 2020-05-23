24T-DFF
* 经典24 管 D 触发器仿真文件

*选择 TT, FF, SS三种模式进行仿真
.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" TT

.option post =2
.param SUPPLY = 1.1V
.param T = 0.0001n
.temp 125
.global VSS VDD  VPW VNW 
.op

*反相器 
.subckt INV  IN VDD VNW VPW VSS OUT

XP1  VDD  IN  OUT   VNW  p11ll_ckt                   W=2.0e-07 L=4e-08
XN1  VSS  IN  OUT    VPW  n11ll_ckt                    W=1.0e-07 L=4e-08

.ends INV

*传输门 PCON是PMOS的栅端，NCON是NMOS的栅端
.subckt TG  IN  VNW VPW  PCON  NCON  OUT

XP2   IN     PCON    OUT    VNW    p11ll_ckt            W=1.7e-07  L=4e-08
XN2  IN     NCON    OUT    VPW    n11ll_ckt            W=1.7e-07 L=4e-08

.ends TG

*时钟信号 CKI 和 CKN
XCLK1 CLK VDD VNW VPW VSS CKN INV
XCLK2 CKN VDD VNW VPW VSS CKI INV

*尝试对传输门控制
XTRA1 IN  VNW VPW  CKI  CKN  OUT TG

VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0

VIN1 CLK 0 PWL 0 0V 1n 0V  1.01n  1.1V  2.0n 1.1V 2.01n 0V
VIN2 IN  0 PWL 0 0V 1.5n 0V  1.51n  1.1V 

.tran 0.001n 10n
.probe
.end