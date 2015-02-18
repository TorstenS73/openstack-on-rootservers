# What is the technical challenge?

## In general

* IP Address space
* Replace DHCP with pxe-kexec
* Number of physical interfaces on machines

## Hetzner

* MAC-Adresses
* NICs

## Notes

1. tftpboot is way too slow over public network
 
=> enable FTP besides TFTP on FUEL master
needs to be done in cobbler + applicable port forwarding

## OT

* docker-enter: https://github.com/jpetazzo/nsenter
 
## Parking

Some untagged networks are assigned to the same physical interface. You should assign them to different physical interfaces. Affected:
"admin (PXE)", "public" networks at node "Untitled (37:f5)"

=> Fehler wenn nur eine Netzwerkkarte da ist

Umgehung ... ??? änderung am Agent => "virtuelle" eth9

## Walkthrough

## Änderungen

* initramfs bootstrap:
** ??? 
(kexec klappt nicht mit CentOS!)

* Puppet bricht ab

Lösung: http://blog.oddbit.com/2014/05/23/solved-open-vswitch-and-persis/
