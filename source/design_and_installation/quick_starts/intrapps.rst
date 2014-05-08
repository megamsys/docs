.. _intrapps:

==========================================
Quickstart: Introduction to Apps
==========================================


An application is defined on Megam by the following elements:

-  `A dedicated language/framework`
-  `A deployment method (Cloud storage and/or Git)`
-  `RAM and CPU consumption, depending on the language or framework used (target cloud setting)`
-  `An optional configuration file you’ve added to your project`

If one of these elements is missing, Megam can’t deploy your application properly.

Available languages are listed below:

- ``Java [Play Framework 1 & 2, War files]``
- ``Node.js``
- ``Ruby``
- ``Scala``
- ``Akka``

How it works
-------------

When an application is pushed, the platform receives it. It then checks the resources’ requirements. If they are complete, the deployment is launched. When finished and successfull, the application is up and running.

The log system retrieves every traces from the application and display them in your nilavu console.


