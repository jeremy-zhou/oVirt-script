#!/bin/bash

yum -y install openssh-devel elfutils-libelf-devel bc
yum -y groupinstall "development tools"
yum -y install ncurses-devel openssl-devel
scp root@10.231.208.89:/root/linux-4.19.145.tar.xz /root/
scp root@10.231.208.89:/root/NVIDIA-Linux-x86_64-418.66-vgpu-kvm.run /root/
tar xvf linux-4.19.145.tar.xz
cd linux-4.19.145
make menuconfig
make -j30
make modules_install
make install
grub2-set-default 0
reboot
