.. _chefconfig:

======================
Opensource Chef Server
======================

The **Opensource Chef Server** enable the management of a Megam based on the Chef cookbooks stored in Git.

Requirements
============

In order to use the **Opensource Chef**, some software dependencies have to be met:

   -  A **cookbooks** created in the Git. (or) recommended option is to leverage the Megam cookbooks.
   -  A **user** created in Opensource Chefserver with the same clientname and password.



Considerations & Limitations
============================


Host Chef
=========

The **Hosted Chef** enables to use Megam using your own provisoned Chef at opscode.com.


Chef Configuration
==================

Users
-----






SSH Access
----------





Tools Setup
-----------

-  In order to enable all the functionality of the chef, several short steps remain:





Megam Configuration
====================

Megam TOSCA Runtime
--------------------

-  In order to configure Megam to work with the Chef cookbooks, the following actions need to be done.





    
Configuration 
--------------


Example of the configuration file:

.. code::

    :riak_uri: ""
    :username: ""
    :password: ""
    :datacenter: ""
    
    
    
    

.. warning:: This is a work in progress document. 