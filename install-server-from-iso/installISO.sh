#!/bin/sh

ISOFILE=$1

dd if=/dev/zero of=/dev/sda bs=512 count=1 conv=notrunc
VBoxManage createvm --name "FUEL" --register
VBoxManage modifyvm "FUEL" --ostype RedHat_64 --hwvirtex on --memory 2048 --acpi on --boot1 dvd --nic1 bridged --bridgeadapter1 eth0
VBoxManage modifyvm "FUEL" --longmode on
VBoxManage modifyvm "FUEL" --vrdeproperty VNCPassword=secret  
VBoxManage storagectl "FUEL" --name "IDE Controller" --add ide 
VBoxManage storageattach "FUEL" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $ISOFILE
VBoxManage storagectl "FUEL" --name "SATA Controller" --add sata 
VBoxManage internalcommands createrawvmdk -filename FUEL-physical-sda.vmdk -rawdisk /dev/sda
VBoxManage storageattach "FUEL" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium FUEL-physical-sda.vmdk
VBoxHeadless --startvm FUEL &
