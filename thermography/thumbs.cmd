@echo off
setlocal

call ..\lib\include.cmd

set SRC=%SOURCEDIR%/infrared_bw_sd.mp4
set DST=%THUMBSDIR%/thermo_%%03d.png

::
set CURVES_STRICT=curves=r='0.49/0 0.51/1':g='.24/0 .25/1 .75/1 .76/0 .99/0 1/1':b='0/1 .24/1 .25/0 .99/0 1/1'
set CURVES_MEDIUM=curves=r='0.4/0 0.6/1':g='.25/1 .75/.5 .9/0 1/1':b='0/1 .25/0 .75/0 1/1'
set CURVES_SMOOTH=curves=r='0.25/0 0.75/1':g='.25/1 .75/.5 .9/0 1/1':b='0/1 .75/0 1/1'


:: start both windows next to each other so you can compare
(
ffmpeg -i %SRC%  -vf "histeq,%CURVES_STRICT%" %FFTHUMBS% -y %THUMBSDIR%/thermo1_%%03d.png
ffmpeg -i %SRC%  -vf "histeq,%CURVES_MEDIUM%" %FFTHUMBS% -y %THUMBSDIR%/thermo2_%%03d.png
ffmpeg -i %SRC%  -vf "histeq,%CURVES_SMOOTH%" %FFTHUMBS% -y %THUMBSDIR%/thermo3_%%03d.png
)