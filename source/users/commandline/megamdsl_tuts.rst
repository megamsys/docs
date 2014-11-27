.. _megamdsl_tuts:


=========
Tutorial
=========

Familiarity about `TOSCA <http://bit.ly/1sXfsIV>`_ and  :ref:`Megam Internals <megaminternals>` is needed before following the rest of the tutorial.


Launch a Single Application
============================

The definition below launches a single application.


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
==============================

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
====================

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
