.. _intropaas:

==========================
An Overview of Megam
==========================

Cloud computing offers a compelling cost-effective model for businesses that wish to host their applications and services in an environment where it can scale to meet their customer demands while reducing their need in maintaining the overhead of large datacenters and their operations.


**Megam is the easy way to manage/orchestrate apps, services on Cloud.**
  An open source cloud orchestration platform for languages/frameworks like Java, Ruby, Play(Scala), Akka, and
  services like PostgreSQL, Riak, Redis.

  Exploring the cloud has never been simpler. You can deploy an application
  without requiring any hacks or workarounds in few seconds from your source control in `Github <http://github.com>`__, `Bitbucket <https://bitbucket.org>`__, `Assembla <https://www.assembla.com>`__ and `SCM Manager <https://scm-manager.org>`__.

  Best of all, take as much time as you like, because it’s all free.
  (Oh, and you can show off your applications to your friends, or run applications for your own)

  Megam is application and service composition is standardized based on TOSCA (Topology and Orchestration Specification for Cloud Applications).

There are 3 ways in using Megam.

1. Private Megam
----------------

Megam can be installed in your private data center.

..  note:: **This is a work in progress.** For more information on  :ref:`Installation <plan>`


2. Cloud in a Box
-----------------

Megam can be bought as an ``Appliance like``, ``Cloud ready - Platform as Services`` in a pre installed, integrated hardware ready to go.

..  note:: **This is a work in progress.** For more information on  :ref:`Introduction <introcib>`


3. Public Megam
---------------

Go ahead and try us out.

**Creating a Public Megam account**

Creating a Public Megam account is very straightforward.

* Go to the  `www.megam.co <https://www.megam.co>`_.
* Click on the "Need accout ? Register here" button to open the registration form
* Enter a valid email address, a password (twice)

Welcome to Megam - Open source cloud orchestration

**Cloud**
  Multi Cloud support using our Cloud Gateway. Our Cloud Gateway server is built on a rock solid trusted JVM and concise Scala.
  We currently support AWS, hp, GCE, Podnix, Profitbricks, OpenNebula. Virtually any cloud can be supported.

* For more information Go to `www.gomegam.com <http://www.gomegam.com>`_.

**Easy to use**
   +------------------------+---------------------------------------------------------------------+
   |                        | Description                                                         |
   |                        |                                                                     |
   +========================+=====================================================================+
   | Web                    | `www.megam.co <https://www.megam.co>`_.                             |
   +------------------------+---------------------------------------------------------------------+
   | Command Line(CLI)      | Ruby based very easy to use CLI which stands up an application (or) |
   |                        | service in Cloud in minutes.`(work in progress)`                    |
   +------------------------+---------------------------------------------------------------------+

**Fast Provisioning Using Chef 11**
  The apps/services are provisioned using Chef 11, which makes it powerful and extendable cloud automation with benefits.
  Chef Recipes are blueprints that tell Megam all the details needed to run an application – which middleware services to run,
  what the dependencies are between the services, how to install the services, where to find the application and service binaries,
  when to spawn more instances or terminate existing ones, and even how to monitor each of the services.


**Marketplace**
  A single click launch of pre-built popular apps like Wordpress, PostgreSQL, Riak, Redis, Jenkins, SCM-Manager and more to come.

**Disaster Recovery**
  Build highly available apps on any cloud using `DRBD <http://www.drbd.org>`.

**Real-time Log & Offline**
  You will be able to stream logs, and do analytics on the offline logs.

**Metering Monitoring**
  You will be able to monitor and meter the servers for free.

Megam can be accessed at `megam.co <https://www.megam.co>`_, here is the `project source code <https://github.com/megamsys>`_.

**NEW**
  *Megam 0.5 Work in progress*.
  :ref:`Current Development Release notes <rnguide>`

  *Megam 0.4 released - May 07, 2014*.
  :ref:`Release notes <rnguideprev>`

  *Megam 0.3 beta released - April 14, 2014*.
  `Release notes <http://blog.megam.co/archives/1358>`_.

  *Megam 0.2 beta released - Mar 28, 2014*.
  `Release notes <http://blog.megam.co/archives/1306>`_.

  *Megam 0.1 beta released*.

  This is our first release which introduces a more friendly graphical user interface.


What Are the Key Features Provided by Megam ?
=================================================

+------------------------------+------------------------------------+
|          Features            |          Megam                     |
+==============================+====================================+
| ``Apps & Services``          | Support for Ruby, Scala (Play,Akka)|
|                              | Node.js, Java                      |
+------------------------------+------------------------------------+
| ``Multi cloud support``      | EC2, GCE, Profit Bricks, Gogrid    |
|                              | Podnix, hp, OpenNebula             |
+------------------------------+------------------------------------+
| ``Intuitive Easy to use UI`` | Yes.                               |
+------------------------------+------------------------------------+
| ``Services``                 | PostgreSQL, Redis, Riak            |
+------------------------------+------------------------------------+
| ``Diaster Recovery``         | Easily recover your Apps/Services  |
|                              | using DRBD                         |
+------------------------------+------------------------------------+
| ``DNS``                      | Automatic DNS for the apps/services|
+------------------------------+------------------------------------+
| ``SCM``                      | Github, Bitbucket, Assembla,       |
|                              | SCM-Manager                        |
+------------------------------+------------------------------------+

`For more information <http://www.gomegam.com/cmp>`_.


What Does Megam Offer to Cloud Consumers?
==============================================

Cloud Consumers benefit directly by the simple efficient flexible way of launching apps/services in cloud These benefits include:

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
