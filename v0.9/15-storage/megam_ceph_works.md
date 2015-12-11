---
title: "How does Ceph work ?"
excerpt: ""
---
Megdc provides ability to setup private cloud storage in minutes with a single click. We currently support Ceph as the storage provider.

#Ceph

A distributed object store and file system designed to provide excellent performance, reliability and scalability. The power of Ceph can transform your organization’s IT infrastructure and your ability to manage vast amounts of data. Ceph’s foundation is the Reliable Autonomic Distributed Object Store (RADOS), which provides your applications with object, block, and file system storage in a single unified storage cluster.
[block:callout]
{
  "type": "info",
  "title": "Ceph Storage Cluster comprises of",
  "body": "* Ceph Monitor\n* At least two Ceph OSD Daemons to achieve an active + clean state when the cluster makes two copies of your data.\n* Ceph Metadata Server"
}
[/block]
##What is an OSD

A Ceph OSD stores data, handles data replication, recovery, backfilling, rebalancing, and provides monitoring information to Ceph Monitors by checking other Ceph OSDs for a heartbeat. Ceph OSDs run the RADOS service, calculate data placement with CRUSH, replicate data, and maintain their own copy of the cluster map

##What is a Monitor

A Ceph Monitor maintains maps of the cluster state, including the monitor map, the OSD map, the Placement Group (PG) map, and the CRUSH map.

Ceph maintains a history (called an “epoch”) of each state change in the Ceph Monitors, Ceph OSD Daemons, and PGs.

##What is MDS

A Ceph Metadata Server (MDS) stores metadata on behalf of the Ceph Filesystem. Ceph MDS dynamically redistribute their load, which is CPU intensive.

Ceph Metadata Servers make it feasible for POSIX file system users to execute basic commands like ls, find, etc. without placing an enormous burden on the Ceph Storage Cluster.

##What is a Placement Group(PG)

Ceph cluster links objects  to PG . These PG containing objects are spread across multiple OSD and improves reliability.

##What is an Object

Object is the smallest unit of data storage in ceph cluster , Each & Everything is stored in the form of objects , thats why ceph cluster is also known as Object Storage Cluster. Objects are mapped to PG , and these Objects / their copies always spreaded on different OSD.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"http://ceph.com/docs/master/architecture/\" role=\"button\" target=\"_blank\">Go to the ceph guide</a>\n<style>\n\n</style>"
}
[/block]
#What do we need ?

The recommended prerequisites for planning a private cloud storage based on ceph are as outlined below.

##Network

  * 1Gb network since the OSDs will have a traffic throughput of 100MB/second.
  * Minimum of two NICs for a public and a cluster network.
   
##CPU

  * MDS requires quad core or better.
  * OSD requires dual core or better.
  * Monitors simply maintain a master copy of the cluster map, and hence are not CPU intensive.

##RAM
  * Ceph MDS and Monitors must be capable of serving their data quickly hence need 1GB per daemon.
  * OSDs are not memory intensive hence require 500MB per daemon during regular operations, whereas during data recovery they will require ~1GB per 1TB of storage per OSD.


##Hard Disk (HDD)
  * Simultaneous OS/read write operations from multiple OSDs against a single drive can slow performance. Hence we use a single HDD that is mapped to an OSD
  * There are significant cost and performance trade offs to consider when planning for data storage. 


[block:parameters]
{
  "data": {
    "0-0": "1TB",
    "1-0": "3TB",
    "0-1": "~$75",
    "1-1": "~$150",
    "0-2": "$0.07/GB",
    "0-3": "The cost per GB is 40% higher than 3TB",
    "1-3": "Ceph OSD needs more RAM",
    "1-2": "$0.05/GB"
  },
  "cols": 4,
  "rows": 2
}
[/block]
We recommend SSDs which cost 10x more per GB but exhibit 100x faster access times.
[block:callout]
{
  "type": "danger",
  "title": "Filesystem",
  "body": "* btrfs is not stable enough for production, but it has the ability to journal and write data simultaneously, whereas xfs and ext4 do not.\n* We use ext4 filesystem."
}
[/block]
Ok, got it, lets get cracking to see [How to setup a SlimBox](doc:megam_whatis_slimbox) 
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"megam_ceph_usage\" role=\"button\">Go to the ceph usage guide</a>\n<style>\n\n</style>"
}
[/block]