::@echo off
call ..\lib\include.cmd
set INPUT=%SOURCEDIR%\trailer_bw_hd.mp4
set OUTPUT=%OUTPUTDIR%\trailer_bw_hd.timestamped.mp4
set FONT="fontfile=../_fonts/norwester.ttf:fontsize=40:fontcolor=white@0.8: x=(w-text_w)/2:y=(h-text_h-line_h)/4"
set TEXT='%%{localtime:%%a %%b %%d %%Y}'
set TEXT="**TEXT**"

ffmpeg -i %INPUT% -t 15 -vf drawtext=%FONT%:text=%TEXT% -acodec copy -vcodec libx264 -preset fast -b:v 500000 -crf 34 -threads 0 %OUTPUT%
pause
ffplay %OUTPUT%
