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

Our declarative specifiation will be compliant with :

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
Assemblies represents a bunch of Assembly. This descends from the standard. Read about Assemblies from the CAMP standard.


assembly
-----------
A assembly acts as a container for the assembly resources on this platform. This resource has the following, general representation:


components
-----------
A component represents a runtime component. This resource has the following, general representation:



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

- The components can be an app or a service. Read about apps in the users guide.



Endpoint:

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

-  Every placementgroup has a subdomain.domain name : eg: something.megam.co
-  Every component has a name.
-  Every app gets invoked via an url subdomain.domainname/componentname
-  Every db will have a db specific url for the database.
-  Every dbserver can be accessed from a different port.


On receiving such a request Megam unpacks the application package(PDP), parses and validates the deployment plan, resolves the service dependencies described by that plan and starts the application. On successful start the platform creates a new resource representing the running application (assembly) and provides the URL of that resource "/my_paas/assembly/1" in the response as shown below.




Scenario : User creates New Assembly
------------------------------------
This example illustrates a scenario in which the application administrator wants to run and monitor an application. It assumes that the application package(PDP) is made available to Megam, either because it was uploaded to the platform or developed directly on the platform.

The Megam  API is a RESTful service to create, control and manage cloud application and services using an implementation of the `OASIS API API specification <https://www.oasis-open.org/committees/camp>`__ based on the `public draft 02 <http://docs.oasis-open.org/camp/camp-spec/v1.1/camp-spec-v1.1.html>`__. This implementation also includes Megam specific extensions.

The purpose of the Megam API is to manage the building, running, administration, monitoring and patching of applications/services in the cloud. Its purpose is to enable interoperability among self-service interfaces to PaaS clouds by defining artifacts and formats that can be used with any conforming cloud and enable independent vendors to create tools and services that interact with any conforming cloud using the defined interfaces.

|Megam API Usecase New|

**What is created by the user ?** An user working on an application development environment(ADE) (or) on Cloud uploads a `/assembly (json) -<link it to assembly>` with the CAMP Provider through the platform_endpoint. In a multi tenant model, the roles (Developer, Application Administrator) and what these role are capable off are handled by an Identity product.



Overlap
--------

|Megam API Resources|



TOSCA
------

A Topology Template (also referred to as the topology model of a service) defines the structure of a service.

A Topology Template consists of a set of Node Templates and Relationship Templates that together define the topology model of a service as a (not necessarily connected) directed graph.



``ServiceTemplate:`` This element specifies a complete Service Template for a cloud application. A Service Template contains a definition of the Topology Template of the cloud application. Within the Service Template, any type definitions (e.g. Node Types, Relationship Types, etc.) defined in the same Definitions document or in imported Definitions document can be used.

``TopologyTemplate:`` This element specifies the overall structure of the cloud application defined by the Service Template, i.e. the components it consists of, and the relations between those components. The components of a service are referred to as Node Templates, the relations between the components are referred to as Relationship Templates.

``NodeTemplate:`` This element specifies a kind of a component making up the cloud application.A Node Template specifies the occurrence of a Node Type as a component of a service.

``NodeType:`` This element specifies a type of Node that can be referenced as a type for Node Templates of a Service Template. A Node Type defines the properties of such a component (via Node Type Properties) and the operations (via Interfaces) available to manipulate the component. Node Types are defined separately for reuse purposes and a Node Template references a Node Type and adds usage constraints, such as how many times the component can occur.

``RelationshipType:`` This element specifies a type of Relationship that can be referenced as a type for Relationship.

``RequirementType:`` This element specifies a type of Requirement that can be exposed by Node Types used in a Service Template.

``CapabilityType:`` This element specifies a type of Capability that can be exposed by Node Types used in a Service Template.

``ArtifactType:`` This element specifies a type of artifact used within a Service Template. Artifact Types might be, for example, application modules such as .war files or .ear files, operating system packages like RPMs, or virtual machine images like .ova files.

``PolicyType:`` This element specifies a type of Policy that can be associated to Node Templates defined within a Service Template. For example, a scaling policy for nodes in a web server tier might be defined as a Policy Type, which specifies the attributes the scaling policy can have.

``PolicyTemplate:`` This element specifies a template of a Policy that can be associated to Node Templates defined within a Service Template. Other than a Policy Type, a Policy Template can define concrete values for a policy according to the set of attributes specified by the Policy Type the Policy Template refers to.


Portability of Service Templates
-----------------------------------

Standardizing Service Templates supports the portability of definitions of IT Services. Here, portability denotes the ability of one cloud provider to understand the structure and behavior of a Service Template created by another party, e.g. another cloud provider, enterprise IT department, or service developer.

Service Composition
--------------------

Standardizing Service Templates facilitates composing a service from components even if those components are hosted by different providers, including the local IT department, or in different automation environments, often built with technology from different suppliers.


Service Templates and Artifacts
--------------------------------

An artifact represents the content needed to realize a deployment such as an executable (e.g. a script, an executable program, an image), a configuration file or data file, or something that might be needed so that another executable can run (e.g. a library). Artifacts can be of different types, for example EJBs or python scripts.

Requirements and Capabilities
--------------------------------

TOSCA allows for expressing requirements and capabilities of components of a service. This can be done, for example, to express that one component depends on (requires) a feature provided by another component, or to express that a component has certain requirements against the hosting environment such as for the allocation of certain resources or the enablement of a specific mode of operation.
Requirements and capabilities are modeled by annotating Node Types with Requirement Definitions and Capability Definitions of certain types. Requirement Types and Capability Types are defined as reusable entities so that those definitions can be used in the context of several Node Types.

For example, a Requirement Type ``DatabaseConnectionRequirement`` might be defined to describe the requirement of a client for a database connection. This Requirement Type can then be reused for all kinds of Node Types that represent, for example, application with the need for a database connection.

Policies in TOSCA
-------------------

Non-functional behavior or quality-of-services are defined in TOSCA by means of policies. A Policy can express such diverse things like monitoring behavior, payment conditions, scalability, or continuous availability, for example.
A Node Template can be associated with a set of Policies collectively expressing the non-functional behavior or quality-of-services that each instance of the Node Template will expose.

Archive Format for Cloud Applications
---------------------------------------

In order to support in a certain environment the execution and management of the lifecycle of a cloud application, all corresponding artifacts have to be available in that environment. This means that beside the service template of the cloud application, the deployment artifacts and implementation artifacts have to be available in that environment. To ease the task of ensuring the availability of all of these, this specification defines a corresponding archive format called CSAR (Cloud Service ARchive).


TOSCA/CAMP terms.
------------------
CSAR:
  Cloud service archive which has the declarative representation of a cloud application/service (This can be imagined as an equivalent to a UML (unified modeling language) model).

Assemblies
  A group  of application and services and their declaration.
Eg: app + db + <some installable> + <details on managing them>

Components
  An application or a service that can be assembled.
Eg: java app,  postgresql db

வரை (visual designer project) : A visual designer which allows visually composing or drawing apps + services in anyway the user wants. Some of the options that can be availed are shown in Figure 1.
P (parent) represents a VM.
C1..Cn represents children. This can an app/any service that runs inside a VM.


Actors
--------------------

Service Creator
  Is in charge of creating and maintaining the Cloud service archive. After the CSAR has been created, the service creator can publish it, for instance, on a marketplace.
Eg: Can be a 3rd party or our partner.

Service Provider
  Retrieves the Cloud service archive. After retrieving the CSAR, the service provider customizes and deploys a service instance to the infrastructure. The service provider continuously manages the service instance.

Service Consumer
  Can access and use the service instance once it has been deployed by the service provider.

Cloud Provider
  Is in charge of providing the infrastructure to where a Cloud service archive can be deployed.

Functional requirements for CAMP/TOSCA
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Management of Cloud Service Archives
  TOSCA container implementation needs to store Cloud service archives that get loaded into the container in order to deploy and manage service instances based on those CSARs. In addition, the service template inside a CSAR needs to be parsed to create a service model that can be processed by other units in the TOSCA container such as the instance management unit and the inner management unit.

Instance Management of Infrastructure Resources
  To run a service speciﬁed by a TOSCA service template, infrastructure resources have to be instantiated. Examples for such resources are virtual machines, a storage service, or a relation between two applications running on diﬀerent machines. Furthermore, all instances have to be manageable by the TOSCA container. This includes monitoring and deprovisioning of running instances.

Repository and Engine for Management Plans
  A TOSCA container needs to store management plan models in a repository. These models can be instantiated to run a particular management plan by the engine. A management plan is something that manages instances instantiated via csars. Our API allows storing the plans as workflows in datastore (Riak).

Workflows. http://workflowpatterns.com
  A simple evented model like the http://riemann.io/quickstart.html  and also see how onegate fits.
At this point Onegate just records the events  http://docs.opennebula.org/4.6/advanced_administration/application_insight/onegate_usage.html
We needs ability to trigger  us to process workflows when failures happen.


Scenario : User uploads a CSAR
--------------------------------

This example illustrates a scenario in which the application administrator wants to run and monitor an application. It assumes that the application package(PDP) is made available to Megam, either because it was uploaded to the platform or developed directly on the platform.

|Megam API Usecase Import|

**What is imported by the user ?** An user working on an application development environment(ADE) (or) on Cloud uploads a CSAR (yaml) with the CAMP Provider through the platform_endpoint. In a multi tenant model, the roles (Developer, Application Administrator) and what these role are capable off are handled by an Identity product.



Further information
===================

-  `TOSCA Primer <http://docs.oasis-open.org/tosca/tosca-primer/v1.0/cnd01/tosca-primer-v1.0-cnd01.html>`__
-  `TOSCA Simple Profile YAML <http://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.0/csd01/TOSCA-Simple-Profile-YAML-v1.0-csd01.html>`__
-  :ref:`Main Documentation <entry_point>`

.. |megam_densely_vms| image:: /images/megam_densely_vms.png
.. |megam_densely_multiapp_assemblies| image:: /images/megam_densely_multiapp_assemblies.png
.. |megam_densely_comps_composed| image:: /images/megam_densely_comps_composed.png
.. |megam_densely_multiapp_composed| image:: /images/megam_densely_multiapp_composed.png
.. |Megam Style Declarative| image:: /images/style_declarative_imperative.png
.. |Megam API Resources| image:: /images/megam_camp_tosca_compared.png
.. |Megam API Usecase Import| image:: /images/megam_camp_usecase_import.png
.. |Megam API Usecase New| image:: /images/megam_camp_usecases_new.png
