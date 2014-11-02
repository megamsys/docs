.. _services_intro:

#####################
Services
#####################


Developing apps using a service is easy with megam.:

   1. You have your app ready to integrate with a Service.

   2. The services supported are PostgreSQL, Redis, Riak

   +------------------------+-----------------------------------------------------------------------+
   | Service                | Description                                                           |
   |                        |                                                                       |
   +========================+=======================================================================+
   | PostgreSQL             | `www.postgresql.org <http://www.postgresql.org>`_.                    |
   |	                    | PostgreSQL is a powerful, open source object-relational database      |
   |                        | has more than 15 years of active development and a proven             |
   |                        | architecture that has earned it a strong reputation for reliability,  |
   |                        | data integrity, and correctness. It runs on all major operating       |
   |                        | systems, including Linux, UNIX (AIX, BSD, HP-UX, SGI IRIX, Mac OS X,  |
   |                        | Solaris, Tru64), and Windows.                                         |
   |                        | It is fully ACID compliant, has full support for foreign keys,        |
   |                        | joins, views, triggers,and stored procedures (in multiple languages). |
   +------------------------+-----------------------------------------------------------------------+
   | Riak                   | `basho.com/riak <http://basho.com/riak>`_.                            |
   |                        | Riak is an open source, distributed database. Riak is architected     |
   |                        | for: Availability, Fault-Tolerance, Operational Simplicity and        |
   |                        | Scalability.                                                          |
   +------------------------+-----------------------------------------------------------------------+
   | Redis                  | `redis.io <http://redis.io>`_.                                        |
   |                        | Redis is an open source, BSD licensed, advanced key-value store.      |
   +------------------------+-----------------------------------------------------------------------+


Now that your code is published, let us launch a service in the cloud of your choice.



Launch Addon
============================

- Click ``Marketplace`` icon on the top-right-corner from Dashboard.

- Choose "Service" logo to launch your service

- Click Proceed

- Your service will be available in the URL.

   .. image:: /images/servicestep2url.png



Configure a Service
=========================

Every service has a unique set of attributes to configure. Refer the provider specific link before entering them.

- :ref:`PostgreSQL <postgresservice>`
- :ref:`Riak <riakservice>`
- :ref:`Redis <redisservice>`
- :ref:`Loadbalancers <loadbalancersservice>`



Manage Service
============================

Once the service is launched, to manage them.   Click ``Services`` from Dashboard.

  .. image:: /images/myappsusage.png


**Delete**

 Click ``your service name`` under ``My Service``

 Click Delete




 You can find available services in the catalog under Services in the IBM® megam\u2122 user interface.

Predefined services are available in megam for mobile applications. megam makes it easy for you to implement, host, and scale these mobile services for your mobile apps. You can focus on your application logic and application design.

megam hosts and manages middleware services for web applications. Application developers can specify the middleware services that they require. megam then automatically provisions new instances of the specified middleware services and binds the service instances to the application.

You can select which types of services are displayed in the catalog. The following table lists the available filters that you can select:
Table 1. Service typesFilter 	Description
IBM 	Services that are created by IBM.
Third Party 	Services that are provided by IBM partners.
Community 	Services that are provided by open source communities.
Experimental 	Services that are in a trial stage of development. If a service is experimental, it is not production-ready and might be removed at any time. The service provider does not provide support or guarantee.
Private 	Services that are visible only to specified users or organizations.
Note: The services in megam might be tagged as beta. A beta service is an almost development-complete service that is used for testing.

To use a service in the megam user interface, cf command line interface, IBM DevOps Services, or any supported tools, take the following steps:

    Create an instance of the service. In most cases, the service instance can be created when you create the application.
    Identify the application that uses the new service instance. For web applications, you can specify more than one application to use the same service instance, typically for data sharing.
    Write your own code in your application to interact with the service.


Requesting a new service instance
Last Updated: 10/9/2014

IBM® megam\u2122 has a list of services and manages them on behalf of the developers.

You can select the service that you need when you develop applications. Upon your selection, megam interacts with the service and takes necessary steps to provision a new instance of the service. The provisioning process might be different for different types of services. For example, a database service creates a database, and a push notification service for mobile applications generates configuration information.

When an instance of a service is created, you can bind that instance of the service to your application. A service instance can be shared across web applications.

To request a new service instance by using the cf command line interface, perform the following steps:

    Select a type of service, and then create an instance of the service by using the cf create-service command.
    Bind the instance of the service to the target application by using the cf bind-service command. A service instance can be shared across web applications.
    Use the service.

The application must be configured to interact with the service. Each service might require a different mechanism for communicating with applications. These mechanisms are documented as part of the service definition for your information when you develop applications. For consistency, the mechanisms are required for your application to interact with the service.

For example, megam provides the user ID, password, and the access URI for the application to use the database service. megam also provides the application identity (app ID), security information that is specific to the client, and the access URI for the application to use a mobile back-end service. The mobile services typically work in context with each other so that context information, such as the name of the application developer and the user using the application, can be shared across the set of services.

For web applications or server-side cloud code for mobile applications, runtime credentials are provided to the application in the VCAP_SERVICES environment variable. The value of the VCAP_SERVICES environment variable is the serialization of a JSON object. The variable contains the runtime data that is required to interact with the services that the application is bound to. The format of the data is different for different services. You might need to read the service documentation about what to expect and how to interpret each piece of information.
Enabling external applications and third-party tools to use megam services

You might have applications that were created and run outside of megam, or you might use third-party tools. If megam services provide endpoints that are exposed to the internet, you can use those services with your local apps or third-party tools.

To enable an external application or third-party tool to use a megam service, complete the following steps:

    In megam, create an instance of the service that you want to use for your external application or third-party tool.
    Bind the service instance to an existing megam application. The credentials and connection parameters for the service are created.
    Retrieve the credentials and the connection parameters of the service instance from the VCAP_SERVICES environment variable.
    Specify the credentials and the connection parameters in your external application or third-party tool.

Your application or tool can now access the megam service.

Terms of use/ Notices
