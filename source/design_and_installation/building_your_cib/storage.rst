.. _storage:

============================
An Overview of Storage
============================

Cloud In a Box provides ability to setup private cloud storage in minutes with a single click.  We currently support ``Ceph`` as the storage provider.

The other storage providers like ``GlusterFS``, ``openATTIC`` are a work in progress. We would be glad to `help <mailto:support@megam.co?subject=Storage>`_ you out, If you need support for a specific storage provider.


Ceph
-----
|ceph logo|

Ceph is a distributed object store and file system designed to provide excellent performance, reliability and scalability.
The power of Ceph can transform your organization’s IT infrastructure and your ability to manage vast amounts of data. Ceph’s foundation is the Reliable Autonomic Distributed Object Store (RADOS), which provides your applications with object, block, and file system storage in a single unified storage cluster—making Ceph flexible, highly reliable and easy for you to manage.

Ceph’s RADOS provides you with extraordinary data storage scalability—thousands of client hosts or KVMs accessing petabytes to exabytes of data. Each one of your applications can use the object, block or file system interfaces to the same RADOS cluster simultaneously, which means your Ceph storage system serves as a flexible foundation for all of your data storage needs. You can use Ceph for free, and deploy it on economical commodity hardware.

OBJECT-BASED STORAGE
    Organizations prefer object-based storage when deploying large scale storage systems, because it stores data more efficiently. Object-based storage systems separate the object namespace from the underlying storage hardware—this simplifies data migration.

WHY IT MATTERS
    By decoupling the namespace from the underlying hardware, object-based storage systems enable you to build much larger storage clusters. You can scale out object-based storage systems using economical commodity hardware, and you can replace hardware easily when it malfunctions or fails.


OBJECT STORAGE
    Ceph’s software libraries provide client applications with direct access to the RADOS object-based storage system, and also provide a foundation for some of Ceph’s advanced features, including RADOS Block Device (RBD), RADOS Gateway, and the Ceph File System.

LIBRADOS
    The Ceph librados software libraries enable applications written in C, C++, Java, Python and PHP to access Ceph’s object storage system using native APIs. The librados libraries provide advanced features, including: partial or complete reads and writes snapshots atomic transactions with features like append, truncate and clone range object level key-value mappings

|ceph topology|

Ceph Components
----------------
Whether you want to provide Ceph Object Storage and/or Ceph Block Device services to Cloud Platforms, deploy a Ceph Filesystem or use Ceph for another purpose, all Ceph Storage Cluster deployments begin with setting up each Ceph Node, your network and the Ceph Storage Cluster. A Ceph Storage Cluster requires at least one Ceph Monitor and at least two Ceph OSD Daemons. The Ceph Metadata Server is essential when running Ceph Filesystem clients.

Ceph OSDs
==========

.. image:: /images/ceph_osd_logo.png
   :scale: 60 %
   :alt: Ceph OSD Logo
   :align: left

A Ceph OSD Daemon (Ceph OSD) stores data, handles data replication, recovery, backfilling, rebalancing, and provides some monitoring information to Ceph Monitors by checking other Ceph OSD Daemons for a heartbeat. A Ceph Storage Cluster requires at least two Ceph OSD Daemons to achieve an active + clean state when the cluster makes two copies of your data (Ceph makes 2 copies by default, but you can adjust it).

- At least three in a cluster
- One per disk or RAID group
- Serve stored objects to clients
- Intelligently peer to perform replication tasks

Monitors
=========

.. image:: /images/ceph_mon_logo.png
   :scale: 60 %
   :alt: Ceph Monitor Logo
   :align: left

A Ceph Monitor maintains maps of the cluster state, including the monitor map, the OSD map, the Placement Group (PG) map, and the CRUSH map. Ceph maintains a history (called an “epoch”) of each state change in the Ceph Monitors, Ceph OSD Daemons, and PGs.


- Maintain cluster membership and state
- Provide consensus for distributed decision-making
- Small, odd number
- These do not serve stored objects to clients

MDS
=====

.. image:: /images/ceph_mds_logo.png
   :scale: 70 %
   :alt: Ceph MSD Logo
   :align: left

A Ceph Metadata Server (MDS) stores metadata on behalf of the Ceph Filesystem (i.e., Ceph Block Devices and Ceph Object Storage do not use MDS). Ceph Metadata Servers make it feasible for POSIX file system users to execute basic commands like ls, find, etc. without placing an enormous burden on the Ceph Storage Cluster. This manages metadata for a POSIX-compliant shared filesystem


- Directory hierarchy
- File metadata (owner, timestamps, mode, etc.)
- Stores metadata in RADOS
- Does not serve file data to clients
- Only required for shared filesystem

See below the big picture on how the MDS works:

|ceph mds|

The MDS only stores metadata related to the files. It uses the RADOS object store as all the other component of Ceph.


What we offer ?
-------------------

Deploying a ceph cluster in production requires a little bit of homework , to gather information so that you can design a better and more reliable and scalable ceph cluster to fit in your IT needs. These very specific requirements are handled seamlessly by our ``Cloud In a Box - Cloud Ready`` technology that results in a scalable cloud storage.

|megam ceph|

Design Recommendation
  -  1GbE network should be sufficient in most of the cases.We recommend that each host have at least two 1Gbps network interface controllers (NICs). Since most commodity hard disk drives have a throughput of approximately 100MB/second, your NICs should be able to handle the traffic for the OSD disks on your host. We recommend a minimum of two NICs to account for a public (front-side) network and a cluster (back-side) network.
  -  Run OSD on a dedicated storage node ( server with multiple disks ), actual data is stored in the form of objects.
  -  Run Monitor on a separate dedicated hardware or coexists with ceph client nodes ( other than OSD node ) such as RGW, CephFS node. Monitors are not resource hungry.
  -  Monitor maintains health of entire cluster , it contains Placement Group(PG) logs and OSD logs.
  -  A minimum of three monitors nodes are recommended for a cluster quorum, we'll start with one and expand as the nodes are increased.
  -  If PG,Monitor and OSD logs are storage on local disk of monitor node, we need to make sure that sufficient amount of local storage so that it should not fill up.
  -  Unhealthy clusters require more storage for logs, can reach upto GB and even hundreds of GB if the cluster is left unhealthy for a very long time .
  -  When the storage nodes are increased, storage nodes separated out across multiple racks increases network traffic and the impact of latency and the number of network switch hops should be considered.
  - Ceph will automatically recover by re-replicating data from the failed nodes using secondary copies present on other nodes in cluster .

  A storage node failure thus have several effects.

  -  Total cluster capacity is reduced by some fractions.
  -  Total cluster throughput is reduced by some fractions.
  -  The cluster enters a write heavy recovery processes.

A general thumb of rule to calculate recovery time in a ceph cluster given 1 disk per OSD node is :

Recovery Time in seconds = disk capacity in Gigabits / ( network speed *(nodes-1) )

.. warning::
Limitation: The 3rd ceph storage node doesn't provide high level of fault tolerance, adding more storage nodes does improve uptime and
 (minimum of 5 physically separated nodes and minimum of 100 OSD @ 4TB per OSD the cluster capacity is over 130TB, provides 80% uptime on physical node failure and 99% uptime on OSD failure.
 RGW and Monitors should be on separate nodes).


Hardware Selection
-------------------
Ceph was designed to run on commodity hardware, which makes building and maintaining petabyte-scale data clusters economically feasible. Hardware planning should include distributing Ceph daemons and other processes that use Ceph across many hosts. Generally, we recommend running Ceph daemons of a specific type on a host configured for that type of daemon. We use a separate node unit #2 for hosts for processes like OpenNebula that utilize this storage cluster.

CPU
  Ceph metadata servers dynamically redistribute their load, which is CPU intensive. So your metadata servers should have significant processing power (e.g., quad core or better CPUs). Ceph OSDs run the RADOS service, calculate data placement with CRUSH, replicate data, and maintain their own copy of the cluster map. Therefore, OSDs should have a reasonable amount of processing power (e.g., dual core processors). Monitors simply maintain a master copy of the cluster map, so they are not CPU intensive.

RAM
  Metadata servers and monitors must be capable of serving their data quickly, so they should have plenty of RAM (e.g., 1GB of RAM per daemon instance). OSDs do not require as much RAM for regular operations (e.g., 500MB of RAM per daemon instance); however, during recovery they need significantly more RAM (e.g., ~1GB per 1TB of storage per daemon). Generally, more RAM is better.

Data Storage
  There are significant cost and performance tradeoffs to consider when planning for data storage. Simultaneous OS operations, and simultaneous request for read and write operations from multiple daemons against a single drive can slow performance considerably. There are also file system limitations to consider: btrfs is not quite stable enough for production, but it has the ability to journal and write data simultaneously, whereas XFS and ext4 do not.
So considering those we provide an independent harddrives with 3 OSD daemons using ext4fs filesystem. Important Since Ceph has to write all data to the journal before it can send an ACK (for XFS and EXT4 at least), having the journal and OSD performance in balance is really important!

HDD
  OSDs should have plenty of hard disk drive space for object data. We recommend a minimum hard disk drive size of 1 terabyte. Consider the cost-per-gigabyte advantage of larger disks. We recommend dividing the price of the hard disk drive by the number of gigabytes to arrive at a cost per gigabyte, because larger drives may have a significant impact on the cost-per-gigabyte.
For example, a **1 TB** hard disk priced at $75.00 has a cost of **$0.07/GB**  (i.e., $75 / 1024 = ``0.0732``).

By contrast, a **3 TB** hard disk priced at $150.00 has a cost of **$0.05/GB** (i.e., $150 / 3072 = ``0.0488``).

In the foregoing example, using the 1 TB disks would generally increase the cost per gigabyte by 40%–rendering your cluster substantially less cost efficient. Also, the larger the storage drive capacity, the more memory per Ceph OSD Daemon will be needed, especially during rebalancing, backfilling and recovery. A general rule of thumb is ~1GB of RAM for 1TB of storage space is used CIB.

The illustration shows a 3TB(separate HDD) managed by an OSD. There 12 such OSDs.

|ceph osd sample size|

Storage drives are subject to limitations on seek time, access time, read and write times, as well as total throughput. These physical limitations affect overall system performance–especially during recovery. We recommend using a dedicated drive for the operating system and software, and one drive for each Ceph OSD Daemon you run on the host.

Solid state drives(SSD)
  One opportunity for performance improvement is to use solid-state drives (SSDs) to reduce random access time and read latency while accelerating throughput. SSDs often cost more than 10x as much per gigabyte when compared to a hard disk drive, but SSDs often exhibit access times that are at least 100x faster than a hard disk drive.

SSDs do not have moving mechanical parts so they aren’t necessarily subject to the same types of limitations as hard disk drives. SSDs do have significant limitations though. When evaluating SSDs, it is important to consider the performance of sequential reads and writes. An SSD that has 400MB/s sequential write throughput may have much better performance than an SSD with 120MB/s of sequential write throughput when storing multiple journals for multiple OSDs.


Storage Unit Hardware
---------------------
Ceph can run on inexpensive commodity hardware. Small production clusters and development clusters can run successfully with modest hardware.

Refer the :ref:`Planning CIB section: Hardware Requirements <plancib>` for the recommended configuration for the Storage node.



 .. |ceph logo| image:: /images/ceph_logo.png
 .. |ceph topology| image:: /images/ceph-topo.jpg
 .. |ceph mds| image:: /images/ceph-mds.jpg
 .. |ceph osd sample size| image:: /images/ceph_osd_size.png
 .. |megam ceph| image:: /images/megam_cib_ceph.png
