.. _intropaas:

==========================
An Overview of Megam
==========================

Cloud computing offers a compelling cost-effective model for businesses that wish to host their applications and services in an environment where it can scale to meet their customer demands while reducing their need in maintaining the overhead of large datacenters and their operations.

|traditional vs cloud|

A typical server consolidation scenario is shown above, but for businesses to increase their time to market the business requirements needs to be converted to apps/service faster.


**Megam is the easy way to automate and manage your cloud**


  Cloud In a Box automates private cloud with Megam in a single click userinterface. The typical 4 server node setup can be automated in minutes with compute, storage and cloud orchestration in your private data center.  Best of all we also have hardware parter who can provide the top class hardware suitable for Megam.

  An open source cloud orchestration platform for languages/frameworks like Java, Ruby, Play(Scala), Akka, and
  services like PostgreSQL, Riak, Redis and a rich marketplace.

  Exploring the cloud has never been simpler. You can deploy an application
  without requiring any hacks or workarounds in few seconds from your source control in `Github <http://github.com>`__, `Bitbucket <https://bitbucket.org>`__, `Assembla <https://www.assembla.com>`__ and `SCM Manager <https://scm-manager.org>`__.
  and using an awesome visual designer.

  Best of all, take as much time as you like, because it’s all free.
  (Oh, and you can show off your applications to your friends, or run applications for your own)

  Cloud orchestration platform is standardized based on CAMP(Cloud Application Management for Platforms) and TOSCA (Topology and Orchestration Specification for Cloud Applications)

OpenNebula - IaaS
------------------

Megam uses a built-in Infrastructure as a service(IaaS) to automate upon it. The IaaS used for a private datacenter is `OpenNebula <http://opennebula.org>`_.

See :ref:`Overview of OpenNebula <opennebula>` for more information.


|megam opennebula|


There are 3 ways in using Megam.

1. Private Megam
----------------

Megam can be installed in your private data center.

..  note:: For more information on  :ref:`Installation <plan>`


2. Cloud in a Box
-----------------

Megam can be bought as an ``Appliance like``, ``Cloud ready - Platform as Services`` on supported hardware vendors or in your hardware using our do-it-yourself cloud ready technology.

..  note:: For more information on  :ref:`Introduction <introcib>`


3. Public Megam
---------------

Go ahead and try us out.

**Creating a Public Megam account**

Creating a Public Megam account is very straightforward.

* Go to the  `www.megam.co <https://www.megam.co>`_.
* Click on the "Create new account ?" button to open the signup form
* Enter a valid email address/password (twice)



What Are the Key Features Provided by Megam ?
=================================================

+-------------------------------------+--------------------------------------------------------------------------------------------------+
|          Features                   |                                          Description                                             |
+=====================================+==================================================================================================+
| ``Cloud In a Box``                  | Real quick do-it-yourself-cloud  ready                                                           |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Apps & Services``                 | Support for platform runtime,  marketplace                                                       |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Multi cloud support``             | Multi Cloud support using our Cloud Gateway. We currently support AWS, hp, Google,               |
|                                     | Profitbricks, OpenNebula. Virtually any cloud can be supported.                                  |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Visual Designer``                 | Yes. compose and wire your app & services in multi cloud                                         |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Services``                        | Support for services like PostgreSQL, Redis, Riak                                                |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Diaster Recovery``                | High availability for your  Apps/Services  using DRBD                                            |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``DNS``                             | Auto DNS for the apps/services in Megam SaaS                                                     |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``SCM``                             | Github, Bitbucket, Assembla, SCM-Manager                                                         |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Easy to use CLI``                 | Ruby based very easy to use CLI `(work in progress)`                                             |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Fast Provisioning Using Chef 11`` | The apps/services are provisioned using Chef 11 native, which makes it powerful and              |
|                                     | extendable cloud automation with benefits. Chef Recipes are blueprints that tell Megam           |
|                                     | all the details needed to run an application – which middleware services to run, what the        |
|                                     | dependencies are between the services, how to install the services, where to find the application|
|                                     | and service binaries, when to spawn more instances or terminate existing ones, and even how to   |
|                                     | monitor each of the services.                                                                    |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Marketplace``                     | A single click launch of pre-built popular apps like Wordpress, PostgreSQL, Riak, Redis,         |
|                                     | SCM-Manager and many more.                                                                       |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Disaster Recovery``               | Build highly available apps on any cloud using `DRBD <http://www.drbd.org>`.                     |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Real-time Log & Offline``         | You will be able to stream logs, and do analytics on the offline logs.                           |
+-------------------------------------+--------------------------------------------------------------------------------------------------+
| ``Metering Monitoring``             | You will be able to monitor and meter the servers for free.                                      |
+-------------------------------------+--------------------------------------------------------------------------------------------------+

`For more information <http://www.gomegam.com>`_.


What Does Megam Offer to Cloud Consumers?
==============================================

Cloud Consumers benefit directly by the simple efficient flexible way of launching apps/services in cloud(public/private) These benefits include:

-  **More choices and flexibility in Cloud Provider.**
-  **Lower set-up and operational costs from automation**


What Does Megam Offer to Cloud Providers?
==============================================


Cloud Providers benefit indirectly from the standardization of launching apps/services and adhering to standards like TOSCA. These benefits include:

-  **Improvide migration from a cloud provider to another which means portability of app/services becomes a reality.**
-  **Increased usage of the IaaS resources resulting in a higher ROI**
-  **More new customers trying out cloud**

What Does Megam Offer to Cloud Integrators?
================================================


Cloud Integrators benefit indirectly from accessing Megam. These benefits include:

-  **Build and improve Megam for your own need using the powerful REST API.**

.. |traditional vs cloud| image:: /images/traditional_vs_cloud.png
.. |megam opennebula| image:: /images/iaas_plus_paas.png
