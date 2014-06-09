.. _tosca:

================================================================================
Designing Using Megam TOSCA
================================================================================

This guide is meant for the cloud architect and administrator, to help design using Megam TOSCA and operationalize the infrastructure resources, and how they are consumed by the users.


For cloud services to be portable, their management must also be portable to the targeted environment, as must the application components themselves.


Megam Designer is a graphically modeling evironment to model TOSCA topologies and plans managing these topologies. It consisits of :

-  **CSAR(Cloud Service Archive) management**
-  **Topology modeler** : The topology modeler enables to create service templates. Service templates consist of instances of node types (node templates) and instances of relationship types (relationship templates). They can be annotated with requirements and capabilities, properties, and policies.The repository stores TOSCA models and allows managing their content. For instance, node types, policy types, and artifact templates are managed by the repository. The repository is also responsible for importing and exporting CSARs, the exchange format of TOSCA files and related artifacts.
-  **TOSCA plan modeler**



Core Concepts
==============

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

Further information
===================

-  `TOSCA Primer <http://docs.oasis-open.org/tosca/tosca-primer/v1.0/cnd01/tosca-primer-v1.0-cnd01.html>`__
-  `TOSCA Simple Profile YAML <http://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.0/csd01/TOSCA-Simple-Profile-YAML-v1.0-csd01.html>`__
-  :ref:`Main Documentation <entry_point>`
