.. _restapi:

======================
Megam REST API
======================

Overview
========

The Megam REST API is a API that a Platform as a Service offering presents to the consumer of the platform. The API is the interface into a platform implementation layer that controls the deployment of applications and their use of the platform.
This underlying core uses TOSCA specification provides a language to describe service components and their relationships using a service topology, and it provides for describing the management procedures that create or modify services using orchestration processes.

This guide is intended for ``developers``. The REST API is a cut-down version of CAMP (which is very close to this).


Authentication & Authorization
==============================

User authentication will be `HTTP Basic access authentication <http://tools.ietf.org/html/rfc1945#section-11>`__. The credentials passed should be the User name and password.

.. code::

    $ curl -u "username:hmacpassword" https://api.megam.co


The methods specified below are described without taking into account **4xx** (can be inferred from authorization information in section above) and **5xx** errors (which are method independent). HTTP verbs not defined for a particular entity will return a **501 Not Implemented**.

Resources
===========

Any interface that wants to talk to Megam shall do the following.

-  **platform_endpoints**: Upon installing Megam platform_endpoints are added automatically to Megam. This doesn't require authentication.
-  **platforms**: This resource has all the deployed entities on Megam for an user.
-  **assemblies**: This resource has all the assembled resources on Megam.

.. warning:: The main resources are shown above, and is the starting point for the REST API. Refer **https://api.megam.co** for more information.

|Megam CAMP Usecases|


Concept Alignment
==================

The specification CAMP and TOSCA overlap each other. CAMP is more object oriented where in reality an API needs to be RESTful.  The first step to create a filesystem dataastore is to set up a template file for it. In the following table you can see the valid configuration attributes for a filesystem datastore. The datastore type is set by its drivers, in this case be sure to add ``DS_MAD=fs``.

The other important attribute to configure the datastore is the transfer drivers. These drivers determine how the images are accessed in the hosts. The Filesystem datastore can use shared, ssh and qcow2. See below for more details.

+------------------------------+-----------------------------------+-------------------------+
|          Megam               |          TOSCA                    |       CAMP              |
+==============================+===================================+=========================+
| ``csars``                    | CSAR                              | PDP                     |
+------------------------------+-----------------------------------+-------------------------+
| ``N/A``                      | Topology/ServiceTemplate          | AssemblyTemplate        |
+------------------------------+-----------------------------------+-------------------------+
| ``nodetypes``                | NodeType                          | Service                 |
+------------------------------+-----------------------------------+-------------------------+
| ``N/A (csar.yml)``           | RelationshipType                  | N/A                     |
+------------------------------+-----------------------------------+-------------------------+
| ``N/A (csar.yml)``           | CapabilityType                    | N/A                     |
+------------------------------+-----------------------------------+-------------------------+
| ``csar.yml``                 | NodeTemplate                      | Plans                   |
+------------------------------+-----------------------------------+-------------------------+
| ``components``               | N/A                               | Components              |
+------------------------------+-----------------------------------+-------------------------+
| ``assemblies``               | N/A                               | Assemblies              |
+------------------------------+-----------------------------------+-------------------------+
| ``artifacts``                | Artifacts                         | Artifacts               |
+------------------------------+-----------------------------------+-------------------------+
| ``inputs``                   | Inputs                            | Parameters              |
| ``outputs``                  | Outputs                           |                         |
+------------------------------+-----------------------------------+-------------------------+
| ``operations``               | Interfaces                        | Operations              |
| ``sensors``                  |                                   | Sensors                 |
+------------------------------+-----------------------------------+-------------------------+

.. note:: ``Megam``  incorporating related work/concepts from TOSCA and CAMP. These specs are both evolving and there is scope for them to converge to something simple, intuitive, and powerful: this is an aim towards that convergence, and is believed to map nicely on to all (TOSCA, and CAMP), and make it easy to represent other popular tools and techniques (e.g. Juju, Puppet, Chef, Salt, Ansible).

platform_endpoints
====================

Megam concurrently offers multiple instances of the CAMP API. This is autocreated when the instance is installed. An endpoint can be explicitly be created from the command line utility **meggy**.

GET
---


.. code::


	{
	"description": "A collection of platform endpoints",
	"tags": ["megamtest", "megambeta"],
	"representation_skew": "active",
	"platform_endpoint_links": ["http://api.megam.co/v2/beta", "http://api.megam.co/v2/test"]
	}



platform_endpoint
==================

GET
----

.. code::


  {
    "description": "Platform endpoint for Megam version 0.5",
    "tags": [],
  "representation_skew": "active",
  "platform_uri": "https://api.megam.co/v2/platforms",
  "specification_version": "1.1",
  "backward_compatible_specification_versions": [],
  "implementation_version": "1.1",
  "backward_compatible_implementation_versions": [],
  "auth_scheme": "custom"
  }

csars
==================

GET
----

.. code::

  {
    "csar_items" : [{
      "description": "IoT application that talks to my car",
      "tags": [],
      "csar_link": "https://ceph.storage.co/csars/90909080000",
    },{
      "description": "Scaled Node.js application",
      "tags": [],
      "csar_link": "https://ceph.storage.co/csars/90909080000",
    }]
  }


POST
----

An YAML is uploaded to the cloud storage prior to this POST. In this example we use ceph.

.. code::


  {
    "description": "IoT application that talks to my car",
    "tags": [],
    "csar_uri": "https://ceph.storage.co/csars/90909080000"
  }


platform
===========

GET
----

.. code::

	{
  "description": "Platform ",
  "tags": [],
  "representation_skew": "Active",
  "supported_formats_uri": "https://api.megam.co/v2/formats",
  "extensions_uri": "https://api.megam.co/v2/extensions",
  "type_definitions_uri": URI,
  "platform_endpoints_uri": "https://api.megam.co/v2/beta",
  "specification_version": "1.1",
  "implementation_version": "1.1",
  "assemblies_uri": "https://api.megam.co/v2/beta/assemblies",
  "services_uri": "https://api.megam.com/v2/beta/services",
  "plans_uri": "https://api.megam.co/v2/beta/plans"
  }


assemblies
============

GET
----

.. code::

	{
  	"description": "Assemblys of my department",
	"tags": ["megamtest", "megambeta"],
  	"representation_skew": "active",
  	"assembly_links": ["/goblin.megam.co", "/goblet.megam.co"],
  	"parameter_definitions_uri": "https://api.megam.co/v2/beta/parameterdefns"
	}



assembly
===========

GET
----

.. code::

	{
  	"type": "assembly",
  	"description": "My First Java App",
  	"tags": ["java"],
  	"representation_skew": "Active",
  	"components": [ { href : "nginx", name: "Webserver" } ,
  	 { href : "nginx_tomcat", name: "NGINX Tomcat connector" },
  	 { href : "postgresql", name: "Postgresql" },
  	 { href : "Postgresql_connector", "postgresql_connector"}],
  	"plan_uri": "myjavaplan",
  	"operations_uri": "myjavaoperation",
  	"sensors_uri": "myjavasensors"
	}


component
============

The value of the assemblies attribute is an array of Links that reference to the assembly resources of which this component resource is a member.
The value of the artifact attribute is a URL reference to the artifact on which this component resource is based. This artifact is not a CAMP resource, but a representation of the actual artifact (e.g. WAR file, Ruby gem file, etc.)
The artifact attribute and the service attribute are mutually exclusive.
The value of the service attribute is a URL reference to the service resource on which this component resource is based.
The service attribute and the artifact attribute are mutually exclusive.
The value of this attribute indicates the status of the component represented by the component resource. This attribute MAY have one of the following values:
RUNNING – indicates that the component is functioning as expected.
ERROR – indicates that the component has encountered some sort of error
This attribute contains the URI of the operations resource. The operations resource lists the operation resource links available for the component resource.
This attribute contains a URI of the sensors resource listing the sensor resources available on this resource.


GET
----

.. code::

	{
	  "name": String,
  	   "type": "component",
   		"description": "Components for a particular platform",
  		"tags": ["megamcomponents"],
  		"representation_skew": "Active",
  		"assemblies": { "href": "ASM0001" , "name": "testing" },
  		"artifact": "https://api.megam.co/artifact",
  		"service": "",
  		"status": "RUNNING",
  		"external_management_resource": ""
  		"related_components": Link[],
  		"operations_uri": "operations",
  		"sensors_uri": "sensors"
	}



.. |Megam CAMP Usecases| image:: /images/megam_camp_highlevel.png
