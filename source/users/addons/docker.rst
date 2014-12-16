.. _dockeraddon:

====================================
Getting started with Docker Add-on
====================================


Make your dockerized application/service launch in Megam.

The Docker Addon for Megam
----------------------------

-  Add-on enables you to launch any docker image in Megam.

To use the Docker Add-on, complete the following steps:
  In the Add-ons section of the Marketplace, click the Docker Add-on icon. You can now define the ``Docker Cluster`` name, and pick a cloud to launch the cluster.
Read about :ref:`How to pick a cloud <pickacloud>`

|megam docker addon|


Docker
^^^^^^^

Where you can create the docker cluster it is launched by Megam and managed in the cloud of choice.

.. note:: This essentially launches a `CentOS 7` image with systemd, bundled with ``Geard``

.. |megam docker addon| image:: /images/megam_addon_docker.png
