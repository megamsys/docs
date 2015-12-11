---
title: "HA Basics"
excerpt: "In order to understand High Availability let us walk thru the basics and terminology"
---
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/7CwSYK0jSOOZPNNrjyWm",
        "megam_ha.png",
        "189",
        "201",
        "#8eabb8",
        ""
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "Stay tuned, as we are moving out of **DRBD** in the 1.0 release.",
  "title": "CephFS  in 1.0"
}
[/block]

#Clusters 

HA clusters are groups of computers that support server applications that can be reliably utilized with a minimum down-time. They operate by harnessing redundant computers in groups or clusters that provide continued service when system components fail.

[DRBD](http://drbd.org) will be used to replicate the shared storage of the master and slave nodes that operate in a cluster.

The most common size for an HA cluster is a two-node cluster, since that is the minimum required to provide redundancy, but many clusters consist of many more, sometimes dozens of nodes.

Such configurations can sometimes be categorized into one of the following models:

##Active/Active
Traffic intended for the failed node is either passed onto an existing node or load balanced across the remaining nodes. This is usually only possible when the nodes use a homogeneous software configuration.

##Active/Passive
Provides a fully redundant instance of each node, which is only brought online when its associated primary node fails. This configuration typically requires the most extra hardware.

##N+1
Provides a single extra node that is brought online to take over the role of the node that has failed. In the case of heterogeneous software configuration on each primary node, the extra node must be universally capable of assuming any of the roles of the primary nodes it is responsible for. This normally refers to clusters that have multiple services running simultaneously; in the single service case, this degenerates to active/passive.

##N+M
In cases where a single cluster is managing many services, having only one dedicated failover node might not offer sufficient redundancy. In such cases, more than one (M) standby servers are included and available. The number of standby servers is a tradeoff between cost and reliability requirements.

##N-to-1
Allows the failover standby node to become the active one temporarily, until the original node can be restored or brought back online, at which point the services or instances must be failed-back to it in order to restore high availability.

##N-to-N
A combination of active/active and N+M clusters, N to N clusters redistribute the services, instances or connections from the failed node among the remaining active nodes, thus eliminating (as with active/active) the need for a ‘standby’ node, but introducing a need for extra capacity on all active nodes.


##Pacemaker
Pacemaker was born out of the Linux-HA project as an advanced resource manager that could use heartbeat for cluster membership and communication.

##Heartbeat
Heartbeat is a daemon that provides cluster infrastructure (communication and membership) services to its clients. This allows clients to know about the presence (or disappearance!) of peer processes on other machines and to easily exchange messages with them. In order to be useful to users, the Heartbeat daemon needs to be combined with a cluster resource manager (CRM) which has the task of starting and stopping the services (IP addresses, web servers, etc.) that cluster will make highly available. We will use pacemaker as this is the preferred cluster resource manager for clusters based on Heartbeat.

##DRBD
[Distributed Replicating Block Device](http://drbd.org), is a technology that takes raw storage from two nodes and keeps their data synchronized in real time. It is sometimes described as “network RAID Level 1”.

DRBD is, fundamentally, a raw block device.
[block:parameters]
{
  "data": {
    "0-0": "Node 1",
    "1-0": "Node2",
    "0-1": "/dev/sda1",
    "0-2": "/dev/drbd0",
    "1-1": "/dev/sda1",
    "1-2": "/dev/drbd0",
    "0-3": "20GB",
    "1-3": "20GB"
  },
  "cols": 4,
  "rows": 2
}
[/block]

/dev/drbd0 will always be the same size on both nodes, unmounted. If you write something to node 1, it’s instantly available on node 2, and vice versa. 
[block:callout]
{
  "type": "danger",
  "body": "As DRBD has a limitation on nodes scaling in pairs, we will move to *CephFS* in our *1.0* release.",
  "title": "DRBD Limitation"
}
[/block]

#Get Ready to Deploy

Production environments which require high availability involves several architectural requirements. Specifically you will need at least  2 or 3 nodes, and certain components will be deployed in multiple nodes to prevent single points of failure.

We’ll take a closer look at the various option of the deployment in [Load Balancing in HA](doc:megam_ha_lb_choices) 

This approach can be used on any manufacturer’s hardware, provided it meets the minimum requirements listed in the [Planning](doc:megam_megdc_planning) 

We want to make sure that our Megdc HA stack works on as many systems as possible and will be happy to help out. 

Of course, all Megdc[code is open source](https://github.com/megamsys/megdc.git), so contributions are always welcome, too!
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"megam_ha_lb_choices\" role=\"button\">Go to the load balancing guide</a>\n<style>\n\n</style>"
}
[/block]