# VLSI-homework

## 文件目录说明
```
./library/ 仿真使用的 40nm CMOS 工艺的库文件 
```

```
./文献/ 大作业涉及到的两篇参考文献 
```

```
./INV_TEST/ 测试内容，利用一个反向器的电路网表测试一些语法
```

仿真运算会生成很多的相关数据文件，方便起见，在不同的文件夹中进行不同指标的测试

**注：对于pvt_1，需要几个时钟跳变消除初始不确定状态**

```
./24T_CSFF/ CSFF 的相关文件
./24T_CSFF/Power_Consumption/  CSFF 功耗测量（四种PVT条件，参考大作业设置）
./24T_CSFF/Time_Hold/          CSFF 保持时间测量
./24T_CSFF/Time_Setup/         CSFF 建立时间测量
```
```
./24T_TGFF/ TGFF 的相关文件
./24T_TGFF/Power_Consumption/  TGFF 功耗测量（四种PVT条件，参考大作业设置）
./24T_TGFF/Time_Hold/          TGFF 保持时间测量
./24T_TGFF/Time_Setup/         TGFF 建立时间测量
```