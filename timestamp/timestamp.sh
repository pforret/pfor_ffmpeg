#!/bin/bash
set -ex
INPUT=../videos/trailer_bw_hd.mp4
OUTPUT=../_output/trailer_bw_hd.timestamped.mp4
FONT="fontfile=../_fonts/droid-sans-mono.ttf:fontsize=20:fontcolor=white:x=w/2:y=h-40"
TEXT="%T"
timecode="19\\:45\\:14"
echo ---------------
avconv -i $INPUT -t 60 -vf "drawtext=$FONT:timecode=$timecode:text=$TEXT" -acodec copy -qscale 1 -y $OUTPUT
sleep 2
ffplay $OUTPUT
