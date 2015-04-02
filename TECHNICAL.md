# What is the technical challenge?

## In general

* Do not run a DHCP server in a foreign data center (!!!)
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

### VirtualBox

#### Bootstrap phase

* Boot the system into any Linux which has pxe-kexec available
* pxe-kexec 10.20.0.2 => bootstrap eingeben

Changes:

* agent wg. eth9, muss in initramfs of bootstrap
* aus dem Container nailgun mit scp rueberkopieren, 2-3 minuten wait

* Konfiguration in FUEL machen und deployen
* Reboot bootet wieder in das erste System, nicht in die OS-Installation
* pxe-kexec 10.20.0.2 => linux eingeben

## Änderungen

* initramfs bootstrap:
** ??? 
(kexec klappt nicht mit CentOS!)

* Puppet bricht ab

Lösung: http://blog.oddbit.com/2014/05/23/solved-open-vswitch-and-persis/

## Hints

### Puppet run to install OpenStack onto the finally installed OS

#### Update local copy of manifests: 
  https://github.com/stackforge/fuel-library/blob/835c0eff6eeaa740e016d9dfaf041f592cc5b379/deployment/puppet/puppet/manifests/pull.pp

Original manifests are located in fuel-core-6.0-rsync in /etc/puppet.

#### Run again (in foreground)

 puppet apply --verbose --debug --trace /etc/puppet/manifests/site.pp
 
### Reset FUEL Master 

Inside nailgun container:

  698  cd fuel-web/nailgun/
  699  python manage.py dropdb
  700  python manage.py syncdb
  701  python manage.py loaddefault
