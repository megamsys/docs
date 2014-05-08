.. _opennebula_cloud:

================================
OpenNebula Cloud
================================

A template file is needed to be setup in OpenNebula before launching with Megam. A template consists of a set of attributes that defines a Virtual Machine. Using the command ``onetemplate create``, a template can be registered in OpenNebula to be later instantiated by Megam. 

.. warning:: There are some template attributes that can compromise the security of the system or the security of other VMs, and can be used **only** by users in the oneadmin group. These attributes can be configured in `oned.conf <http://docs.opennebula.org/4.6/administration/references/oned_conf.html#oned-conf>`__, the default ones are labeled with ``*`` in the following tables. See the complete list in the `Restricted Attributes <http://docs.opennebula.org/4.6/administration/references/oned_conf.html#oned-conf-restricted-attributes-configuration>`__ section.


|opennebula architecture|

An Example Template
--------------------

This a sample hybrid VM Template setup in opennebula. 

.. code::


    # Local Template section
    NAME=MNyWebServer

    CPU=1
    MEMORY=256

    DISK=[IMAGE="ubuntu-trusty"]
    NIC=[NETWORK="public"]

    EC2=[
      AMI="ami-xxxxx" ]
      
Save Template
--------------      

You can `Manage templates from Sunstone <http://docs.opennebula.org/4.6/administration/sunstone_gui/suns_views.html>`__.

.. code::


    $ onetemplate create ec2template
    $ ontemplate instantiate ec2template


Common Attributes
=================

These are the common attributes for this cloud are:

+--------------------+--------------+--------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------+
|     Attribute      |    Value     |                                                                Description                                                                 |               Mandatory                |
+====================+==============+============================================================================================================================================+========================================+
| **NAME**           | String       | Name of the cloud                                                                                                                          | YES                                    |
+--------------------+--------------+--------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------+


Steps in Megam
============================


- Click ``Settings`` and choose ``OpenNebula`` icon. 
   
.. image:: /images/opennebula_setting.png 
         
- Click Save

- You can see your saved settings in under ``Manage Settings`` >  ``Clouds``   

.. |opennebula architecture| image:: /images/opennebula_architecture.png 

