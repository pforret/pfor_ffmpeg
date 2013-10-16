@echo off
setlocal

set SRC=../videos/infrared_bw_sd.mp4

::
set CURVES=curves=r='0.4/0 0.6/1':g='.25/1 .75/.5 .9/0 1/1':b='0/1 .25/0 .75/0 1/1'


:: start both windows next to each other so you can compare
start ffplay %SRC%
start ffplay %SRC% -vf "histeq,%CURVES%"
