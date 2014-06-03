.. _campapi:

==============================
Megam CAMP Specification
==============================

Overview
========

The Megam CAMP API is a RESTful service to create, control and manage cloud application and services using an implementation of the `OASIS CAMP API specification <http://www.oasis.org>`__ based on the `public draft 02 <http://docs.oasis-open.org/camp/camp-spec/v1.1/camp-spec-v1.1.html>`__. This implementation also includes some extensions. 

The purpose of the Megam CAMP API is to manage the building, running, administration, monitoring and patching of applications/services in the cloud. Its purpose is to enable interoperability among self-service interfaces to PaaS clouds by defining artifacts and formats that can be used with any conforming cloud and enable independent vendors to create tools and services that interact with any conforming cloud using the defined interfaces. 


This example illustrates a scenario in which the application administrator wants to run and monitor an application. It assumes that the application package  should be reworded as PDP was previously made available to the platform, either because it was uploaded to the platform or developed directly on the platform.

|Megam CAMP Usecases|

What is uploaded here by the developer ? A developer working on an ADE or on Cloud uploads a PDP with the CAMP Provider. In a multi tenant model, the roles (Developer, Application Administrator) and what these role are capable off are handled by the Identity product.
This design has an inbuilt assumption that an application administrator will perform fiddling with the Platform.


On receiving such a request the platform unpacks the application package PDP, parses and validates the deployment plan, resolves the service dependencies described by that plan and starts the application. On successful start the platform creates a new resource representing the running application (assembly) and provides the URL of that resource "/my_paas/assembly/1" in the response as shown below.

|Megam CAMP Resources|


platform_endpoints
--------------------

Concurrent instances are supported through the use of multiple platform resources. The platform_endpoints resource allows Consumers to discover all the instances of the CAMP API that are currently available. It contains an array of Links to platform_endpoint resources (that each reference platform resources), and has the following general representation:


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



plans
-----------

This optional resource acts as a container for the plan resources deployed by the Consumer. This resource has the following, general representation:
stores the plan for an application.




There are two ways to deploy an application using a PDP: by POSTing the entire PDP to the assemblies resource (by value) or by POSTing the URI of the PDP to the assemblies resource (by reference). Similarly, there are two ways to deploy an application using a Plan: by POSTing the entire Plan file to the assemblies resource (by value) or by POSTing the URI of the Plan file or plan resource to the assemblies resource (by reference). All of these methods are described below. Providers SHALL support PDPs that use either the ZIP [ZIP], TAR [TAR], or GZIP [RFC1952] compressed TAR formats. [RMR-13]

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
.. |Megam CAMP Usecases| image:: /images/megam_camp_usecases.png