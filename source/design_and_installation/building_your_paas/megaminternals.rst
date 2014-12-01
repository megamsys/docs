.. _megaminternals:

================================================================================
Megam Internals
================================================================================

This guide is meant for the cloud architect and administrator, to help him to understand the way Megam Internals perates in the infrastructure resources, and how they are consumed by the users.

Firstly we'll need a way to describe the IT services. The usual way is come up with a  specification which defines a metamodel for defining IT services. This metamodel defines both the structure of a IT service as well as how to manage it.


The metamodel description can either be imperative or declarative.

Imperative style
-----------------
An imperative styled scenario is more appealing to a reader who wishes to understand the “Hows” of the system because it is generally detailed around the mechanism whereas a reader who just wants to understand the “Whats” of a system would prefer a declarative style.

The picture below illustrates the imperative style  where an user wants to realize the business function that composes of `Java app - Tomcat` and `SQlite db`. In this scenario an user needs to describe the step by step activity on how it would happen to a system.

Declarative style
------------------

Declarative style is a non-imperative style in which you describe their desired results without explicitly listing steps that must be performed.

The picture below illustrates the declarative style  where an user wants to realize the business function that composes of `Java app - Tomcat` and `SQlite db`. In this scenario an user needs to describe just where they want to get to, "I want a Java App using Tomcat + DB".

|Megam Style Declarative|

Megam uses a mix of "Declarative" and "Imperative style" to realize any business function. In the subsequent sections we'll see how the metamodel can be described using standards.

.. _tosca:

Standards
==========

Our declarative specification will be compliant with :

`TOSCA(Topology for orchestration of cloud applications) <http://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.0/TOSCA-Simple-Profile-YAML-v1.0.html>`_
    We found that TOSCA wasn't API friendly. Its use case was more fit for a Command Line(CLI) will be compliant to TOSCA.
This core TOSCA specification provides a language to describe service components and their relationships using a service topology, and it provides for describing the management procedures that create or modify services using orchestration processes. The combination of topology and orchestration in a Service Template describes what is needed to be preserved across deployments in different environments to enable interoperable deployment of cloud services and their management throughout the complete lifecycle (e.g. scaling, patching, monitoring, etc.) when the applications are ported over alternative cloud environments.

`CAMP(Cloud application management for platforms) <http://docs.oasis-open.org/camp/camp-spec/v1.1/camp-spec-v1.1.html>`_
  Our API will adhere to CAMP. Not all the specification made sense to Megam. So we cherry picked and implemented the ones which were relevant to us.

For PaaS consumers this CAMP management API would have the following benefits:
    “Portability between clouds” is emerging as one of the primary concerns of cloud computing. By standardizing the management API for the use cases around deploying, stopping, starting, and updating applications, this specification increases consumers’ ability to port their applications between PaaS offerings.
It is likely that implementations of this specification will appear as plugins for application development environments (ADEs) and application management systems. Past experience has shown that, over time, such generic implementations are likely to receive more attention and be of higher quality than the implementations written for solitary, proprietary application management interfaces.

For PaaS providers this CAMP management API would have the following benefits:
    Because the strength and features of a PaaS offering’s application management API are unlikely to be perceived as key differentiators from other PaaS offerings, the existence of a consensus management API allows providers to leverage the experience and insight of the specification’s contributors and invest their design resources in other, more valuable areas.
    By increasing the portability of applications between PaaS offerings, this management API helps “grow the pie” of the PaaS marketplace by addressing one of the key pain points for PaaS consumers.

What is the compelling need  to use standards ?
---------------------------------------------
As we have progressed to deliver the initial set out milestones, adding more features need adherence to standards, integrating with Openstack, Opennebula, Heat and any other.

-  **Densely packed VM** (One VM supporting multiple applications, databases, queues or anything that are connected and policies(like scaling, ha, backup ..) applied to it).
-  Implementing a visual designer needs a standard approach to compose mix and match apps, databases, queues, or any thing in a VM or multiple VM.
-  Detecting failures, and policy driven updates to restart them, stop them is missing in the current design. The failures can span across any cloud any VM.

What does it help a customer  ?
---------------------------------
-  **Densely packed VM** provides more value (Compose multiple things in one VM. Typical scenario is Liferay or wordpress in one VM)
-  From the visual designer customer can compose apps, services, load balancers on cloud.

We will use the following basic terminology when we declare business IT services in Megam. Let us define them first.

assemblies
-----------
An **assemblies** represents a bunch of Assembly. It represents the running applications.Read about `Assemblies from the CAMP standard <http://docs.oasis-open.org/camp/camp-spec/v1.1/cs01/camp-spec-v1.1-cs01.html#_Toc403920631>`__.


assembly
-----------
An **assembly** is a management resource that represents the running application. Read about `Assembly from CAMP standard <http://docs.oasis-open.org/camp/camp-spec/v1.1/cs01/camp-spec-v1.1-cs01.html#Assembly>`__.


components
-----------
A **component** represents a runtime component. Read about `Components from CAMP specification <http://docs.oasis-open.org/camp/camp-spec/v1.1/cs01/camp-spec-v1.1-cs01.html#_Toc403920632>`__.



Densely Packed VM
=====================

|megam_densely_vms|

An user who uses Megam has two options

One VM
  Every app or service needs a single VM or container

Densely packed VM
  Any number of  app or service can run inside a VM.

.. image:: /images/1.png
   :scale: 60 %
   :alt: Ceph OSD Logo
   :align: left

In this scenario in a host (which is your bare-metal server (or) a public cloud) there is ``one VM`` with an assembly launced in subd.domain.com with components `C1, C2, C3`.

- The components can be an app or a service. Read about apps in the users guide.

.. image:: /images/2.png
   :scale: 60 %
   :alt: Ceph OSD Logo
   :align: left

In this scenario there are two hosts (which is your bare-metal server (or) a public cloud) there are ``two  VMs`` with an assembly with components `C1, C2` linked.

- The components can be an app or a service. Read about apps in the users guide.

.. image:: /images/3.png
   :scale: 60 %
   :alt: Ceph OSD Logo
   :align: left

In this scenario there are two hosts (which is your bare-metal server (or) a public cloud) there are ``two  VMs`` with an assembly with multi components `C1, C2, C3` in each and C3 component is linked to C1.

The components can be an app or a service. Read about :ref:`apps in users guide <appsguide>`.


+-------------------+-------------------+----------------+--------------------------------------------+
|     Component     |     Component     |   Type         |           Examples                         |
+===================+===================+================+============================================+
|     app           |     service       |  db            | A Play  app consuming Riak                 |
+-------------------+-------------------+----------------+--------------------------------------------+
|     app           |     services      |  db, mq        | A Rails app consuming PostgreSQL, RabbitMQ |
+-------------------+-------------------+----------------+--------------------------------------------+
|     app           |     service       | db endpoint    | A Rails app consuming PostgreSQL service   |
+-------------------+-------------------+----------------+--------------------------------------------+
|     app           |     services      | db, mq endpoint| A Rails app consuming PostgreSQL service   |
|                   |                   |                | and RabbitMQ service                       |
+-------------------+-------------------+----------------+--------------------------------------------+

All services are an ``Endpoint`` to the application which binds it to.


Scenario : User creates New Assembly
------------------------------------

This example illustrates a scenario in which the application administrator wants to run and monitor an application. It assumes that the application package(CSAR) is made available to Megam, either because it was uploaded to the platform or developed directly on the platform.

The Megam  API is a RESTful service to create, control and manage cloud application and services using an implementation of the `OASIS API API specification <https://www.oasis-open.org/committees/camp>`__ based on the `public draft 02 <http://docs.oasis-open.org/camp/camp-spec/v1.1/camp-spec-v1.1.html>`__. This implementation also includes Megam specific extensions.

The purpose of the Megam API is to manage the building, running, administration, monitoring and patching of applications/services in the cloud. Its purpose is to enable interoperability among self-service interfaces to PaaS clouds by defining artifacts and formats that can be used with any conforming cloud and enable independent vendors to create tools and services that interact with any conforming cloud using the defined interfaces.

|Megam API Usecase New|



TOSCA
------

The other standard which we follow for declaration is TOSCA.

Read about

-  `TOSCA Primer <http://docs.oasis-open.org/tosca/tosca-primer/v1.0/cnd01/tosca-primer-v1.0-cnd01.html>`__
-  `TOSCA Simple Profile YAML <http://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.0/csd01/TOSCA-Simple-Profile-YAML-v1.0-csd01.html>`__

A Topology Template (also referred to as the topology model of a service) defines the structure of a service.

A Topology Template consists of a set of Node Templates and Relationship Templates that together define the topology model of a service as a (not necessarily connected) directed graph.


``NodeTemplate:`` This element specifies a kind of a component making up the cloud application.A Node Template specifies the occurrence of a Node Type as a component of a service.

``NodeType:`` This element specifies a type of Node that can be referenced as a type for Node Templates of a Service Template. A Node Type defines the properties of such a component (via Node Type Properties) and the operations (via Interfaces) available to manipulate the component. Node Types are defined separately for reuse purposes and a Node Template references a Node Type and adds usage constraints, such as how many times the component can occur.

``RelationshipType:`` This element specifies a type of Relationship that can be referenced as a type for Relationship.

``RequirementType:`` This element specifies a type of Requirement that can be exposed by Node Types used in a Service Template.


Overlap
--------

There is an overlap between CAMP and TOSCA. So internally we store in the CAMP format. There is an adapter that takes the TOSCA input and stores it as a CAMP resource in Megam.

The mapping we adhere to is as shown below.

|Megam API Resources|


Archive Format for Cloud Applications (CSAR)
---------------------------------------------

In order to support in a certain environment the execution and management of the lifecycle of a cloud application, all corresponding artifacts have to be available in that environment. This means that beside the service template of the cloud application, the deployment artifacts and implementation artifacts have to be available in that environment. To ease the task of ensuring the availability of all of these, this specification defines a corresponding archive format called CSAR (Cloud Service ARchive).



Scenario : User uploads a CSAR using CLI
------------------------------------------

This example illustrates a scenario in which the application administrator wants to run and monitor an application. It assumes that the application package(CSAR) is made available to Megam, either because it was uploaded to the platform or developed directly on the platform.

|Megam API Usecase Import|

**Read about :ref:`CLI <megamdsl>`**

.. |megam_densely_vms| image:: /images/megam_densely_vms.png
.. |megam_densely_multiapp_assemblies| image:: /images/megam_densely_multiapp_assemblies.png
.. |megam_densely_comps_composed| image:: /images/megam_densely_comps_composed.png
.. |megam_densely_multiapp_composed| image:: /images/megam_densely_multiapp_composed.png
.. |Megam Style Declarative| image:: /images/style_declarative_imperative.png
.. |Megam API Resources| image:: /images/megam_camp_tosca_compared.png
.. |Megam API Usecase Import| image:: /images/megam_camp_usecase_import.png
.. |Megam API Usecase New| image:: /images/megam_camp_usecases_new.png
