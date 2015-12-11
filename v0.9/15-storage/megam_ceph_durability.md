---
title: "Durability of my data"
excerpt: "In this section we will look at data durability and the optimum distribution of placement groups(PG) among all OSDs."
---
[block:callout]
{
  "type": "info",
  "body": "Total PGs = (OSDs * 100) / Replicas",
  "title": "PGs per pool"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "$ ceph osd stat\nosdmap e4055: 154 osds: 154 up, 154 in",
      "language": "shell"
    }
  ]
}
[/block]
Applying formula gives me  = ( 154 * 100 ) / 3 = 5133.33

Now , round up this value to the next power of 2 , this will give you the number of PG you should have for a pool having replication size of 3

2^12 = 5133.33
2^13 = 8192

Total PG [rounded - power of two](http://en.wikipedia.org/wiki/Power_of_two>)  = 8192


#My PG is dead. 

Ceph starts recovery for this placement group by chosing a new OSD to re-create the third copy of all objects. On cyclic failure during recovery of the failed PG in the other OSD can result in the objects getting permanently lost.
[block:callout]
{
  "type": "success",
  "body": "10 OSDs/512 PGs & 3 replica, ~150 PGs = (512 * 3) / 10",
  "title": "Ceph cluster"
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "10OSDs",
    "0-1": "~150PGs",
    "1-1": "~75PGs",
    "1-0": "20OSDs",
    "0-2": "The number of PGs have no influence on data durability. It could be 128 or 8192 and the recovery would not be slower or faster,",
    "1-2": "But where 10 OSDs had to copy approximately 100GB each, they now have to copy 50GB each instead.\n\nIf the network was the bottleneck, recovery will happen twice as fast.\nIn other words, recovery goes faster when the number of OSDs increases.",
    "2-0": "40OSDs",
    "3-0": "200OSDs",
    "2-1": "35PGs",
    "3-1": "7PGs",
    "2-2": "If an OSD dies, recovery will keep going faster unless it is blocked by another bottleneck.",
    "3-2": "If an OSD dies, recovery will happen between at most of ~21 (7 * 3) OSDs in these placement groups: recovery will take longer than when there were 40 OSDs, meaning the number of placement groups should be increased."
  },
  "cols": 3,
  "rows": 4
}
[/block]
In a nutshell, more OSDs mean faster recovery and a lower risk of cascading failures leading to the permanent loss of a Placement Group. 

Having 512 or 4096 Placement Groups is roughly equivalent in a cluster with less than 50 OSDs as far as data durability is concerned.


#Object Distribution within a Pool

Ideally objects are evenly distributed in each placement group. Since CRUSH computes the placement group for each object, but does not actually know how much data is stored in each OSD within this placement group, the ratio between the number of placement groups and the number of OSDs may influence the distribution of the data significantly.

For instance, if there was single a placement group for 10 OSDs in a 3 replica pool, only 3 OSD would be used because CRUSH would have no other choice. 

When more placement groups are available, objects are more likely to be evenly spread among them. CRUSH also makes every effort to evenly spread OSDs among all existing Placement Groups.


##Data Recovery Time

An  OSD is hosted by a 1TB SSD on a single machine connected to a 10Gb/s will recover faster than OSDs connected via a 1Gb/s switch.
[block:callout]
{
  "type": "info",
  "title": "Recovery Time in seconds",
  "body": "Disk capacity in GB / (network speed *(nodes-1) )"
}
[/block]
Enough of it, I would like to set it up now.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"megam_whatis_slimbox\" role=\"button\">Go to the SlimBox guide</a>\n<style>\n\n</style>"
}
[/block]