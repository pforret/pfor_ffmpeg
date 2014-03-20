#!/bin/bash

# reference: http://www.raspberrypi.org/forum/viewtopic.php?f=43&t=53936

if [ $USER != root ] ; then
	echo "Run this script as root!"
	echo "   sudo $0"
	exit 0
fi

pushd ~/ffmpeg_sources
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure
make
make install
export "PATH=$PATH:$HOME/bin"
popd 

pushd ~/ffmpeg_sources
wget http://download.videolan.org/pub/x264/snapshots/last_x264.tar.bz2
tar xjvf last_x264.tar.bz2
cd x264-snapshot*
./configure --enable-static
make
make install
popd

pushd ~/ffmpeg_sources
wget -O fdk-aac.zip https://github.com/mstorsjo/fdk-aac/zipball/master
unzip fdk-aac.zip
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --disable-shared
make
make install
popd

sudo apt-get install libmp3lame-dev

apt-get install libfaac

if [ ! -f /usr/src/ffmpeg/ffmpeg ] ; then
    # ffmpeg program
 	echo "--- build FFMPEG"
    cd /usr/src/
    #git clone git://source.ffmpeg.org/ffmpeg.git
    git clone https://github.com/FFmpeg/FFmpeg
    cd FFmpeg      
    ./configure --enable-shared --enable-gpl --prefix=/usr --enable-nonfree --enable-libmp3lame --enable-libfaac --enable-libx264 --enable-version3 --disable-mmx
    make
    #make install
else
 	echo "... skip FFMPEG"
fi
