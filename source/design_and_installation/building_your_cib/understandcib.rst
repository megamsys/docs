.. _understandcib:

================================================================================
Understanding Megam Cloud in a Box
================================================================================

This guide is meant for the cloud architect and administrator, to help him to understand the way Megam Cloud in a Box(CIB) operates in the infrastructure resources, and how they are consumed by the users.


``Cloud In a Box`` is how you deploy the Cloud.  Cloud In a Box is a suite of best practices for deploying ``Linux Servers``, from ``Linux Servers``. The term ``Linux`` used here represents any distro ``eg: Ubuntu, CentOS, Debian..``. After deployment, it provides automatic federation and integrated management, monitoring, and logging.


  **Cloud In a Box** uses an intelligent **Cloud Ready** technology to provision/de-provision compute (or) storage units.


  **Cloud Ready** technology  ensures collaboration with all the compute/storage units and makes the automation real easy.


.. note::
  Traditionally, the Linux Server ships and installs from a single ISO. That's fine and dandy if you're installing one or two servers.  But in the Cloud IaaS world, that just doesn't cut the mustard.  Real Cloud deployments involve installing dozens, if not hundreds or thousands of systems.  And then managing, monitoring, and logging those system for their operational lives.


``Cloud In a Box`` is an ambitious project to solve those problems for the modern system administrator, at scale, using the best of Open Source technologies.  It's tightly integrated with Megam and Opennebula is our foremost (but not only) workload.


In our experience, anyone who has more than, say, a dozen Linux Servers has implemented some form of a local mirror (or cache), a pxe/tftp boot server, dhcp, dns, and probably quite a bit of Debian preseed hacking etc. to make that happen.  Most enterprise have done something like this in their past.  And almost every implementation has been different.  We wanted to bundle this process and make it trivial for an enterprise to install ``Cloud In a Box`` on one server, and then deploy an entire data center effortlessly.

|Megam Cloud In A Box HW|

At a general level, the pieces we have are :

Server
----------------

A server in the data center which comprises of a cluster of nodes. A server with 12 nodes is shown in the picture.


Node
----------------

An individual compute or storage unit that is part of a server.



CIB Base unit
----------------

CIB Base unit is a node which will have all the software to setup a data center.

The picture shows a server with 12 nodes and a single node in expanded view. A data center may have sever such servers for compute and storage.

The goal is make the ``CIB Base unit`` get up and running with the required software and the subsequent nodes boot from the ``CIB base unit``.

A management console for **Cloud In a Box** can be launched and managed using an user interface that gets installed automatically in the CIB base unit.


CIB Worker nodes
------------------

CIB Worker nodes are the subsequent nodes which will be brought up by the **CIB Base unit**  with the right level of the software as needed for the node.

When a new ``Worker node`` is needed, all you need to do is just plug the node in the Local area network(LAN) as the ``CIB Base unit``. You are ready to add a new compute or storage node in minutes.

**Cloud Ready** technology  uses the well known **pxe** boot  to bring up new worker nodes and instrument them using Megam CIB Node Agent that get installed automatically.

CIB has option to make the solution highly available by making one of the nodes redundant to recover from failure.


|Megam Cloud In A Box Architecture|


The Megam CIB Web
---------------------

A management server with a webinterface(CIB Web) runs on the CIB Base unit. Once the CIB Base unit is up, it starts installing Megam and Cobbler. Cobbler is a Fedora project, popular with many sysadmins, with a Python API.

Cobbler is installable as a package, all on its own, and can be used to deploy Debian, Ubuntu, CentOS, Fedora, Red Hat, and SuSE systems.

But the **megamcib** is a special meta package that adds some excellent enhancements to the Datacenter provisioning experience. The Mini ISOs are automatically downloaded and imported in cobbler.

``Cloud In a Box`` also ships specially crafted and thoroughly tested preseed files for Cloud In a Box deployed Linux Servers.  These ensure that your network installations operate reliably unattended.

The **CIB Web** drives a 5 step simple to use process that gets a datacenter **Cloud Ready**

|Megam Cloud In A Box 5Steps|

The Megam CIB Node Agent
-------------------------

In the Cloud In a Box, we have adjusted our design to a more modern ``service orchestration`` approach, which integrates much better into our Cloud strategy.  Here, we're using **CIB Node Server** that runs on each of the nodes and have intelligent ability to let the ``CIB Base unit`` know that its running and alive.

This helps to install compute and storage software on the subsequent node and instrument automation in them.


The Megam CIB Client
---------------------

Megam CIB Server has built in CIB Clients that can be used to talk to the Megam CIB Node agents running in a datacenter.


Further information
===================

:ref:`Planning the CIB Installation <plancib>`

.. |Megam Cloud In A Box HW| image:: /images/megam_cloud_in_a_box_hw.png
.. |Megam Cloud In A Box Architecture| image:: /images/megam_cloud_in_a_box_architecture.png
.. |Megam Cloud In A Box 5Steps| image:: /images/megam_cib_5step_intro.png
