.. _understand:

================================================================================
Understanding Megam
================================================================================

This guide is meant for the cloud architect and administrator, to help him to understand the way Megam automates the infrastructure resources, and how they are consumed by the users.

Traditionally the lifecycle in a datacenter goes from ``Managed by You`` to ``Vendor Managed``  as demonstrated in the picture below.

XaaS : Anything as service
----------------------------

With the advent of cloud your infrastructure needs to cater to business requirements and be agile. You business requirements to `XaaS` needs to be realized. The platform (runtime, middleware, services..) can be provided as a services which improved agility of your business.


|cloud xaas|

Megam provides the PaaS for enterprise both public and private which can help you achive XaaS.

Define Megam
--------------

The below illustration shows ``How PaaS works`` and how we handle it in megam. All the plumbing work needed to setup an application and services are handled by Megam on the cloud of choice.

|define megam|

The virtual machine that has an operating system contains application and services with features of scaling, high availability, application performance monitoring built in.

Managed VM
-----------

When your apps/services are running in the cloud, Megam provides a scalable number of instances of your app's modules. Each instance runs in its own hosting environment.

The Managed VM hosting environment lets you run apps/services on configurable IaaS (Compute). This VM-based hosting environment offers more flexibility and provides more CPU and memory options. Applications that run on Managed VMs, are not subject to runtime restrictions and they have access to all the IaaS machine types. You can also add third-party libraries and frameworks to your app.


|megam manage vm|

With containers getting more traction we offer a way to run ``containers`` using ``Docker`` in a managed VM. The VM's can have ``multitenant`` containers runing in an isolated way.


megam abstracts and hides most of the complexities that are associated with hosting and managing cloud-based applications. As an application developer, you can focus on developing your application without having to manage the infrastructure that is required to host it. For mobile apps, you can use the pre-built services that are provided by megam. For web apps, you can upload your application to megam and indicate how many instances that you want running. Then, megam takes care of the rest. After your apps are deployed, you can easily scale them up or down when the usage or load of the apps change.

You can use megam to quickly develop applications in the most popular programming languages. You can develop mobile apps in iOS, Android, and HTML with JavaScript. For web apps, you can use languages such as Ruby, PHP, and Java™.

megam also provides middleware services for your applications to use. megam acts on the application's behalf when it provisions new service instances, and then binds those services to the application. This enables the app to perform its real job, leaving the management of the services to the infrastructure.

megam architecture

At its core, megam is an environment for you to build applications and use services when you develop applications. megam also provides an environment to host application artifacts that run on an application server such as Liberty. By using SoftLayer, megam deploys virtual containers that host each deployed application. In this environment the application can use pre-built services (including third-party services) to make application assembly easy.

As a developer, you can interact with the megam infrastructure by using a browser-based user interface. You can also use a Cloud Foundry command line interface, called cf, to deploy web applications.

Clients, which can be mobile apps, applications that run externally, applications that are built on megam, or application developers that are using browsers, interact with the megam-hosted applications. Clients use REST or HTTP APIs to route requests through megam to one of the application instances or the composite services.
The following figure shows the high-level megam architecture.
Figure 1. megam architecture
megam architecture
How megam works
When you deploy an application to megam, you must configure megam with enough information to support the application.

    For a mobile app, megam contains an artifact that represents the mobile applications back end, such as, the services that are used by the mobile app to communicate with a server.
    For a web app, you must ensure that information about the proper runtime and framework is communicated to megam, so that it can set up the proper execution environment to run the application.

Each execution environment, including both mobile and web, is isolated from the execution environment of other applications. The execution environments are isolated even though these apps are on the same physical machine. The following figure shows the basic flow of how megam manages the deployment of applications:
Figure 2. Deploying an application
Deploying an application
When you create an application and deploy it to megam, the megam environment determines an appropriate virtual machine (VM) to which the application or artifacts that the application represents is sent. For a mobile application, a mobile back-end projection is created on megam. Any code for the mobile app running in the cloud eventually runs in the megam environment. For a web app, the code running in the cloud is the application itself that the developer deploys to megam. The determination of the VM is based on several factors, including:

    The load already on the machine
    Runtimes or frameworks supported by that VM.

After a VM is chosen, an application manager on each VM installs the proper framework and runtime for the application. Then the application can be deployed into that framework. When the deployment is completed, the application artifacts are started.

You can have one or more instances running for your application. When you have multiple instances for one application, the application is uploaded only once. However, megam deploys as many instances of the application as requested, across as many VMs as needed. Instances of the same application can be on the same or different VMs based on the load of the VMs. megam manages the deployment of the instances, so the application developer is unaware of the choices.
The following figure shows the structure of a VM that has multiple applications deployed to it:
Figure 3. Design of a VM
Design of a VM

In each VM, an application manager communicates with the rest of the megam infrastructure, and manages the applications that are deployed to this VM. Each VM has containers to separate and protect applications. In each container, megam installs the appropriate framework and runtime that are required for each application.
When the application is deployed, if it has a web interface (such as a Java web application), or other REST-based services (such as mobile services exposed publicly to the mobile application), users of the application can communicate with it by using normal HTTP requests.
Figure 4. Invoking a megam application
Invoking a megam application

Each application can have one or more URLs associated with it, but all of them must point to the megam endpoint. When a request comes in, megam examines the request, determines which application it is intended for, and then selects one of the instances of the application to receive the request.

megam is designed to host scalable applications and application artifacts. when the load of your application changes, instances of your application might need to be created or deleted. Therefore, any instance of your application might be terminated, deleted, moved, or re-created on a new VM or container when it is required, even if your application has only one instance. Because it might be removed at any time, your application needs to save all persistent data in a data store that is outside of your application, for example, on one of the data store services that are provided by megam. Any data that is stored locally to your application, such as in memory or on local disk, is removed when the instance of your application is removed.
megam concepts

megam consists of applications, services, buildpacks, and other components.
Applications
In megam, an application, or app, represents the artifact that a developer is building. The application lifecycle in the megam and the Cloud Foundry are identical, regardless of how you push the application to the megam. For more information, see How Applications Are Staged.

Mobile apps
    Mobile apps run outside of the megam environment and use services that the mobile apps are exposed to. These services typically act in concert, and represent the back-end projection of that application. megam can also host application code that the developer would rather run on a back-end server in a container-based environment.
Web apps
    Web apps consist of all the code that is required to be run or referenced at run time. Web apps are uploaded to megam to host the application.

For languages such as Java, where the source code is compiled into runtime binary files, only the binary files are required to be uploaded.
Services

A service is a cloud extension that is hosted by megam. The service provides functionality that is ready-for-use by the app's running code. The predefined services provided by megam include database, messaging, push notifications for mobile apps, and elastic caching for web apps.

You can create your own services in megam. These services can vary in complexity. They can be simple utilities, such as the functions you might see in a runtime library. Alternatively, they can be complex business logic that you might see in a business process modeling service or a database.

megam simplifies the use of services by provisioning new instances of the service, and binding those service instances to your application. The management of the service is handled automatically by megam. For all available services in megam, see the catalog in the megam user interface.
Add-ons
An add-on is a megam extension that manages and monitors applications. Add-ons are not used by the running code, but provide functions to manage the application. You can use add-ons to provide many application management functions that you might otherwise have to code into an application yourself. Some of these functions include:

    Auto scaling to automatically increase or decrease the platform capacity by adding more application or service instances.
    Monitoring response time, performance, and availability.
    Agile application development planning.
    Secure integration with on-premises systems.
    Continuous delivery through automatic building, testing, and deployment.

Starters

A starter is a template that includes predefined services and application code that is configured with a particular buildpack. There are two types of starters: boilerplates and runtimes. A starter might be application code that is written in a specific programming language, or a combination of application code and a set of services.
Boilerplates

In megam, a boilerplate is a container for an application and its associated runtime environment and predefined services for a particular domain. You can use a boilerplate to quickly get up and running. For example, you can select the Mobile Cloud boilerplate to host mobile and web applications and accelerate development time of server-side scripts by using the mobile app template and SDK.
Runtimes

A runtime is the set of resources that is used to run an application. megam provides runtime environments as containers for different types of applications. The runtime environments are integrated as buildpacks into megam, and are automatically configured for use.
Buildpacks

A buildpack is a collection of scripts that prepare your code for execution on the target PaaS. A buildpack gathers the runtime and framework dependencies of an application. Then, it packages them with the application into a droplet that can be deployed to the cloud.

If you do not specify a buildpack when you deploy your application to megam, built-in buildpacks are used by default.

Built-in IBM buildpacks
    The following table shows the list of built-in buildpacks that are created by IBM.
    Table 1. megam built-in buildpacksName 	Git repository URL
    Liberty for Java 	Built-in
    Node.js 	Built-in
Built-in community buildpacks

    In megam, you can also use built-in buildpacks that are provided by the Cloud Foundry community. To list built-in community buildpacks run the cf buildpacks command.
External buildpacks
    If you cannot find the runtime or framework you want in the built-in buildpacks provided by megam, you can bring an external, existing buildpack to use for your app. External buildpacks are provided by the Cloud Foundry community for you to use as your own buildpacks. You specify the buildpack when you deploy your application by using the cf push command.
    Note: External buildpacks are not supported by IBM; therefore, you might need to contact the Cloud Foundry community for support.

Integration with systems of record

megam can help developers by connecting two broad categories of systems in a cloud environment: systems of record and systems of engagement.

Systems of record include applications and databases that store business records and automate standardized processes. Systems of engagement are capabilities that expand the usefulness of systems of record and make them more engaging to users.
By integrating a system of record with the application that you create in megam, you can perform the following actions:

    Enable secure communication between the application and the backend database by downloading and installing a secure connector on premise.
    Invoke a database in a secure way.
    Create APIs from integration flows with databases and backend systems, such as customer relationship management system.
    Expose only the schemas and tables that you want to be exposed to the application.

To integrate a system of record with the application that you create in megam, use the Cloud Integration service.
Scenario: Creating a rich mobile application to connect with your system of record

megam provides a platform where you can integrate your mobile app, cloud services, and enterprise systems of record to provide an application that interacts with your on-premises data.

For example, you can build a mobile app to interact with your customer relationship management system that resides on-premises behind a firewall. You can invoke the system of record in a secure way and leverage the mobile services in megam so that you can build a rich mobile application.

First, your integration developer creates the mobile back-end application in megam. He uses the Mobile Cloud boilerplate that uses the Node.js runtime that he is most familiar with.

Then, by using the Cloud Integration service in the megam user interface, he exposes an API through a secure connector. Your integration developer downloads the secure connector and installs it on-premises to enable secure communication between his API and the database. After he creates the database endpoint, he can look at all the schemas and extract the tables that he wants to expose as APIs to the application.

Your integration developer adds the Push service to deliver mobile notifications to interested consumers. He also adds a business partner service to tweet when a new customer record is created with a Twitter API.

Next, as the application developer, you can log in to megam, download the Android development toolkit, and develop code that invokes the APIs that your integration developer created. You can develop a mobile application that enables users to enter their information on their mobile device. The mobile app then creates a customer record in the customer management system. When the record is created, the application pushes a notification to a mobile device and initiates a tweet about the new record.
Terms of use/ Notices



Megam Application Lifecycle
-------------------------------


https://github.com/Megam/origin/blob/master/examples/simple-ruby-app/README.md




.. |megam manage vm| image:: /images/megam_manage_vm.png
.. |define megam| image:: /images/define_megam.png
.. |cloud xaas| image:: /images/cloud_xaas.png
