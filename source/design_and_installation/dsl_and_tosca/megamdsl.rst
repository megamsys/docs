.. _megamdsl:

================================================================================
Understanding Megam DSL
================================================================================

DSL (Domain Specific Language)
--------------------------------

This guide is meant for the cloud architect and administrator, to help him to understand the way Megam DSL operates in the infrastructure resources, and how they are consumed by the users.

The Megam DSL incorporating some related work/concepts from elsewhere, including `TOSCA <https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=tosca>`__ and `CAMP <https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=camp>`__ These specs are both evolving and there is scope for them to converge to something simple, intuitive, and powerful: this is an aim towards that convergence, and is believed to map nicely on to all three (Megam, TOSCA, and CAMP), and make it easy to represent other popular tools and techniques (e.g. Chef, SaltStack).

Grouped application
=====================
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

  {
    "name": "server running a custom install script"
     "inputs": {
    },
    "components": [
      { "id": "my_server",
        "type": "server",
        "requires": [
          { "minRam": "4gb" },
          { "run": "my_script" } ]
      }, {
        "id": "my_script",
        "type": "com.example.script.ShellScript",
        "content": "http://example.com/my_install.sh",
        "sudo": true
      }]
    outputs: {

    },

  }
