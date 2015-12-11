---
title: "Load Balancing(LB) in HA"
excerpt: "When we want to setup HA, we need to understand how LB works."
---
Lets take a closer look at what a Megdc HA deployment looks like. 
[block:callout]
{
  "type": "warning",
  "body": "where do you want your load balancer to reside. ?\n* It can reside in the Master\n* It can reside externally in a node.",
  "title": "Loadbalancers"
}
[/block]

#LB HA Topology
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/Rqr5kntQQb2zWbVucmK9",
        "megam_ha.png",
        "1218",
        "492",
        "",
        ""
      ]
    }
  ]
}
[/block]

##HA with LB in Master node

Master node runs [HAProxy](http:\\haproxy.org), which manages a single External Virtual IP (VIP) for all front-end nodes and provides HTTP and TCP load balancing of requests going to [OpenNebula](http:\\docs.opennebula.org) & [Megam Oja](doc:megam_oja_gettingstarted). In this mode when the master fails then the requests will not go through the  [HAProxy](http:\\haproxy.org) which mean you need to access  [OpenNebula](http:\\docs.opennebula.org) & [Megam Oja](doc:megam_oja_gettingstarted) using the **Slave’s ip address**.

##HA with external LB external

An external node runs [HAProxy](http:\\haproxy.org), which manages a single External Virtual IP (VIP) for all front-end nodes and provides HTTP and TCP load balancing of requests going to  [OpenNebula](http:\\docs.opennebula.org) & [Megam Oja](doc:megam_oja_gettingstarted). In this mode as the [HAProxy](http:\\haproxy.org) is external to the Master and Slave, [HAProxy](http:\\haproxy.org) will continue to work on a failure to Master or Slave.
[block:callout]
{
  "type": "danger",
  "body": "If both the Master and Slave fails then based on the [Durability of my data](doc:megam_ceph_durability) , the VMs will continue to run. [OpenNebula](http:\\\\docs.opennebula.org) and [Megam Oja](doc:megam_oja_gettingstarted) can’t be accessed.",
  "title": "Master & Slave Failure"
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"megam_whatis_rhinobox\" role=\"button\">Go to the RhinoBox</a><style></style>"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
  "title": "Any questions ? We are here to help."
}
[/block]