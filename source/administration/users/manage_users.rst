.. _manage_users:

==========================
Managing Users
==========================

Megam supports user accounts and groups. This guide shows how to manage users. To manage user rights, visit the :ref:`Authentication Overview <auth_overview>` guide.

A user in Megam is defined by a username and password. You don't need to create a new Unix account in the front-end for each Megam user, they are completely different concepts. Megam users are authenticated using a session string included in every :ref:`operation <restapi>`, which is checked by the Megam core.

Each user has a unique ID, and belongs to a group.

After the installation, you will have one administrative accounts, ``sandy@megamsandbox.com``. You can check it using the `` `` commands.

There are different user types in the Megam system:

-  **Administrators**, the **sandy@megamsandbox.com** account is created **the first time** Megam is started using the MEGAM\_AUTH data. ``sandy@megamsandbox.com`` has enough privileges to perform any operation on any object. Any other user in the admin group has the same privileges as ``sandy@megamsandbox.com``
-  **Regular   User** accounts may access most of the functionality offered by Megam to manage resources.

.. note:: The complete Megam approach to user accounts and groups is explained in more detain in the :ref:`Understanding Megam <understand>` guide.
