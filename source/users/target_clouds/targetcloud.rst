.. _targetcloud:


#####################
Target cloud
#####################

This option allows you setup target cloud definitions.::

   1. Helpful when you run your apps/services with different memory/cpu and storage. 

   2. Helpful when you want to quickly launch the same app/service in a different cloud.

You can launch your apps and service in the cloud of your choice. If your cloud isn't here, please let us know. 


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
| Podnix Cloud           | `podnix.com <https://www.podnix.com>`_.                              |
|                        |                                                                      |
+------------------------+----------------------------------------------------------------------+

Create a Target Cloud
=========================

Every target cloud provider has a unique set of attributes. Refer the provider specific link before entering them.

- :ref:`OpenNebula <opennebula_cloud>`
- :ref:`Google <gce_cloud>`
- :ref:`PB <profitbricks_cloud>`
- :ref:`Gogrid <aws_cloud>`
- :ref:`Podnix  <podnix_cloud>`
- :ref:`AWS <aws_cloud>`  
- :ref:`hp  <hp_cloud>`  



Manage
============================

Once the target cloud setting was saved, to manage them.   Click ``Settings`` from Dashboard.

.. image:: /images/manageclouds.png
 		
 		   
**View**  		
 		
Click ``Clouds`` on the tab view
             
Select and View your target cloud          

.. image:: /images/viewcloud.png
