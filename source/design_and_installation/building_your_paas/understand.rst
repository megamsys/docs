.. _understand:

================================================================================
Understanding Megam
================================================================================

This guide is meant for the cloud architect and administrator, to help them understand the way Megam automates the infrastructure resources, and how they are consumed by the users.

Traditionally the lifecycle in a datacenter goes from ``Managed by You`` to ``Vendor Managed``  as illustrated in the picture below.

XaaS : Anything as service
----------------------------

With the advent of cloud your infrastructure needs to cater to business requirements and be agile. You business requirements to `XaaS` needs to be realized. The platform (runtime, middleware, services..) can be provided as a service which improves agility of your business.


|cloud xaas|

Megam provides `PaaS for enterprise both public and private` which can help you achive XaaS.


What is Megam ?
----------------

The virtual machine(VM1...n) that has an operating system contains application and services with features of scaling, high availability, application performance monitoring built in.

Megam abstracts and hides most of the complexities that are associated with hosting and managing cloud-based applications. As an application developer, you can focus on developing your application without having to manage the infrastructure that is required to host it. For web apps, you can upload your application to megam and indicate how many instances that you want running. Then, megam takes care of the rest. After your apps are deployed, you can easily scale them up or down when the usage or load of the apps change.

You can use megam to quickly develop applications in the most popular programming languages. You can develop mobile apps(`support on its way`) in HTML5 with JavaScript. For web apps, you can use languages such as **Ruby**, **Node.js**, **Play(Scala)** and **Java**.

Megam also provides middleware services for your applications to use. Megam acts on the application's behalf when it provisions new service instances, and then binds those services to the application. This enables the app to perform its real job, leaving the management of the services to the platform.


|define megam|

The above illustration summarizes ``How PaaS works`` and how we handle it in Megam. All the plumbing work needed to setup an application and service are handled by Megam on the cloud of choice.


How does it work ?
-------------------

At its core, Megam is an environment for you to build applications and use services when you develop applications. Megam also provides an environment to host application artifacts that run on an application server such as `Tomcat <http://tomcat.apache.org/tomcat-8.0-doc/index.html>`_, `Unicorn <http://unicorn.bogomips.org/unicorn_rails_1.html>`_, `Node.js <http://nodejs.org/>`_, `Playframework <http://playframework.com>`_. Megam uses IaaS to deploy virtual machines that host each deployed application. In this environment the application can use pre-built services (including third-party services) to make application assembly easy.

As a developer, you can interact with the Megam infrastructure by using a browser-based user interface called :ref:`Nilavu <nilavu>`. You can also use a Megam command line interface, called ``meg``, to deploy web applications.

Clients, which can be mobile apps, applications that run externally, applications that are built on Megam, or application developers that are using browsers, interact with the Megam-hosted applications. Clients use REST or HTTP APIs to route requests through Megam to one of the application instances or the composite services.

|megam_client_use_megam|

When you deploy an application to Megam, you must configure Megam with enough information to support the application.

* For a web app, you must ensure that information about the proper runtime and framework is communicated to Megam, so that it can set up the proper execution environment to run the application.

Each execution environment, is isolated from the execution environment of other applications. The execution environments are isolated even though these apps are on the same physical machine. The figure under "Managed VM" shows how megam manages the deployment of applications.

When you create an application and deploy it to megam, the megam environment determines an appropriate virtual machine (VM) to which the application or artifacts that the application represents is sent. For a web app, the code running in the cloud is the application itself that the developer deploys to megam. The determination of the VM is based on the cloud setting as provider by the user.


Managed VM
-----------

When your apps/services are running in the cloud, Megam provides a scalable number of instances of your application artifacts. Each instance runs in its own hosting environment.

The Managed VM hosting environment lets you run apps/services on configurable IaaS (Compute). This VM-based hosting environment offers more flexibility and provides more CPU and memory options. Applications that run on Managed VMs, are not subject to runtime restrictions and they have access to all the IaaS machine types. You can also add third-party libraries and frameworks to your app.


|megam manage vm|

After a VM is chosen, an application manager on each VM installs the proper framework and runtime for the application. Then the application can be deployed into that framework. When the deployment is completed, the application artifacts are started.

You can have one or more instances running for your application. When you have multiple instances for one application, the application is uploaded only once. However, megam deploys as many instances of the application as requested, across as many VMs as needed. Instances of the same application can be on the same or different VMs based on the load of the VMs. megam manages the deployment of the instances, so the application developer is unaware of the choices.
The above figure shows the structure of a VM that has multiple applications deployed to it.

In each VM, an application manager communicates with the rest of the megam infrastructure, and manages the applications that are deployed to this VM.  Megam installs the appropriate framework and runtime that are required for each application.
When the application is deployed, if it has a web interface (such as a Java web application), or other REST-based services (such as mobile services exposed publicly to the mobile application), users of the application can communicate with it by using normal HTTP requests.

The below picture show to VM's cluster spinned off by the user in AWS and a Docker cluster in amazon in which several applcation and services are running.

|megam cluster|

Accessing your Megam application
---------------------------------

Each application can have one or more URLs with ports associated with it. When a request comes in, the request is directed to the application it is intended for.

Any instance of your application can be terminated, deleted, moved, or cloned on a new VM or container when it is required. Because it might be removed at any time, your application needs to save all persistent data in a data store that is outside of your application, for example, on one of the data store services that are provided by megam. Any data that is stored locally to your application, such as in memory or on local disk, is removed when the instance of your application is removed.

Concepts
------------

Megam consists of applications, services, buildpacks, and other components.

Applications
    In megam, an application, or app, represents the artifact that a developer is building.

Web apps
    Web apps consist of all the code that is required to be run or referenced at run time. Web app artifacts are uploaded to megam to host the application.
    For languages such as Java, where the source code is compiled into runtime binary files, only the binary files are required to be uploaded.

Services
    A service is a cloud extension that is may be hosted by megam or created by you. The service provides functionality that is ready-for-use by the app's running code. The predefined services provided by megam include database, messaging.

You can create your own services in megam. These services can vary in complexity. They can be simple utilities to a database.

Megam simplifies the use of services by provisioning new instances of the service, and binding those service instances to your application. The management of the service is handled automatically by megam. For all available services in megam, see the ``Marketplace`` in the megam user interface.

Add-ons
    An add-on is a megam extension that enriches megam platform. Addon items like Docker, monitoring  applications are not used by the running code, but provide functions to enrich the megam platform. They in turn can be used to manage applications in docker or manage the application in a better way.

Some of the addon functions are

* Auto scaling to automatically increase or decrease the platform capacity by adding more application or service instances.
* Monitoring response time, performance, and availability.
* Continuous integration(CI)  through automatic building, testing, and deployment.

Starter Packs
    A starter is a template that includes predefined services and application code that is configured with a particular buildpack. You can use a starter pack to quickly get up and running. For example, you can select the Java Web App starterpack to host java web app and sqllite db.

Runtimes
    A runtime is the set of resources that is used to run an application. Megam provides runtime environments for different types of applications. The runtime environments are integrated as buildpacks into Megam, and are automatically configured for use.

Buildpacks
    A buildpack is a collection of scripts that prepare your code for execution on the target PaaS. A buildpack gathers the runtime and framework dependencies of an application. Then, it packages them with the application that can be deployed to the cloud.

If you do not specify a buildpack when you deploy your application to Megam, built-in buildpacks are used by default.

Built-in Megam buildpacks

The following table shows the list of built-in buildpacks that are created by Megam.

+------------------+-----------------------------------------------------------------------------------------------------------------+
|         Name     |                                         Git repository URL                                                      |
+==================+=================================================================================================================+
| Java             | `https://github.com/megamsys/megam_java_builder.git <https://github.com/megamsys/megam_java_builder.git>`_      |
+------------------+-----------------------------------------------------------------------------------------------------------------+
| Ruby on Rails    | `https://github.com/megamsys/megam_ruby_builder.git <https://github.com/megamsys/megam_ruby_builder.git>`_      |
+------------------+-----------------------------------------------------------------------------------------------------------------+
| Play(Scala)      | `buildpack`                                                                                                     |
+------------------+-----------------------------------------------------------------------------------------------------------------+
| Akka(Scala)      | `buildpack`                                                                                                     |
+------------------+-----------------------------------------------------------------------------------------------------------------+
| Node.js          | `https://github.com/megamsys/megam_nodejs_builder.git <https://github.com/megamsys/megam_nodejs_builder.git>`_  |
+------------------+-----------------------------------------------------------------------------------------------------------------+

External buildpacks
    If you cannot find the runtime or framework you want in the built-in buildpacks provided by Megam, you can bring an external, existing buildpack to use for your app. Contact us `support@megam.co.in <mailto:support@megam.co?subject=Buildpack>`_ we can help you out.


Docker
  With containers getting more traction we offer a way to run ``containers`` using ``Docker`` in a managed VM. The VM's can have ``multitenant`` containers running in an isolated way.


Application Lifecycle
-------------------------------

This describes the lifecycle of an app, from the time it is deployed through its removal. Megam is stocked with free services, runtimes, and infrastructure to help you quickly build and deploy your next mobile or web application.

* User starts by going to the `https://github.com/megamsys/javawebapp <https://github.com/megamsys/javawebapp>`_ on GitHub and cloning the Java Web Sqllite3 application to his local notebook machine.

* User then make changes and pushes the code in GitHub.

* User launches Megam browser-based user interface and creates a Application with the GitHub link.

* User then sees the application appearing in the Megam palette of applications launched

* User deletes an application when you are done with it

The app lifecycle is illustrated by the sequence diagram below.

.. image:: /images/megam_app_lifecycle.png
   :scale: 70 %
   :alt: App lifecycle
   :align: right

The various states transitions an Application may undergo are shown below.

App state
    This illustration represents the transitions between app execution states. The next several sections of this topic describe these states and events.

App launched
    An app is launched whenever it is submitted by the user to Megam.

App started
    If an App is staged successfully in Megam, then the App enters ``running/started`` state.

App stopped
    When the user sends an event to stop an App, the app enter Stopped state.

App restart
    When the user sends an event to restart an App, the app is restarted and goes to Started state.

App removal
    When a user deletes your app, the app is removed, along with all its local data.


.. note:: Read below for more detail about when each state transition occurs and what your app should do in response.

Sequence of steps
---------------------------

* From the Megam browser-based user interface, the user enters the credentials and is signed into Megam. The user  performs ``Create App``

* The Megam browser-based user interface tells the ``Gateway`` to create a record for the application.

* The ``Gateway`` stores the application metadata (e.g. the app name, number of instances the user specified, source repo(Git), host pool to launch, and the buildpack).

.. warning:: Assembly represents the internal philosophy of describing application and services in Megam. For more details please read the :ref:`PaaS Interfaces <campapi>`

* The ``Gateway`` issues a staging request to the ``Assembly execution engine``.

The ``Assembly Execution Engine`` chooses a host(VM) as preferred by the user to launch the application and starts the staging by using the Provisioner.

* The staging Assembly streams the output of the staging process so the user can troubleshoot application staging problems.

* The Provisioner gets an ``Assembly running` and brings the state of it to the one desired by the user. This would involve building the assembly, starting the assembly.

* The ``Assembly Running`` reports to the Store that the process is complete.

* The running Assemblies stream the status of the application to the ``Streamer``.

* The ``Assembly Running`` starts an ``Assembly Agent`` which handles all the requests like Start, Stop, Restart, Delete as asked by the user.

* The ``Docker launch`` request is serviced  in the same way, For more information read :ref:`Docker mania <docker>`_

.. |megam_client_use_megam| image:: /images/megam_client_use_megam.png
.. |megam manage vm| image:: /images/megam_manage_vm.png
.. |define megam| image:: /images/define_megam.png
.. |cloud xaas| image:: /images/cloud_xaas.png
.. |megam cluster| image:: /images/megam_cluster_management.png
