@echo off
setlocal

set SRC=../videos/FoscamIR_test.mp4

set CURVES=curves=r='0.45/0 0.55/1':g='.25/1 .75/1 .9/0 1/1':b='0/1 .3/0 .9/0 1/1'

ffplay %SRC% -vf "histeq,%CURVES%"