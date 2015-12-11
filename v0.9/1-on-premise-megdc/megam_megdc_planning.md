---
title: "Planning"
excerpt: "In order to use Megam datacenter management platform (Megdc), deployment architecture of the nodes needs to be planned."
---
In order to get the most out of a Megam datacenter management platform (Megdc), we recommend that you create a plan with the features.
  * Performance
  * Scalability
  * High availability 

This guide provides information to plan a Megdc installation, so you can easily architect your deployment and understand the technologies involved in the management of virtualized resources and their relationship.

#Architecture Overview

We assume that your physical infrastructure adopts a classical cluster-like architecture with a front-end, and a set of hosts where Virtual Machines (VM)/Microservices or unikernel will be executed. 



[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/nA5gNA9SKOByFlNG9pxf",
        "megam_megdc.png",
        "1280",
        "800",
        "#88aca0",
        ""
      ]
    }
  ]
}
[/block]
##Typical setup of your data center are:
[block:parameters]
{
  "data": {
    "0-0": "Master",
    "1-0": "Slave",
    "2-0": "Compute/Storage",
    "0-1": "[Compute](http://opennebula.org), [Storage](http://ceph.com) and [Megam Oja](doc:megam_oja)",
    "1-1": "High availability node for Master",
    "2-1": "[Compute](http://opennebula.org), [Storage](http://ceph.com)"
  },
  "cols": 2,
  "rows": 3
}
[/block]
##System Requirements

Just have a look at the table below for the minimum recommended hardware requirements.
[block:parameters]
{
  "data": {
    "0-0": "Master",
    "1-0": "Compute/Storage",
    "2-0": "Slave",
    "h-1": "CPU (Cores)",
    "h-2": "RAM (GB)",
    "h-3": "HDD (TB)",
    "0-1": "16",
    "1-1": "24",
    "2-1": "16",
    "0-2": "128",
    "1-2": "128",
    "2-2": "128",
    "0-3": "3 disks with 1TB each + 1 disk 160GB SSD",
    "1-3": "3 disks with 1TB each +  1 disk 160GB SSD",
    "2-3": "3 disks with 1TB each + 1 disk 160GB SSD"
  },
  "cols": 4,
  "rows": 3
}
[/block]
There can be only one Master and Slave. The compute/storage is scalable which means you can keep adding on.
[block:callout]
{
  "type": "danger",
  "title": "Linux flavor",
  "body": "We love ubuntu trusty 14.04, hence the Megdc supports the same. We plan to support Debian Jessie, CentOS 7.1 in our next release *1.0*."
}
[/block]

##Topology

The following depicts a 3 Node topology. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/lUepABxBTcezCpzA6ZCY",
        "megam_boxes.png",
        "1280",
        "800",
        "#88aca4",
        ""
      ]
    }
  ]
}
[/block]
###SlimBox
[block:callout]
{
  "type": "info",
  "title": "SlimBox",
  "body": "1 Node minimalist box, good to spin 25-50 VMs"
}
[/block]

The SlimBox is a 1 Node setup which is the minimalist try out configuration to start with. This includes a replicated storage(2 copies) across its HDDs. 

###BeeBox
[block:callout]
{
  "type": "warning",
  "body": "2 Node hungry box, good to spin 50 VMs",
  "title": "BeeBox"
}
[/block]
The BeeBox is a 2-Node medium sized setup that includes a  replicated storage. The BeeBox builds up the SlimBox and adds more Compute/Storage.

###RhinoBox
[block:callout]
{
  "type": "danger",
  "title": "RhinoBox",
  "body": "2 or 3+ Node reliable box, good to spin 100 VMs with high availability"
}
[/block]
RhinoBox can be a 2 or 3+ Node High Availability solution using Ceph and  DRBD.  The SlimBox should be setup first before venturing into RhinoBox. 

DRBD that resides in Master replicates the directory */var* to the Slave. **We will move this to `CephFS` and remove DRBD in the major 1.0 release**.


Glad to see you want to read [How does High Availability work ?](doc:megam_ha_works) 

##Existing Hardware

We currently support [Ubuntu - Trusty](https://insights.ubuntu.com/2014/04/17/whats-new-in-ubuntu-server-14-04-lts/) on an existing infrastructure.  We are working hard to support other operating systems.

[block:parameters]
{
  "data": {
    "h-0": "Next up",
    "h-1": "Questions",
    "0-1": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
    "0-0": "Once you've decided on the SlimBox, BeeBox or RhinoBox) it's time to get it to action. \n\nCheck out the \n[SlimBox - Bootstrapping Master](doc:megam_slimbox_bootstrap) \nto get started."
  },
  "cols": 2,
  "rows": 1
}
[/block]