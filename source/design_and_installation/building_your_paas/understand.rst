.. _understand:

================================================================================
Understanding Megam
================================================================================

This guide is meant for the cloud architect and administrator, to help him to understand the way Megam automates the infrastructure resources, and how they are consumed by the users.

Traditionally the lifecycle in a datacenter goes from ``Managed by You`` to ``Vendor Managed``  as demonstrated in the picture below.

XaaS : Anything as service
----------------------------

With the advent of cloud your infrastructure needs to cater to business requirements and be agile. You business requirements to `XaaS` needs to be realized. The platform (runtime, middleware, services..) can be provided as a services which improved agility of your business.


|cloud xaas|

Megam provides the PaaS for enterprise both public and private which can help you achive XaaS.

Define Megam
--------------

The below illustration shows ``How PaaS works`` and how we handle it in megam. All the plumbing work needed to setup an application and services are handled by Megam on the cloud of choice.

|define megam|

The virtual machine that has an operating system contains application and services with features of scaling, high availability, application performance monitoring built in.

Managed VM
-----------

When your apps/services are running in the cloud, Megam provides a scalable number of instances of your app's modules. Each instance runs in its own hosting environment.

The Managed VM hosting environment lets you run apps/services on configurable IaaS (Compute). This VM-based hosting environment offers more flexibility and provides more CPU and memory options. Applications that run on Managed VMs, are not subject to runtime restrictions and they have access to all the IaaS machine types. You can also add third-party libraries and frameworks to your app.


|megam manage vm|

With containers getting more traction we offer a way to run ``containers`` using ``Docker`` in a managed VM. The VM's can have ``multitenant`` containers runing in an isolated way.


.. |megam manage vm| image:: /images/megam_manage_vm.png
.. |define megam| image:: /images/define_megam.png
.. |cloud xaas| image:: /images/cloud_xaas.png
