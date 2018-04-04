@ECHO OFF

REM run example sequence for TimEx
REM Author:     Coenrad Fourie
REM Last mod:  27 December 2017

REM You need in the path: jsim_n, iverilog and vvp

@ECHO ON

TimEx .\mitll_ndo\mitll_ndo.js -d .\definitions\definitions.txt -x

gtkwave tb_mitll_ndo.vcd

