# openstack-on-rootservers
Installaing and running OpenStack on so-called "root servers" using the FUEL installer

This project is work in progress; check back frequently or even better, get in touch if you want to help.
The current state of the project is available on request in a personal conversation so far.

# Introduction

## What are OpenStack and the FUEL installer? =

OpenStack is an open source cloud computing software, see: http://www.openstack.org/

The FUEL installer is some kind of packaged infrastructure which makes intalling OpenStack easier than it would be otherwise.

## What are root servers? (sometimes also called Dedicated Servers)

Don't get confused with the root zone DNS severs; wrong subject.

We're talking about servers which are rented out in a datacenter, typcially in a one-by-one fashion. One popular company known for that kind of offering is e.g. Germany based Hetzner for example: http://www.hetzner.de/ot/hosting/produktmatrix/rootserver

They are called "root server" because you, the customer who rents the server, will receive a root login to the OS on that box.

A root server is a phyical piece of server hardware. If it's not, then it's usually called a VPS or even a cloud instance. In case you want to rent VPSs or cloud instances, you will have no use for what we are developing here. Also if you have phyical access to your server rack and control over the LAN infrastructure in your rack, you will not need this project.

# Why would I run OpenStack on top of Root Servers?

1. Because it will safe you money.
2. Because it will provide you with a good compromise between control over your environment and purchasing as well as operational cost.

## Alternatives to running OpenStack on Root Servers

Assuming 

* you want cloud computing 
* you prefer free software over proprietary
* and you will need to run a total of 3-5 up to some dozend physical servers with some dozends to some hundreds of cloud guest instances
 
there are still a number of alternatives how you can run a small to medium data center for your organization. Let's compare them.

### Buy and host your own hardware

You can of course setup a rack on your premises, buy server and network switch hardware, plug things together and run your private cloud. In case you need your cloud services to be accessible from the Internet, you will have to make sure to get a decent line from you ISP, but in times where consumers are offered Gbit/s in some cities already and 100 MBit/s are nothing special, this shouldn't be seriously limiting you.

This means quite some upfront investment in hardware. The math is on you; use your favourite online shop for server hardware and do the maths. Also - depending on where your premises are - do not underestimate the cost of electricity. There is a reason why large datacenter providers build their premises where cheap electricity is avaliable.

### Buy your own hardware and rent a rack

Many datacenter providers will offer you so-called co-location. That means you will rent one or more racks on their floor. They will usually provide you with eletricity and Internet connectivity, but it's entirely up to you what devices you will put into your rack and how you wire them. There will usually be one upling port to their network which connects your rack(s) there to the outside world. You can have (and you will need) physical access to their premises, so geography limits your choices.

The investment into hardware remains the same. They will usually be able to supply electricity and Internet upling cheaper and more reliable then you are at your own premises. Also if you're looking at uplinks in the n GBit/s range (with n >> 1) this is basically your only realistic choice.

### Buy capacity from any cloud provider

Of course there are data center providers happily hosting OpenStack for you and selling you just as much of it as you need. You will find links to them on the OpenStack website.

This is by far the easiest way to get started. All it takes is a credit card and they will have you up and running in minutes.

