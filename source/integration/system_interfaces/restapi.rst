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

    $ curl -u "username:hmacpassword" https://megam.server


The methods specified below are described without taking into account **4xx** (can be inferred from authorization information in section above) and **5xx** errors (which are method independent). HTTP verbs not defined for a particular entity will return a **501 Not Implemented**.

Resources
===========