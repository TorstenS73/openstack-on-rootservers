# openstack-on-rootservers
Installaing and running OpenStack on so-called "root servers" using the FUEL installer

This project is work in progress; check back frequently or even better, get in touch if you want to help.
The current state of the project is available on request in a personal conversation so far.

= What are OpenStack and the FUEL installer? =

OpenStack is an open source cloud computing software, see: http://www.openstack.org/

The FUEL installer is some kind of packaged infrastructure which makes intalling OpenStack easier than it would be otherwise.

= What are root servers? =

Don't get confused with the root zone DNS severs; wrong subject.

We're talking about servers which are rented out in a datacenter, typcially in a one-by-one fashion. One popular company known for that kind of offering is Germany based Hetzner, so give an example.

They are called "root server" because you, the customer who rents the server, will receive a root login to the OS on that box.

A root server is a phyical piece of server hardware. If it's not, then it's usually called a VPS or even a cloud instance. In case you want to rent VPSs or cloud instances, you will have no use for what we are developing here. Also if you have phyical access to your server rack and control over the LAN infrastructure in your rack, you will not need this project.
