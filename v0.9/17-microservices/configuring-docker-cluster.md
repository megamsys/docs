---
title: "Installation"
excerpt: "Optional, if you need containers then add it in here."
---
[block:api-header]
{
  "type": "basic",
  "title": "Docker on baremetal"
}
[/block]
Fundamentally if you need to launch docker on bare metal in your server then here are the pre requisite. 

[block:parameters]
{
  "data": {
    "h-0": "Prerequisites",
    "0-0": "You require atleast one <b>swarm master</b>    and lots of <b>node(s)</b>.",
    "1-0": "The nodes must have our package **megamdocker** installed with openvswitch configured.",
    "2-0": "The openvswitch bridge needs to configured in each of the hosts."
  },
  "cols": 1,
  "rows": 3
}
[/block]
#Deployment view
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/vdzym6DrRaSP1JBOiobS",
        "Baremetal Docker.png",
        "720",
        "540",
        "#432977",
        ""
      ]
    }
  ]
}
[/block]
##Ubuntu

###Megam swarm
[block:callout]
{
  "type": "info",
  "title": "Setting up a  docker cluster is easy with swarm",
  "body": "Megam Oja helps you setup multiple hosts to cluster and launch bare metal docker containers at ease."
}
[/block]
#### 1 Now, on your master which is soon going to be swarm master, install `megamswarm`.
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-add-repository \"deb [arch=amd64] http://get.megam.io/0.9/ubuntu/14.04/ trusty testing\"\n\nsudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7\n\nsudo apt-get update",
      "language": "shell"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "sudo apt-get install megamswarm ",
      "language": "shell"
    }
  ]
}
[/block]
Now upon completion, swarm master is up and running.

### 2 Let us now prepare your node(s).

This has to be repeated in all the baremetal nodes. 
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-get install linux-image-generic-lts-trusty\n\nwget -qO- https://experimental.docker.com/ | sh\n\nsudo apt-get install megamcommon megamdocker",
      "language": "shell"
    }
  ]
}
[/block]
When the agent `megamdocker` install  completes the following will be available.
- *openvswitch* installed with a default bridge name : `megdock`
[block:code]
{
  "codes": [
    {
      "code": "# check if a ovs bridge by name megdock exists\nsudo ovs-vsctl show\nfb5c31c5-9e35-4c6c-a406-6263773d9864\n    Manager \"ptcp:6640\"\n    Bridge megdock     \n       Port megdock\n            Interface ,megdock\n                type: internal\n    ovs_version: \"2.0.2\"",
      "language": "shell"
    }
  ]
}
[/block]
-  docker is running in detached mode
- `gulpd`, the docker node agent is running.
[block:callout]
{
  "type": "danger",
  "title": "Openvswitch configuration",
  "body": "You will have to configure the physical ethernet ports (eg : eth0, eth1) to the bridge.  This is beyond the scope of this document, feel free to use your own mechanism."
}
[/block]
Let us add physical ports eth0, eth1 to megdock bridge.
[block:code]
{
  "codes": [
    {
      "code": "ovs-vsctl add-port megdock eth0\novs-vsctl add-port megdock eth1",
      "language": "shell"
    }
  ]
}
[/block]
 sample **/etc/network/interfaces** file is shown below.
[block:code]
{
  "codes": [
    {
      "code": "#Configure your /etc/network/interfaces\n$ cat /etc/network/interfaces\n# This file describes the network interfaces available on your system\n# and how to activate them. For more information, see interfaces(5).\n\nauto lo eth0 eth1 megdock\niface lo inet loopback\n\n# The primary network interface\niface eth0 inet static\n  address 192.168.1.106\n  netmask 255.255.252.0\n  broadcast 192.168.3.255\n  gateway 192.168.1.1\n  dns-nameservers 8.8.8.8 8.8.4.4\n\niface eth1 inet static\n address 192.168.1.100\n  netmask 255.255.252.0\n  broadcast 192.168.3.255\n  gateway 192.168.1.1\n\ndns-nameservers 8.8.8.8 8.8.4.4",
      "language": "shell"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "sudo ovs-vsctl show\nfb5c31c5-9e35-4c6c-a406-6263773d9864\n    Manager \"ptcp:6640\"\n    Bridge megdock        \n        Port \"eth0\"\n            Interface \"eth0\"\n        Port \"eth1\"\n            Interface \"eth1\"\n       Port megdock\n            Interface ,megdock\n                type: internal\n    ovs_version: \"2.0.2\"",
      "language": "shell"
    }
  ]
}
[/block]
### 3 We need a token to join the nodes to the swarm master.

On your swarm master, open
[block:code]
{
  "codes": [
    {
      "code": "nano /var/lib/megam/megamswarm/env.sh",
      "language": "shell"
    }
  ]
}
[/block]
You should find this line
[block:code]
{
  "codes": [
    {
      "code": " initctl set-env MEGAM_BMDK_CLUSTERID=54c729c18d379721c9483c07e071b7e9",
      "language": "text"
    }
  ]
}
[/block]

### 4 Copy the CLUSTERID to join nodes to swarm master.

Now, join the  node to swarm master.

Paste the token and execute the below command on the master to join node to master
[block:code]
{
  "codes": [
    {
      "code": "swarm join --addr=<node_ip>:2375 token://54c729c18d379721c9483c07e071b7e9",
      "language": "shell"
    }
  ]
}
[/block]
Hopefully you have configured our engine `megamd`, if not this is needed for the launch
[block:code]
{
  "codes": [
    {
      "code": "nano /usr/share/megam/megamd/megamd.conf\n\nswarm:\n   host: http://<swarm_master_ip>:2375",
      "language": "text"
    }
  ]
}
[/block]
Voila! Go ahead and launch multiple docker containers through megam platform.