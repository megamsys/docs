.. _whats_new:

==========
What's New
==========

Megam 0.4 introduces important improvements in several areas. The target cloud support has taken a spin to support private cloud (OpenNebula) which means now you can launch apps/services inside your premises.

With 0.4 the Megam team has started a journey to deliver a more intuitive and simpler provisioning experience for users using `TOSCA <http://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.0/TOSCA-Simple-Profile-YAML-v1.0.html>`__. 

Finally, some experimental features where `Ganeti <http://docs.ganeti.org/2.11>`__ is improved using OpenNebula's sunstone to move it up to a slim IaaS for small scale deployments.  


Megam Core: OpenNebula as Target Cloud
----------------------------------------

The target cloud support in Megam 0.4 has been improved to provide an
integration with `OpenNebula <https://opennebula.org>`__

-  An application/service can be launched in OpenNebula from Megam. Read more in the :ref:`OpenNebula Cloud <opennebula_cloud>` guide.

Megam Marketplace: Zarafa
-----------------------------------

Zarafa can be launched from Megam.

- Users can seamlessly provision zarafa community platform version 7.1.9 just by providing the target cloud settings. Read more about this in the :ref:`Zarafa Addon <zarafa_addon>` guide.

Megam Marketplace: Backup
-----------------------------------------------------

Backup of an existing app/service is easy now. Just enter the backup directories and an archive is stored in cloud storage. 

- **Backup management** Existing Apps/Services have ability to backup directories and archive then in a cloud storage. Read more about this in the :ref:`Backup Addon <backup_addon>` guide.



Documentation
--------------

Brand new documentation.

- **Modularized** format with ability to collaborate using `Github <https://github.com/megamsys/docs>`__ using bootstrap theme. 
- **Megam DSL and TOSCA** We are moving towards TOSCA and our 0.5 release will have more features focussed on it.

Experimental
--------------

-  **Ganeti Sunstone**, which provides the possibility of launching through `Ganeti <http://docs.ganeti.org/2.11>`__ VMs from an userinterface. Read more in the `Ganeti Sunstone code <https://github.com/megamsys/ganeti_sunstone>`__.

