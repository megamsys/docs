.. _java:

==========================
Megam Java API
==========================

This page contains the Megam API specification for Java. It has been designed as a wrapper for the :ref:`REST API <restapi>`, with some basic helpers. This means that you should be familiar with the REST API and the JSON formats returned by the Megam core. 

API Documentation
=================



Maven
========




Usage
=====

- if you are using Maven as the build tool.
  
To use the Megam API for Java in your Java project, you have to add to the `pom.xml`  



Code Sample
===========

This is a small code snippet. As you can see, the code flow would be as follows:




Compilation
===========

To compile your project 

.. code::

    $ cd src/code/megam/mypaas/
    $ mvn clean
    $ mvn compile
    [INFO] Scanning for projects...
    [INFO] Compiling 61 source files to /home/yourcode/target/classes
    [INFO] ------------------------------------------------------------------------
    [INFO] BUILD SUCCESS
    [INFO] ------------------------------------------------------------------------
    [INFO] Total time: 9.077s
    [INFO] Finished at: Thu May 08 17:33:25 IST 2014
    [INFO] Final Memory: 19M/216M
    [INFO] ------------------------------------------------------------------------


This command will compile using the mvn build tool.