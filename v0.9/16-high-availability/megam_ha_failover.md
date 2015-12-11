---
title: "Failover"
excerpt: ""
---
#State

What is the state that is needed to recoup when a failure happens ? To find this we start by looking at the software that is installed in the Master.

##1. [OpenNebula](http:\\docs.opennebula.org) & [Megam Oja](doc:megam_cloudmanagement_intro)

These are connected by API(HTTP), RPC and AMQP-based messages. 

Stateless [OpenNebula](http:\\docs.opennebula.org) & [Megam Oja](doc:megam_oja_gettingstarted)  is implemented through the load balancing using [HAProxy](http://haproxy.org). 

Stateful replication happens using [drbd](http:\\drbd.org) on the directory */var*

We are moving to **CephFS**  in 1.0.

##2. Virtual Machines
The VMs that run in the host has a storage where their state is persisted. The storage of the VMs are redundant and abide by the principles [Durability of my data](doc:megam_ceph_durability). We store one extra copy that can reside in any of the other hosts OSD. 
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"megam_ceph_works\" role=\"button\">Go to the storage</a>\n<style>\n\n</style>"
}
[/block]

[block:callout]
{
  "type": "success",
  "body": "The replication of the fail over state is handled by DRBD. The replication state is in */var* directory in Master. We are moving to CephFS in **1.0**\n\nLearn [What is RhinoBox ?](doc:megam_whatis_rhinobox)",
  "title": "How do we replicate ?"
}
[/block]
##What happens with LB in Master

When an end user accesses the [OpenNebula](http:\\docs.opennebula.org) sunstone or [Megam Oja](doc:megam_oja_gettingstarted) nilavu the  the connection gets handled by [HAProxy](http:\\haproxy.org) in Master and sends it to the [sunstone](http:\\docs.opennebula.org) or [nilavu](https://github.com/megamsys/nilavu.git) in the Master or Slave.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/8bqaKA6LR8uUTEU4FHom",
        "CIB HA (3).png",
        "960",
        "720",
        "#a16dfb",
        ""
      ]
    }
  ]
}
[/block]
##What happens with LB external to Master

When an end user accesses the [OpenNebula](http:\\docs.opennebula.org) sunstone or [Megam Oja](doc:megam_oja_gettingstarted) nilavu the  the connection gets handled by [HAProxy](http:\\haproxy.org) residing external and sends it to the [sunstone](http:\\docs.opennebula.org) or [nilavu](https://github.com/megamsys/nilavu.git) in the Master or Slave.
[block:callout]
{
  "type": "warning",
  "title": "Manual HAProxy Install",
  "body": "As a separate HAProxy node is installed to support [HAProxy](http://haproxy.org), this is a manual step."
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/YOEmUMx8TQSEXqn2KEgS",
        "CIB HA with Storage (1).png",
        "960",
        "720",
        "#17b562",
        ""
      ]
    }
  ]
}
[/block]
#Dead ? 

What is dead ? 

  * Master is Dead.
  * Slave is Dead.
  * Compute/Storage is Dead.  * 

No matter what the situation is [RhinoBox ](doc:megam_whatis_rhinobox) provides a situation for your app/service to be alive. 

* [OpenNebula](http:\\docs.opennebula.org) & [Megam Oja](doc:megam_oja_gettingstarted)  continue to run and are live.

* [sunstone](http:\\docs.opennebula.org) & [nilavu](https://github.com/megamsys/nilavu.git)  can be accessed using an ip address based on where the [HAProxy](http://haproxy.org) resides

*  The VMs that run in the host are automatically moved to another Host. The storage of the VMs are redundant and abide by the principles [Durability of my data](doc:megam_ceph_durability). We store one extra copy that can reside in any of the other hosts OSD. 
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"megam_configure_megdc\" role=\"button\" target=\"_blank\">Go to the configure megdc</a>\n<style>\n\n</style>"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "We hang around in our [public slack room](https://megamioteam.slack.com/messages/support/).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
  "title": "Any questions? We're always here to help"
}
[/block]