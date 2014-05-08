.. _devel-ta:

====================
Target Cloud Plugin
====================

This component is in charge of configuring the target cloud in the :ref:`Chef <chefoverview>`. The purpose of this guide is to describe how to create a new target cloud plugin.

Plugin Configuration and Description
====================================

To enable a new target cloud plugini, the only requirement is to make a new knife plugin which interfaces to the target cloud using its API.

-  **server create**: This shall perform a creation of the Virtual Machines in the target cloud
-  **server delete**: This shall perform a deletion of the Virtual Machines in the target cloud
-  **server list**: This shall perform a listing of the Virtual Machines in the target cloud

.. warning:: The above three commands **must exist**. 


Plugin Paramenters
===================



Configuration
===============



