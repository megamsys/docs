.. _targetcloud:


#####################
Target cloud
#####################


Managing environments

Juju can be used to manage multiple clouds on different environments. The environments themselves need only be defined in the environments.yaml file as more fully described in the configuration section of the documentation. It is entirely possible to have multiple environments with the same cloud provider (providing they are of course separate environments on the cloud too) or across all the different types of supported cloud providers.
Identifying the current environment

The order of precedence for determining the environment a command will be executed on is:

    The environment specified by the use of the -e switch.
    The environment set by the JUJU_ENV environment variable.
    The environment last specified with the switch command.
    The environment specified as the default in environments.yaml.


To determine which environment a command will act on, you can issue the switch command with no parameters:

This option allows you setup target cloud definitions.::

   1. Helpful when you run your apps/services with different memory/cpu and storage.

   2. Helpful when you want to quickly launch the same app/service in a different cloud.

You can launch your apps and service in the cloud of your choice. If your cloud isn't here, please let us know.

The default environment is the environment which will be used if you have not issued a switch command and do not specify an environment to use with the -e switch or alter the JUJU_ENV environment variable. The default environment is specified at the top of the environments.yaml file, before the environment specifications themselves, like this:

...
default: amazon
environments:
  ## https://juju.ubuntu.com/docs/config-openstack.html
  openstack:
...

Updating running environments

Juju has a set of commands that permit you to view and change the configuration of a running environment. The commands can be used to make temporary changes, such as to logging, or permanent changes, such as to take advantage of new features after juju is upgraded.

The get-environment command will display all the environment's configured options. You can pass the name of an option to see just the one value. For example, to see the default series that charms are deployed with, type:

juju get-environment default-series

The set-environment command will set a configuration option to the specified value. For example, you can set the default series that charms are deployed with to trusty like this:

juju set-environment default-series=trusty

The unset-environment command will set a configuration option to the default value. It acts as a reset. Options without default value are removed. It is an error to unset a required option. For example, you can unset the default series that charms are deployed with (so that the juju store can choose the best series for a charm) like this:

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
