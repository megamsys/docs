.. _plancib:

==========================
Planning the Installation
==========================

In order to get the most out of a Megam Cloud In a Box, we recommend that you create a plan with the features, performance, scalability, and high availability characteristics you want in your deployment. This guide provides information to plan an Megam installation, so you can easily architect your deployment and understand the technologies involved in the management of virtualized resources and their relationship.

Architectural Overview
======================

Megam assumes that your physical infrastructure adopts a classical cluster-like architecture with a front-end, and a set of hosts where Virtual Machines (VM) will be executed. There is at least one physical network joining all the hosts with the front-end.

|high level architecture of cluster, its components and relationship|

The basic components of an Megam system are:

-  **Front-end** that executes the Megam services.
-  **Hosts** that are the physical machines.


|Megam Cloud In A Box Support|

Front-End
=========


Monitoring
==========


Target Clouds
==============


Highly Available
================

|image3|



.. |high level architecture of cluster, its components and relationship| image:: /images/megamcib_high.png
.. |Megam Cloud In A Box Support| image:: /images/overview_builders.png
.. |image3| image:: /images/megam_ha.png
