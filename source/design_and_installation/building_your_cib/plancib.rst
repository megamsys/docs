.. _plancib:

==========================
Planning the Installation
==========================

In order to get the most out of a Megam Cloud In a Box, we recommend that you create a plan with the features, performance, scalability, and high availability characteristics you want in your deployment. This guide provides information to plan an Megam installation, so you can easily architect your deployment and understand the technologies involved in the management of virtualized resources and their relationship.

Architectural Overview
======================

Megam assumes that your physical infrastructure adopts a classical cluster-like architecture with a front-end, and a set of hosts where Virtual Machines (VM) will be executed. There is at least one physical network joining all the hosts with the front-end.


|Megam Typical ONE|

The basic components of a Cloud in a box system are:

-  **Front-end** that executes the front end services of a private cloud.
-  **Hosts** that are the physical machines.


Front-End
-----------



Host
-------


Existing Operation System
==========================

Step 1. Register at Megam
---------------------------


Step 2. Cloud in box : Installation
--------------------------------------







Baremetal
==========
You can install the operating sytem using a CD or USB mechanism and follow the above process.

Network boot eases the process of install if the number of machines to install is large.

|Megam Cobblerd|



Step 1. Register at Megam
---------------------------



Step 2. Cobblerd  : Installation
--------------------------------------

This script works in Ubuntu trusty.


Step 3. Cloud in box : Installation
--------------------------------------


.. |Megam Typical ONE| image:: /images/megam_typical_one.png
.. |Megam Cobblerd| image:: /images/megam_cloud_in_a_box_baremetal.png
