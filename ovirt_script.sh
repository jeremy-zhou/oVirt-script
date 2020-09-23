#!/bin/bash

./NVIDIA-Linux-x86_64-418.66-vgpu-kvm.run --uninstall
cp -f ./cpu-tune.py /usr/libexec/vdsm/hooks/before_vm_start/
yum -y install openssh-devel elfutils-libelf-devel bc
yum -y groupinstall "development tools"
yum -y install ncurses-devel openssl-devel
tar xvf linux-4.19.145.tar.xz
cd linux-4.19.145
make menuconfig
make -j30
make modules_install
make install
grub2-set-default 0
reboot
