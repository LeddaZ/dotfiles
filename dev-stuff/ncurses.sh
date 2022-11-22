#!/bin/bash
 
wget "https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.3.tar.gz"
tar -xvf ncurses-6.3.tar.gz
cd ncurses-6.3
 
# args taken from `https://src.fedoraproject.org/rpms/ncurses/blob/f36/f/STAGE2-ncurses`
./configure --prefix=/usr/local \
    --with-shared --without-ada --with-ospeed=unsigned \
    --with-terminfo-dirs=/etc/terminfo:/usr/share/terminfo \
    --enable-hard-tabs --enable-xmc-glitch --enable-colorfgbg \
    --enable-overwrite \
    --enable-pc-files \
    --disable-wattr-macros \
    --with-termlib=tinfo \
    --with-chtype=long \
    --with-ticlib \
    --with-abi-version=5 # ABI version 5 produces `libncurses.so.5`
 
make
sudo make install
