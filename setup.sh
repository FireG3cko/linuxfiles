#!/bin/ash

#to be run as root  when I install a new alpine box.

adduser -h /home/fg fg -G users

cp ./repositories /etc/apk/repositories
apk update
apk upgrade

apk add vim
cp ./vimrc ~/.vimrc
apk add neofetch
apk add man man-pages mdocml-apropos less less-doc build-base gcc abuild binutils
apk add python3 python2 py-pip

#glibc compatibility
apk add curl wget
apk --no-cache add ca-certificates wget
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.26-r0/glibc-2.26-r0.apk
apk add glibc-2.26-r0.apk

setup-xorg-base
apk add xf86-input-synaptics
cp ./70-synaptics.conf /etc/X11/xorg.conf.d/

apk add i3wm-gaps i3status i3lock xrandr lxterminal lxappearance
apk add ttf-inconsolata font-noto

apk add alsa-utils alsa-lib xbacklight chromium dmenu feh

adduser root audio
adduser fg audio

cp ./i3status.conf /etc/i3status.conf
cp ./profile /etc/profile

chmod 755 ./usrbin/*
cp ./usrbin/* /usr/bin/

apk add sudo
echo "RUN VISUDO NOW!"
