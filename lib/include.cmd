set SOURCEDIR=..\videos

set OUTPUTDIR=..\_output
if not exist %OUTPUTDIR%\. mkdir %OUTPUTDIR%

set FONTDIR=..\_fonts

set THUMBSDIR=thumbs
if not exist %THUMBSDIR%\. mkdir %THUMBSDIR%
set FFTHUMBS=-ss 5 -r 0.1 -frames 5
