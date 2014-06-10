.. _campapi:

==============================
Megam CAMP Specification
==============================

Overview
========

The Megam CAMP API is a RESTful service to create, control and manage cloud application and services using an implementation of the `OASIS CAMP API specification <https://www.oasis-open.org/committees/camp>`__ based on the `public draft 02 <http://docs.oasis-open.org/camp/camp-spec/v1.1/camp-spec-v1.1.html>`__. This implementation also includes Megam specific extensions.

The purpose of the Megam CAMP API is to manage the building, running, administration, monitoring and patching of applications/services in the cloud. Its purpose is to enable interoperability among self-service interfaces to PaaS clouds by defining artifacts and formats that can be used with any conforming cloud and enable independent vendors to create tools and services that interact with any conforming cloud using the defined interfaces.


This example illustrates a scenario in which the application administrator wants to run and monitor an application. It assumes that the application package(PDP) is made available to Megam, either because it was uploaded to the platform or developed directly on the platform.

|Megam CAMP Usecase Import|

What is uploaded here by the developer ? A developer working on an application development environment(ADE) or on Cloud uploads a PDP with the CAMP Provider through the platform_endpoint. In a multi tenant model, the roles (Developer, Application Administrator) and what these role are capable off are handled by an Identity product.


|Megam CAMP Usecase New|

What is uploaded here by the developer ? A developer working on an application development environment(ADE) or on Cloud uploads a PDP with the CAMP Provider through the platform_endpoint. In a multi tenant model, the roles (Developer, Application Administrator) and what these role are capable off are handled by an Identity product.


On receiving such a request Megam unpacks the application package(PDP), parses and validates the deployment plan, resolves the service dependencies described by that plan and starts the application. On successful start the platform creates a new resource representing the running application (assembly) and provides the URL of that resource "/my_paas/assembly/1" in the response as shown below.

|Megam CAMP Resources|


platform_endpoints
--------------------

Concurrent Megam instances are supported through the use of multiple platform_endpoint resources. The platform_endpoints resource allows Consumers to discover all the instances of the CAMP API that are currently available. It contains an array of Links to platform_endpoint resources (that each reference platform resources), and has the following general representation:


platforms
-----------

The platform resource represents the Consumer’s initial view of the accessible resources and deployed entities. This resource has the following, general representation:


When the Application Administrator first accesses a new account a Platform will have a number of resources visible through the API. The platform resource is used to find the other resources in this diagram. The various service resources allow for discovery of all the platform services that are available along with value ranges for each service’s attributes.


assemblies
-----------

This resource acts as a container for the assembly resources on this platform. This resource has the following, general representation:


components
-----------


A component represents a runtime component. This resource has the following, general representation:


services
----------

A service resource represents a particular configuration of a service available for use by one or more applications. This resource has the following, general representation:



Account
------------

.. note:: This an Megam CAMP Extension API

This resources represents a customer in Megam.



Nodes
------------

.. note:: This an Megam CAMP Extension API

This resources represents a VM node  in Megam.


Marketplaces
------------

.. note:: This an Megam CAMP Extension API

This resources represents a marketplace consumables available in Megam Marketplace.



Marketplaces Addons
-------------------

.. note:: This an Megam CAMP Extension API

This resources represents a marketplace addons available in Megam Marketplace.









- :ref:`REST API <restapi>`
- :ref:`Megam DSL and TOSCA <megamdsl>`


.. |Megam CAMP Resources| image:: /images/megam_camp_resources.png
.. |Megam CAMP Usecase Import| image:: /images/megam_camp_usecase_import.png
.. |Megam CAMP Usecase New| image:: /images/megam_camp_usecase_new.png
