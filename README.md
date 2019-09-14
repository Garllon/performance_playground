# Peformance Playground

### tr versus gsub
```shell
****** String .tr ******

Total allocated: 40.00 MB
Total retained: 0 B

****** String .gsub ******

Total allocated: 248.00 MB
Total retained: 320.00 B

****** Benchmark ******
            user     system      total        real
.tr     0.145053   0.000020   0.145073 (  0.145072)
.gsub   1.243765   0.020270   1.264035 (  1.264203)
```
