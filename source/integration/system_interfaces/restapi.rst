.. _restapi:

======================
Megam REST API
======================

Overview
========

The Megam REST API is a RESTful service to create, control and monitor multi-tier applications or services composed of interconnected Virtual Machines with deployment dependencies between them. 

This guide is intended for ``developers``. 


Authentication & Authorization
==============================

User authentication will be `HTTP Basic access authentication <http://tools.ietf.org/html/rfc1945#section-11>`__. The credentials passed should be the User name and password.

.. code::

    $ curl -u "username:hmacpassword" https://api.megam.co


The methods specified below are described without taking into account **4xx** (can be inferred from authorization information in section above) and **5xx** errors (which are method independent). HTTP verbs not defined for a particular entity will return a **501 Not Implemented**.

Resources
===========


platform_endpoints Resource:
-----------------------------
Megam concurrently offer multiple instances of the CAMP API.


.. code::


	{
	"description": "A collection of platform endpoints",
	"tags": ["megamtest", "megambeta"],
	"representation_skew": "active",
	"platform_endpoint_links": ["http://api.megam.co/v2/beta", "http://api.megam.co/v2/test"]
	}



platform_endpoint Resource:
---------------------------

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


platforms Resource:
---------------------------

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
  
assemblies resource:
-----------------------


assembly resource:
------------------



components resource:
--------------------




component resource:
--------------------


  
  
services resource:
-------------------

.. code::

  {
  "uri": URI,
  "name": String,
  "type": "plan",
  "description": String ?,
  "tags": String[] ?,
  "representation_skew": String ?,
  "camp_version": String,
  "origin": String ?,
  "artifacts": [
    {
      "name": String ?,
      "description": String ?,
      "tags": String[] ?,
      "artifact_type": String,
      "content": { "href": URI },
      "requirements": [
        {
          "requirement_type": String,
          "fulfillment": {
            "name": String ?,
            "description": String ?,
            "tags": String[] ?,
            "id": String ?,
            "href": URI ?,
            "characteristics": {
              characteristic: String +
            }
          }
        }
      ],
    } 
  ],
  "services": [
    {
      "name": String ?,
      "description": String ?,
      "tags": String[] ?,
      "id": String ?,
      "href": URI ?,
      "characteristics": {
        characteristic: String +
      }
    } 
  ] 
 }  



Extensions
-----------


.. code::


           {
                "description": "Megam CAMP Extension API",
                "representation_skew": "active",
                "tags": "megam_beta",
                "extension_links": [{
                        "https://api.megam.co/v2/accounts",
                        "https://api.megam.co/v2/nodes",
                        "https://api.megam.co/v2/marketplace_addons"
                    }],               
            }           
