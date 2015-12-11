---
title: "Intro Megdc"
excerpt: "Below, you'll find all the information you need to get going with Megam data center management platform (Megdc)"
---
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/6RSfOpVtSp66WZC5c8HP",
        "megam_cib.png",
        "174",
        "175",
        "#616f82",
        ""
      ]
    }
  ]
}
[/block]
Megdc is an open source software that automates building, installing and managing private cloud quickly. You've reached our documentation — where you learn how to build data center  in minutes.

We want to talk about two important aspects namely *Cloud storage*, and HA.

##Cloud storage
Megdc uses replicated storage <a href="http://ceph.com" target="_blank">Ceph</a>. Ceph is a distributed object store and file system designed to provide excellent performance, reliability and scalability. In the simple setup ceph uses one monitor-demon and two `OSD`s(Two drives named with partitions `/storage1` and  `/storage2`). This ceph storage is attached with opennebula datastore, so that opennebula VMs can use this storage. If you want more storage, you can add more servers using the Megdc tool.

## HA
Megdc has High-Availability feature. If your base software system is down, you can use your ha-node still. We are reworking this feature with `Ceph FS` to scale beyond 1-1. 

## Adding compute/storage nodes is a breeze
Its just a plug and play of new nodes in your data center using Megdc.


[block:parameters]
{
  "data": {
    "0-0": "Have you implemented a private cloud before <a href=\"http://opennebula.org\" target=\"_blank\">OpenNebula</a>  -  <a href=\"http://openstack.org\" target=\"_blank\">OpenStack</a> -  <a href=\"https://code.google.com/p/ganeti/\" target=\"_blank\">Ganeti</a> ? Confident in your infrastructure management skills? \n\n~ *Implement your datacenter in less than 10 minutes.*",
    "h-0": "Get started. Ok.."
  },
  "cols": 1,
  "rows": 1
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"http://docs.megam.io/docs/megam_megdc_planning\" role=\"button\" target=\"_blank\">Go to the planning datacenter</a><style></style>"
}
[/block]

The terminology which you need to be familiar are.

##Nodes
The physical hardware servers which hosts the virtual machines, containers and storage.

##Master/Slave
This describes a pair of nodes that work together to power highly-available servers. The first node is called Master.

##Compute/Storage
Compute servers are the workhorses of your installation; they’re the servers on which your virtual machines, micro services and storage are created. 

#3 fundamental choices for Megdc
[block:parameters]
{
  "data": {
    "0-0": "**SlimBox**",
    "1-0": "**BeeBox**",
    "2-0": "**RhinoBox**",
    "2-1": "Rock solid reliable 2 or 3 Node with built in High Availability and fault tolerance.\n[What is RhinoBox ?](doc:megam_whatis_rhinobox)",
    "1-1": "Just like a bee this box will work for you. 2 Nodes. \n[What is BeeBox ?](doc:megam_whatis_beebox)",
    "0-1": "Just simple to start. 1 Node private cloud with cloud management built-in. \n[What is SlimBox ?](doc:megam_whatis_slimbox)",
    "0-2": "Spins 25-50 apps/services at ease",
    "1-2": "Spins 50-75 apps/services at ease",
    "2-2": "Rock solid 75-100 apps/services  with no downtime."
  },
  "cols": 3,
  "rows": 3
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "Get Started",
  "body": "We would love to see you try it. First let us [plan](doc:megam_megdc_planning) the installation."
}
[/block]
##Storage 
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/5MsTGkv1SYa4tsKmqKzJ",
        "megam_storage.png",
        "245",
        "240",
        "#5d6f7a",
        ""
      ]
    }
  ]
}
[/block]
We've written a storage guide implemented using [ceph](http://ceph.com). This guide contains information about [ceph](http://ceph.com)  and will walk you through storage concepts implemented in Megdc
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"http://docs.megam.io/docs/megam_ceph_works\" role=\"button\" target=\"_blank\">Go to the storage</a>\n<style>\n\n</style>"
}
[/block]
##High Availability
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/riPnVXTWQdqyzGVae9G0",
        "megam_disasterrecovery.png",
        "234",
        "253",
        "#5f737e",
        ""
      ]
    }
  ]
}
[/block]
We've written a high availability guide using ceph and [drbd](http://drbd.org). This guide contains information about [ceph](http://ceph.com)   and [drbd](http://drbd.org) and will walk you through high availability concepts in Megdc.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"http://docs.megam.io/docs/megam_ha_works\" role=\"button\" target=\"_blank\">Go to the HA</a><style></style>"
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Any questions? We're always here to help",
  "body": "We hang around in our [public slack room](https://megamioteam.slack.com/messages/support/).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs."
}
[/block]