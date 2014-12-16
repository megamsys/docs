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

  description: Template for deploying a ORION IDE on one vm

  node_templates:

  orion:
    type: tosca.nodes.WebServer.java
    properties:
      # omitted here for sake of brevity
    requirements:
      - host: aws1146028290067267584
      - domain: megam.co 
      - source: https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/war/orion.war


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

  description: Template for deploying a GHOST and MEGAM ARYABHATA applications on one vm

  node_templates:

  ghost:
    type: tosca.nodes.WebServer.nodejs
    properties:
      # omitted here for sake of brevity
    requirements:
      - host: aws1146028290067267584
      - domain: megam.co 
      - source: https://github.com/thomasalrin/ghost.git

  aryabhata:
    type: tosca.nodes.WebServer.rails
    properties:
      # omitted here for sake of brevity
    requirements:
      - host: aws1146028290067267584
      - domain: megam.co 
      - source: https://github.com/thomasalrin/aryabhata.git

  group:
    app_group:
    members: [ ghost, aryabhata ]
    policies:
      - my_placement_policy:
         # Specific policy definitions are considered domain specific and
         # are not included here 
