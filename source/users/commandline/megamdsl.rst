.. _megamdsl:

================================================================================
Understanding Megam DSL
================================================================================


A domain-specific language (DSL) is a computer language specialized to a particular application domain. This is in contrast to a general-purpose language (GPL), which is broadly applicable across domains, and lacks specialized features for a particular domain. There are a wide variety of DSLs, ranging from widely used languages for common domains, such as HTML for web pages, down to languages used by only a single piece of software.


What Are the Key Features Provided by Megam - DSL ?
==============================================================

+------------------------------+-----------------------------------+
|          Features            |          DSL                      |
+==============================+===================================+
| ``YAML support``             | TOSCA Simple profile 1.1 (work    |
|                              | in progress draft version)        |
+------------------------------+-----------------------------------+
| ``Manage using a Designer``  | Yes                               |
+------------------------------+-----------------------------------+
| ``Standards compliance``     | TOSCA 1.1 (YAML work in progress) |
+------------------------------+-----------------------------------+
| ``Multiple Composite Apps/   | Yes                               |
| ``Service``                  |                                   |
+------------------------------+-----------------------------------+
| ``Non functionals config``   | Yes, you can configure            |
|                              | HA, Backups, Monitoring, Logging  |
+------------------------------+-----------------------------------+
| ``Extend and build your own``| Yes, you can create extension     |
|                              | of the base TOSCA types           |
+------------------------------+-----------------------------------+



What Does Megam - DSL to Cloud Service Consumers?
==========================================================

Cloud Service Consumers benefit indirectly from the standardization which TOSCA brings to the Cloud Service Developer and Cloud Service Provider. These benefits include:

-  **More choices and flexibility in Cloud Provider.**
-  **Lower set-up and operational costs from TOSCA automation**



What Does Megam - DSL Offer to Cloud Service Developer?
=========================================================

A Cloud Service Developer uses TOSCA as the standard to get their developed services at Cloud Service Providers in place. These persons:

-  **Leverage the operational expertise of Cloud Service Providers**
-  **May further leverage the business/distribution network of Cloud Service Providers**
-  **Are able to choose from a wider range of cloud service providers.**
-  **Can work with multiple Cloud Service Providers in different legal environments with reasonable effort.**



What Does Megam - DSL Offer to Cloud Service Provider ?
============================================================

A Cloud Service Provider uses TOSCA to rapidly offer and deploy cloud services developed by Cloud Service Developers for Cloud Service Consumers. Provides:

-  **Act as resellers for services developed by cloud service developer.**
-  **Can extend service offerings and revenue chances.**
-  **Optimize deployment and operational procedures and expenses.**
-  **Optimize the time to market for services**


DSL (Domain Specific Language)
--------------------------------

This guide is meant for the cloud architect and administrator, to help him to understand the way Megam DSL operates in the infrastructure resources, and how they are consumed by the users.

The Megam DSL incorporating some related work/concepts from elsewhere, including `TOSCA <https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=tosca>`__ and `CAMP <https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=camp>`__ These specs are both evolving and there is scope for them to converge to something simple, intuitive, and powerful: this is an aim towards that convergence, and is believed to map nicely on to all three (Megam, TOSCA, and CAMP), and make it easy to represent other popular tools and techniques (e.g. Chef, SaltStack).

Single Application
-------------------
.. code::

  tosca_definitions_version: tosca_simple_yaml_1_0

  description: Template for deploying a single  application on one vm

  inputs:
    # Admin user name and password to use with the Webserver
    wp_admin_username:
       type: string
    wp_admin_password:
       type string

  node_templates:

    apache:
      type: tosca.nodes.WebServer.Apache
      properties:
        # omitted here for sake of brevity
      requirements:
        - host: web_server

    web_server:
      type: tosca.nodes.Compute
      properties:
        # omitted here for sake of brevity


Single Application + Database
------------------------------
.. code::

  tosca_definitions_version: tosca_simple_yaml_1_0

  description: Template for deploying a two-tier application servers on two

  inputs:
    # Admin user name and password to use with the WordPress application
    wp_admin_username:
       type: string
    wp_admin_password:
       type string
    wp_db_name:
      type: string
    wp_db_user:
      type: string
    wp_db_password:
      type: string
    wp_db_port:
      type: integer
    postgres_root_password:
       type string
    postgres_port:
       type integer

  node_templates:
    wordpress:
      type: tosca.nodes.WebApplication.WordPress
      properties:
        admin_user: { get_input: wp_admin_username }
        admin_password: { get_input: wp_admin_password }
        db_host: { get_property: [ db_server, ip_address ] }
      requirements:
        - host: apache
        - database_endpoint: wordpress_db
      interaces:
        Lifecycle:
          inputs:
            db_host: { get_property: [ db_server, ip_address ] }
            db_port: { get_property: [ wordpress_db, db_port ] }
            db_name: { get_property: [ wordpress_db, db_name ] }
            db_user: { get_property: [ wordpress_db, db_user ] }
            db_password: { get_property: [ wordpress_db, db_password ] }

    apache:
      type: tosca.nodes.WebServer.Apache
      properties:
        # omitted here for sake of brevity
      requirements:
        - host: web_server

    web_server:
      type: tosca.nodes.Compute
      properties:
        # omitted here for sake of brevity

    wordpress_db:
      type: tosca.nodes.Database.PostgreSQL
      properties:
        db_name: { get_input: wp_db_name }
        db_user: { get_input: wp_db_user }
        db_password: { get_input: wp_db_password }
        db_port: { get_input: wp_db_port }
      requirements:
        - host: postgres

    postgres:
      type: tosca.nodes.DBMS.PostgresSQL
        properties:
        dbms_root_password: { get_input: postgres_root_password }
        dbms_port: { get_input: postgres_port }
      requirements:
        - host: db_server

    db_server:
      type: tosca.nodes.Compute
      properties:
        # omitted here for sake of brevity


Grouped application
--------------------
.. code::

  tosca_definitions_version: tosca_simple_yaml_1_0

  description: Template for a scaling web server.

  inputs:
  # omitted here for sake of brevity

  node_templates:
    apache:
      type: tosca.types.nodes.ApacheWebserver
      properties:
        http_port: 8080
        https_port: 8443
      requirements:
        - host: server

    server:
      type: tosca.nodes.Compute
      properties:
        # omitted here for sake of brevity

  group:
    webserver_group:
      members: [ apache, server ]
      policies:
        - my_scaling_policy:
           # Specific policy definitions are considered domain specific and
           # are not included here
