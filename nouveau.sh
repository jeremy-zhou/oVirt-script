#!/bin/bash

echo "blacklist nouveau " >> /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r).img.bak
dracut -v /boot/initramfs-$(uname -r).img $(uname -r)
cpu cpu-tune.py /usr/libexec/vdsm/hooks/before_vm_start/
reboot
