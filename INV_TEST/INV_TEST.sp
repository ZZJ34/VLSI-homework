INV_TEST
* 反相器测试

*选择 TT, FF, SS三种模式进行仿真
.lib 'F:\synopsys\library_40\l0040ll_v1p4_1r.lib' TT
.inc 'D:\VLSI_homework\final\INV_TEST\TEST_CIRCUIT.net'


.option post 
.param SUPPLY = 1.1V
+ T = 0.0001n
.temp 25
.global VSS VDD  VPW VNW 
.op vol

*反相器 
.subckt INV  IN VDD VNW VPW VSS OUT

XP1  VDD  IN  OUT    VNW  p11ll_ckt                   W=2.3675e-07 L=4e-08
XN1  VSS  IN  OUT    VPW  n11ll_ckt                    W=1.0e-07 L=4e-08

.ends INV

XINV  TEST_IN VDD VNW VPW VSS OUT INV

VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0


VIN IN  0 PULSE 0V 1.1V 2n 0.1n 0.1n 5n 10n

.MEASURE TRAN 'riset' TRIG v(OUT) val=0.11V RISE=1 
+                                  targ v(OUT) val=0.99V rise=1 

.MEASURE TRAN 'fallt' TRIG v(OUT) val=0.99V fall=1 
+                                  targ v(OUT) val=0.11V fall=1

*.MEASURE TRAN 'p_avg' AVG POWER from=0n to=100n

.tran 0.001n 25n SWEEP TEMP -10 100 10
*.tran 0.001n 200n 



*.alter SS_static
*.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" SS
*.MEASURE TRAN 'p_avg' AVG POWER from=0n to=200n 
*.tran 0.001n 200n 
*VIN IN  VSS PULSE 0V 0V 2n 0.1n 0.1n 4n 8n

*.alter SS_dynamic
*.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" SS
*.MEASURE TRAN 'p_avg' AVG POWER from=0n to=200n 
*.tran 0.001n 200n 
*VIN IN  VSS PULSE 0V 1.1V 2n 0.1n 0.1n 4n 8n

*.alter FF
*.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" FF
*.MEASURE TRAN 'p_avg' AVG POWER from=0n to=200n 

*.alter TT
*.lib "F:\synopsys\library_40\l0040ll_v1p4_1r.lib" TT
*.MEASURE TRAN 'p_avg' AVG POWER from=0n to=200n 

.end