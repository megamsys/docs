.. _plan:

==========================
Planning the Installation
==========================

In order to get the most out of Megam, we recommend that you create a plan with the features, performance, scalability, and high availability characteristics you want in your deployment. This guide provides information to plan a Megam installation, so you can easily architect your deployment and understand the technologies involved in the management of Megam.

Architectural Overview
======================

Megam assumes that your physical infrastructure adopts a classical cluster-like architecture with a front-end, and a set of hosts where Virtual Machines (VM) will be executed.

|high level architecture of cluster, its components and relationship|

Megam presents a highly modular architecture that offers broad support for commodity and enterprise-grade applications, services. This guide briefly describes the different choices that you can make for the management of the different subsystems.

|logical architecture|

.. _nilavu:

Megam Core
-----------

This component holds the ```User interface``  and ``Gateway(API server)`` accessed by end users. This component needs network connectivity, and access to the Datastores.

.. warning:: Note that these components communicate through REST and may be installed in different machines for security or performance reasons

The default database is Sqllite. If you are planning a production or medium to large scale deployment, you should consider using PostgreSQL.

Additionally Gateway uses a NOSQL datastore.

-  **Userinterface/Command line** that provides a  web or command line interface to Megam.
-  **Gateway** is the core api server.
-  **Datastore(s)** that hold the data of Megam specific apps, services, cloud provider details.

.. _megamengine:

Megam Engine
-------------

This component holds the engine can be accessed by ``Megam Core``. This component needs network connectivity, and access to the Datastores, Messaging.

-  **Messaging** that provides a robust messaging for interacting with the Megam platform.
-  **Engine** that provides a standardized runtime adhering to TOSCA standards. Includes a ``Policy Manager`` which manages the ``Feedback Streams``.

.. warning:: Note that these components communicate through Messaging and may be installed in different machines for security or performance reasons


Megam Analytics
----------------

This component holds the logs aggregated by the apps/services running on cloud. This holds both the realtime and offline logs. Additionally

Health check can be configured using Ganglia.

.. warning:: Note this component is optional.

If you are interested in setting up a highly available cluster for Megam, buy the ``Cloud In a Box`` solution.

.. |high level architecture of cluster, its components and relationship| image:: /images/megam_high.png
.. |logical architecture| image:: /images/logical_architecture.png
