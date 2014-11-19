
===============================
Scalable Architecture and APIs
===============================

Megam has been designed to be easily adapted to any infrastructure and easily extended with new components. The result is a modular system that can implement a variety of Cloud architectures and can interface with multiple datacenter services. In this Guide we review the main interfaces of Megam, their use and give pointers to additional documentation for each one.

We have classified the interfaces in two categories: end-user cloud and system interfaces. PaaS interfaces are primary used to develop tools targeted to the end-user, and they provide a high level abstraction of the functionality provided by the Cloud. On the other hand, the system interfaces expose the full functionality of Megam and are mainly used to adapt and tune the behavior of Megam to the target infrastructure.


System Interfaces
====================

The Megam API
-----------------------------------

The Megam API provides a simplified and convenient way to interface the Megam core.

*Use the REST API interface if...* you are developing advanced PaaS tools that need full access to the Megam functionality.

*You can find more information at...* :ref:`Ruby reference guide <ruby>`, :ref:`JAVA reference guide <java>` and the :ref:`Scala reference guide <scala>`
