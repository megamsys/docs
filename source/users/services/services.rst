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
  

