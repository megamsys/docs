.. _plan:

==========================
Planning the Installation
==========================

In order to get the most out of a Megam PaaS, we recommend that you create a plan with the features, performance, scalability, and high availability characteristics you want in your deployment. This guide provides information to plan an Megam installation, so you can easily architect your deployment and understand the technologies involved in the management of virtualized resources and their relationship.

Architectural Overview
======================

Megam assumes that your physical infrastructure adopts a classical cluster-like architecture with a front-end, and a set of hosts where Virtual Machines (VM) will be executed.

|high level architecture of cluster, its components and relationship|

The basic components of an Megam system are:

-  **Front-end** that executes the Megam services.
-  **Datastores** that hold the base management data of the VMs.

Megam presents a highly modular architecture that offers broad support for commodity and enterprise-grade applications, services. This guide briefly describes the different choices that you can make for the management of the different subsystems. 

|Megam Cloud Platform Support|

.. _nilavu:

Front-End
=========


Monitoring
==========


Target Clouds
==============


Highly Available
================

|image3|



.. |high level architecture of cluster, its components and relationship| image:: /images/megam_high.png
.. |Megam Cloud Platform Support| image:: /images/overview_builders.png
.. |image3| image:: /images/megam_ha.png
