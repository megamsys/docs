.. _scala:

==========================
Megam Scala API
==========================

This page contains the Megam API specification for Scala. It has been designed as a wrapper for the :ref:`REST API <restapi>`, with some basic helpers. This means that you should be familiar with the REST API and the JSON formats returned by the Megam core. 

API Documentation
=================



SBT
========




Usage
=====

- if you are using `SBT <http://scala-sbt.org>_` as the build tool. 

To use the Megam API for Scala in your Scala project, you have to include the following in `build.sbt` 


Code Sample
===========

This is a small code snippet which uses `Newman <https://github.com/stackmob/newman>_`. As you can see, the code flow would be as follows:




Compilation
===========

To compile your project 

.. code::

    $ cd src/code/megam/mypaas/
    $ sbt clean
    $ sbt compile
    [info] Compiling 129 Scala sources and 1 Java source to /home/yourcode/classes...
    [success] Total time: 86 s, completed 8 May, 2014 4:28:41 PM
    
This command will compile using the sbt build tool.