.. _backup_addon:


#####################
Backup Addon
#####################

This allows you to backup an exisiting ref: ``Apps <apps>``/``Services <services_intro>``  in a single click.

|backup process architecture|


What is used here ?
-------------------

A Rubygem `backup <http://meskyanichi.github.io/backup/v4/>`__ is used to back up the directory. The chosen directory is compressed and stored in a cloud storage.

.. warning: Currently there is no way to list the backup, and restore it. We are working on it. The time to complete a backup depends on the latency of the network.

How does it work ?
------------------

When a directory of an app/service that runs on Megam is selected by the user, the directory gets compressed and stored in a cloud storage.


Requirements
------------------

A :ref:`Target cloud <targetcloud>` setting is needed needed before you launch the same.


Launch Backup Addon
---------------------

:ref:`Addon Launch <marketplaceaddons>` process shall kickstart the launch.

|backup addon|


Select the Backup Location
----------------------------

|backup selection|



Backup is complete
--------------------

|backup is complete|


.. |backup process architecture| image:: /images/backup_architecture.png
.. |backup addon| image:: /images/backup_addon.png
.. |backup selection| image:: /images/backup_configure.png
.. |backup is complete| image:: /images/backup_complete.png
