.. _whats_new:

==========
What's New
==========

Megam 0.5 introduces important improvements in several areas. The target cloud support has taken a spin to support private cloud (OpenNebula) which means now you can launch apps/services inside your premises.

With 0.5 the Megam team has started a journey to deliver a more intuitive and simpler provisioning experience for users using `TOSCA <http://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.0/TOSCA-Simple-Profile-YAML-v1.0.html>`__.

Finally, some experimental features where `Ganeti <http://docs.ganeti.org/2.11>`__ is improved using OpenNebula's sunstone to move it up to a slim IaaS for small scale deployments.


Megam Core: OpenNebula as Target Cloud
----------------------------------------

The target cloud support in Megam 0.5 has been improved to provide an integration with `OpenNebula <https://opennebula.org>`__

-  An application/service can be launched in OpenNebula from Megam. Read more in the :ref:`OpenNebula Cloud <opennebula_cloud>` guide.

-  New knife-opennebula chef plugin

Megam Marketplace: Backup
-----------------------------------------------------

Improved management of backups of an existing app/service. You can list the backups performed.

- **Backup management** Existing Apps/Services have ability to backup directories and archive then in a cloud storage. Read more about this in the :ref:`Backup Addon <backup_addon>` guide.


Megam TOSCA & DSL
--------------------



Experimental
--------------

-  **Cloud in a box**, which provides the possibility of setting up private cloud.

-  **Ganeti Sunstone**, which provides the possibility of launching through `Ganeti <http://docs.ganeti.org/2.11>`__ VMs from an userinterface. Read more in the `Ganeti Sunstone code <https://github.com/megamsys/ganeti_sunstone>`__.
