.. _pickacloud:


#####################
Pick a Cloud
#####################


Megam can be used to manage multiple clouds on different environments. It is entirely possible to have multiple environments with the same cloud provider (providing they are of course separate environments on the cloud too) or across all the different types of supported cloud providers.

.. hint:: The supported clouds are:


+------------------------+----------------------------------------------------------------------+
| Cloud                  | Description                                                          |
|                        |                                                                      |
+========================+======================================================================+
| Profit bricks          | `profitbricks.com <https://www.profitbricks.com>`_.                  |
|                        | supported, tested with ubuntu images                                 |
+------------------------+----------------------------------------------------------------------+
| hp (openstack)         | `hpcloud.com <https://console.hpcloud.com>`_.                        |
|                        | supported, tested with ubuntu images                                 |
+------------------------+----------------------------------------------------------------------+
| AWS                    | `AWS EC2 <https://console.aws.amazon.com/console/homem>`_.           |
|                        | supported, tested with ubuntu images                                 |
+------------------------+----------------------------------------------------------------------+
| Google cloud           | `google cloud <https://cloud.google.com/>`_.                         |
|                        | supported, tested with debian images                                 |
+------------------------+----------------------------------------------------------------------+
| Gogrid                 | `gogrid.com <http://www.gogrid.com>`_.                               |
|                        |                                                                      |
+------------------------+----------------------------------------------------------------------+
| OpenNebula             | `opennebula <http://opennebula.org>`_.                               |
|                        | ``*new in this release``                                             |
+------------------------+----------------------------------------------------------------------+

Create a Cloud Setting
=========================

Every target cloud provider has a unique set of attributes. Refer the provider specific link before entering them.

- :ref:`OpenNebula <opennebula_cloud>`
- :ref:`Google <gce_cloud>`
- :ref:`PB <profitbricks_cloud>`
- :ref:`Gogrid <aws_cloud>`
- :ref:`AWS <aws_cloud>`
- :ref:`hp  <hp_cloud>`
