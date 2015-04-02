#!/bin/bash

if grep --quiet '^/dev/sdb1' /etc/fstab; then
  echo "2nd harddisk (/dev/sdb1) would be mounted on reboot; remove from /etc/fstab and reboot"
  sed -i -e 's/^\/dev\/sdb1/#\/dev\/sdb1/' /etc/fstab
  wait 10
  reboot
else
  echo "/dev/sdb1 no longer in fstab; let's make sure it's also not still mounted"
  if grep --quiet '/dev/sdb1' /etc/mtab; then
    wait 10
    reboot
  fi
fi

# build-essential installieren
# VirtualBox vom Oracle incl. Extension-Pack holen

# Netzwerk-Parameter nach Installation
# MAC-Adresse in /etc/sysconfig/networking-scripts/ifcfg-eth0 ersetzen
# Gateway wird nicht in /etc/sysconfig/network eingetragen

# Anschließend: Im Rescoue-System dd if=/dev/sdb of=/dev/sda bs=1M
