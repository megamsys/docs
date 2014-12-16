.. _plancib:

==========================
Planning the Installation
==========================

In order to get the most out of a Megam Cloud In a Box, we recommend that you create a plan with the features, performance, scalability, and high availability characteristics you want in your deployment. This guide provides information to plan an Megam installation, so you can easily architect your deployment and understand the technologies involved in the management of virtualized resources and their relationship.

Architecture Overview
=======================


Megam assumes that your physical infrastructure adopts a classical cluster-like architecture with a front-end, and a set of hosts where Virtual Machines (VM) will be executed. There is at least one physical network joining all the hosts with the front-end.


|Megam Plan CIB|

The typical setup of a Cloud in a box system are:

+------------------------+------------------------------------------------------------------------------------------+
|    Name                | Description                                                                              |
|                        |                                                                                          |
+========================+==========================================================================================+
| CIB Base Unit #1       | that contains software for private cloud based on ``Open Nebula``  and PaaS by ``Megam``.|
+------------------------+------------------------------------------------------------------------------------------+
| CIB Node Unit #2       | that contains the compute cloud software based on ``Open Nebula``.                       |
+------------------------+------------------------------------------------------------------------------------------+
| CIB Storage Unit #3    | that contains the storage software based on ``Ceph``.                                    |
+------------------------+------------------------------------------------------------------------------------------+
| CIB HA Unit #4         | that is the high availability node for ``CIB Base Unit #1``.                             |
+------------------------+------------------------------------------------------------------------------------------+



System requirements
======================

Hardware requirements
----------------------

The following are the minimum hardware requirements. This helps to spin atleast 25 VMs using KVM hypervisor.

+------------------------+------------+--------+-------------+
|    Name                | CPU        | RAM    |   HD        |
|                        | (Cores)    | (GB)   |  (TB)       |
|                        |            |        |             |
+========================+============+========+=============+
| CIB Base Unit #1       | 16         | 32     | 1TB         |
+------------------------+------------+--------+-------------+
| CIB Node Unit #2       | 16         | 64     | 1TB         |
+------------------------+------------+--------+-------------+
| CIB Storage Unit #3    | 16         | 32     | 1TB [4 nos] |
+------------------------+------------+--------+-------------+
| CIB HA  Unit #4        | 16         | 32     | 1TB         |
+------------------------+------------+--------+-------------+

Refer :ref:`Hardware partners <hwcib>` to procure the hardware. We would be glad to assist you as well.

Operation System
-----------------
.. note::
  CIB works in Ubuntu Trusty 14.04. We are working to support other Linux operating systems.



Topology for your datacenter
-------------------------------


+-----------------------------------+-------------------------------------------------+-------------+-------------+-----------------+
|    Topology                       | Description                                     | Managed     | High        | Ideal Scenario  |
|                                   |                                                 | Storage     | Availability|                 |
+===================================+=================================================+=============+=============+=================+
| 2 Nodes using Local Storage       | In this mode there is no HA and managed storage.|     No      |   No        | SMBs who wish to|
|                                   | You can spin VMs and enrich them with the       |             |             | try CIB.        |
|                                   | PaaS. Ideal for SMBs to start using CIB.        |             |             |                 |
+-----------------------------------+-------------------------------------------------+-------------+-------------+-----------------+
| 3 Nodes with Cloud Storage        | In this mode the topology shown above in the    |    Yes      |   No        | SMBs who wish to|
|                                   | picture is a typical scenario seen in data      |             |             | have a minimal  |
|                                   | centers. You can skip high availability and cut |             |             | cloud           |
|                                   | down to 3 nodes.                                |             |             |                 |
+-----------------------------------+-------------------------------------------------+-------------+-------------+-----------------+
| 4 Node with HA and                |                                                 |    Yes      |  Yes        | Robust private  |
| private Cloud Storage             | All in one bundle.                              |             |             | cloud           |
+-----------------------------------+-------------------------------------------------+-------------+-------------+-----------------+

Cloud In a Box is a flexible solution with ability to provision and de-provision nodes on the fly. So the nodes #5, #6 illustrated in dotted lines can be provisioned in your data center in the future. So you can start with a 2Node setup and expand it based on your need.


Network Configuration
-------------------------------------------



.. _cloudinabox_2node:

Cloud in box : 2-Nodes
-------------------------------------------

This 2-Node setup is the minimalistic try configuration to start with. This doen't include a replicated private cloud storage. A local directory in the ``CIB Base Unit #1`` is used as a storage.
This means that when the VMs are spinned up in Node Unit #2, the image gets transported using SSH which may take a while based on network latency.

|Megam 2Unit CIB|

.. _cloudinabox_3nodes:

Cloud in box : 3-Nodes
-------------------------------------------

.. note:: For more information `Overview of Storage <storage>`.


This 3-Node setup is the minimal cloud configuration to start with. This includes a private replicated storage cluster based on `Ceph <http://ceph.com/ceph-storage/>`__ where the admin of ceph resides in ``CIB Base Unit``. The ``CIB Node Unit #3`` will run the
Our **Cloud Ready** technology seamlessley setup the Ceph admin node to connect and access the Ceph nodes running ``Unit #3``.

CIB also configures the private IaaS software (OpenNebula) to use the ceph storage for its operation.

|Megam 3Unit CIB|


.. _cloudinabox_4nodes:

Cloud in box : 4-Nodes
-------------------------------------------

.. caution:: Coming soon.

This 4-Node setup is the ideal setup for a datacenter. This includes a private replicated storage cluster based on `Ceph <http://ceph.com/ceph-storage/>`__ where the admin of ceph resides in ``CIB Base Unit``. The ``CIB Node Unit #3`` will run the
Our **Cloud Ready** technology seamlessley setup the Ceph admin node to connect and access the Ceph nodes running ``Unit #3``.

The ``CIB Node Unit #4`` provides ``High Availability`` for the solution using `DRBD <http://drbd.org>`__

The ``CIB Node Unit #4`` has a Logical Volume Manager (LVM) shared storage with all the software in ``CIB Base Unit #1``. `DRBD <http://drbd.org>`__ replicates the known directories of the software eg: **/var/lib/megam, /var/lib/riak, /var/lib/one ..** which has the current state of the ``CIB Base Unit#1``. `DRBD <http://drbd.org>`__ is intergrated with `pacemaker <http://http://www.drbd.org/users-guide/ch-pacemaker.html>`__ which uses heartbeats  to detect anamoly and switches the access to the ``CIB Node Unit #4 (failover node)`` seamlessly without a hitch to the user using our system (CIB).


|Megam 4Unit CIB|



Existing Hardware
------------------------------------------------

We current support ``Ubuntu Trusty 14.04`` on an existing infrastructure.  We are working hard to support other operating systems, and experimenting with Docker images.

If you are already running a set of nodes in your data center with ``Ubuntu Trusty 14.04`` you are free to try it during the limited ``Beta`` period :ref:`Installing CIB <ignccib>`



New Hardware
------------------------------------------------

Our hardware partners can help you in providing you the right infrastructure that runs. CIB.

You can buy directly from our hardware partners :ref:`Hardware partners <hwcib>` and get going with ``Cloud In a Box``. Refer :ref:`Installing CIB <ignccib>`

If you need help, we would be glad to help you out.


.. |Megam 2Unit CIB| image:: /images/megam_cib_2unit.png
.. |Megam 3Unit CIB| image:: /images/megam_cib_3unit.png
.. |Megam 4Unit CIB| image:: /images/megam_cib_4unit.png
.. |Megam Plan CIB| image:: /images/megam_planning_cib.png
