.. _plan:

==========================
Planning the Installation
==========================

In order to get the most out of Megam, we recommend that you create a plan with the features, performance, scalability, and high availability characteristics you want in your deployment. This guide provides information to plan a Megam installation, so you can easily architect your deployment and understand the technologies involved in the management of Megam.

Architectural Overview
======================

Megam assumes that your physical infrastructure adopts a classical cluster-like architecture with a front-end, and a set of hosts where Virtual Machines (VM) will be executed.

|high level architecture of cluster, its components and relationship|

The basic components of a Megam system are:

-  **Userinterface/Command line** that provides a  web or command line interface to Megam.
-  **Gateway** is the core api server.
-  **Datastore(s)** that hold the data of Megam specific apps, services, cloud provider details.
-  **Messaging** that provides a robust messaging for interacting with the Megam platform.
-  **TOSCA Engine** that provides a standardized runtime adhering to TOSCA standards. Also includes a ``Policy Manager`` which manages the ``Feedback Streams``.
-  **Log Aggregator** that aggregates the logs in the virtual machines and ferries them to the UI.
-  **Health Check** that provides basic server monitoring.

Megam presents a highly modular architecture that offers broad support for commodity and enterprise-grade applications, services. This guide briefly describes the different choices that you can make for the management of the different subsystems.

.. _nilavu:

Megam Core
-----------

The machine that holds the Megam user interface can be accessed by end users. This machine needs network connectivity, and access to the Datastores.

Megam services include:

- **Gateway (megam_gateway)**
- **Web interface server (nilavu)**
- **Log Aggregator & Analytics (tap)**
- **Health Check (Ganglia)**

.. warning:: Note that these components communicate through REST and may be installed in different machines for security or performance reasons

Megam’s default database uses PostgreSQL. If you are planning a production or medium to large scale deployment, you should consider using PostgreSQL.
``Work in progress`` to support sqllite as the default database.

Megam's Gateway uses a NOSQL datastore.

.. _megamengine:

Megam Engine
-------------

The machine that holds the Megam engine can be accessed by ``Megam core``. This machine needs network connectivity, and access to the Datastores.

Megam services include:

- **Tosca engine (herk)**
- **Cloud Provisioner(Chef)**

.. warning:: Note that these components communicate through Messaging and may be installed in different machines for security or performance reasons


Megam Analytics
----------------

The machine that holds the Megam logs aggregated by the apps/services running on the VM. This holds both the realtime and offline logs. Additionally
Health check can be configured using Ganglia.

Megam services include:

- **Log Aggregator & Analytics (tap)**
- **Health Check (Ganglia)**

.. warning:: Note this component is optional.

If you are interested in setting up a high available cluster for Megam, check the High Megam Availability Guide.

.. |high level architecture of cluster, its components and relationship| image:: /images/megam_high.png
