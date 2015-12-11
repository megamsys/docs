---
title: "Using Ceph"
excerpt: "Now that we have a Ceph cluster. Its time to manage and use the Ceph Cluster."
---
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/pKZ65NuZRZmI1CgBUrR0",
        "cib_storage.png",
        "168",
        "134",
        "#606d83",
        ""
      ],
      "caption": ""
    }
  ]
}
[/block]
#Pools:

Ceph cluster has pools. Pools are the logical group for storing objects .These pools are made up of placement groups(PGs). At the time of pool creation we have to provide number of placement groups that the pool is going to contain , number of object replicas ( usually takes default value , if other not specified )

##Creating a pool  *pool-A* with 128 PGs
[block:code]
{
  "codes": [
    {
      "code": " $ ceph osd pool create pool-A 128\n   pool 'pool-A' created\n      \n $ rados mkpool test",
      "language": "shell"
    }
  ]
}
[/block]
 ##Listing pools
[block:code]
{
  "codes": [
    {
      "code": "$ ceph osd lspools\n  0 data,1 metadata,2 rbd,36 pool-A,\n      \n$ rados lspools\n\tdata\n  metadata\n  rbd\n  pool\n  test",
      "language": "shell"
    }
  ]
}
[/block]
##Total PGs used by pool    
[block:code]
{
  "codes": [
    {
      "code": "$ ceph osd pool get pool-A pg_num\n  pg_num: 128",
      "language": "shell"
    }
  ]
}
[/block]

##Find replication level used by pool 

See *rep size* value for replication
[block:code]
{
  "codes": [
    {
      "code": "$ ceph osd dump | grep -i pool-A\n  pool 36 'pool-A' rep size 2 min_size 1 crush_ruleset 0 object_hash       rjenkins pg_num 128 pgp_num 128 last_change 4051 owner 0",
      "language": "shell"
    }
  ]
}
[/block]
##Changing replication level for a pool      

This means all the objects of pool-A will be replicated 3 times on 3 different OSD's
[block:code]
{
  "codes": [
    {
      "code": "$ ceph osd pool set pool-A size 3\n  set pool 36 size to 3\n      \n$ ceph osd dump | grep -i pool-A\n  pool 36 'pool-A' rep size 3 min_size 1 crush_ruleset 0 object_hash       rjenkins pg_num 128 pgp_num 128 last_change 4054 owner 0",
      "language": "shell"
    }
  ]
}
[/block]
##Creating data object-A, object-B
[block:code]
{
  "codes": [
    {
      "code": " $ dd if=/dev/zero of=object-A bs=10M count=1\n    1+0 records in\n    1+0 records out\n    10485760 bytes (10 MB) copied, 0.0222705 s, 471 MB/s\n\n$ dd if=/dev/zero of=object-B bs=10M count=1\n    1+0 records in\n    1+0 records out\n    10485760 bytes (10 MB) copied, 0.0221176 s, 474 MB/s",
      "language": "shell"
    }
  ]
}
[/block]
##Put object-A and object-B in pool-A
[block:code]
{
  "codes": [
    {
      "code": "$ rados -p pool-A put object-A  object-A\n$ rados -p pool-A put object-B  object-B",
      "language": "shell"
    }
  ]
}
[/block]
Counting objects in pool-A
[block:code]
{
  "codes": [
    {
      "code": "$ rados -p pool-A ls\n    object-A\n    object-B",
      "language": "shell"
    }
  ]
}
[/block]
##Finding an object belonging to a PG
  
[block:code]
{
  "codes": [
    {
      "code": "$ ceph osd map pool-A object-A\n  osdmap e4055 pool 'pool-A' (36) object 'object-A' -> pg 36.b301e3e8 (36.68) -> up [122,63,62] acting [122,63,62]\n\n$ ceph osd map pool-A object-B\n  osdmap e4055 pool 'pool-A' (36) object 'object-B' -> pg 36.47f173fb (36.7b) -> up [153,110,118] acting [153,110,118]",
      "language": "shell"
    }
  ]
}
[/block]
The above output throws a lot of information which is explained below.
[block:parameters]
{
  "data": {
    "0-0": "e4055",
    "0-1": "OSD map version id",
    "1-0": "**pool-A** has replication level set to 3",
    "1-1": "pool name",
    "2-0": "36",
    "2-1": "pool id",
    "3-0": "object-A, object-A",
    "3-1": "object name",
    "4-0": "36.68 ) and ( 36.7b)",
    "4-1": "Placement Group id",
    "5-1": "object's 3 copies resides on OSD.122 , OSD.63 and OSD.62",
    "5-0": "OSD.122 , OSD.63 and OSD.62"
  },
  "cols": 2,
  "rows": 6
}
[/block]
##Verify the objects in ceph nodes for OSD 122 , 63 and 62
[block:code]
{
  "codes": [
    {
      "code": "$ df -h /var/lib/ceph/osd/ceph-122\n  Filesystem            Size  Used Avail Use% Mounted on\n  /dev/sdj1             2.8T  1.8T  975G  65% /var/lib/ceph/osd/ceph-122",
      "language": "shell"
    }
  ]
}
[/block]
##Browse to the directory where the objects are stored
  
[block:code]
{
  "codes": [
    {
      "code": "$ pwd\n/var/lib/ceph/osd/ceph-122/current\n\nUnder this directory if you do a ls command , you will see PG ID , In our case the PG id is 36.68  for object-A\n    \n$ ls -la | grep -i 36.68\n drwxr-xr-x 1 root root    54 Jan 24 16:45 36.68_head\n\n$ cd 36.68_head\n /var/lib/ceph/osd/ceph-122/current/36.68_head\n\n$ ls -l\ntotal 10240\n-rw-r--r-- 1 root root 10485760 Jan 24 16:45 object-A__head_B301E3E8__24\n",
      "language": "shell"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Any questions ? We're always here to help.",
  "body": "We hang around in our [public slack room](https://megamioteam.slack.com/messages/support/).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs."
}
[/block]