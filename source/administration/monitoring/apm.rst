.. _apm:

====================
Monitoring Overview
====================

This guide provides an overview of the Megam monitoring subsystem. The monitoring subsystem gathers information relative to the hosts and the virtual machines, such as the host status, basic performance indicators, as well as VM status and capacity consumption. This information is collected by executing a set of static probes provided by Megam. The output of these probes is sent to Megam wsing a push paradigm.

The Push Model
==================

.. warning:: **Default**. This is the default for apps and services launched in Megam.



The Monitor Metrics
===================

The information manage by the monitoring system includes the typical performance and configuration parameters for the host and VMs, e.g. CPU or network consumption, Hostname or CPU model.

These metrics are gathered by specialized programs, called probes, that can be easily added to the system.
