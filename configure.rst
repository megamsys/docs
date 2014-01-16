###########################
Private Datacenter
###########################

.. _quick-install-guide:

.. warning:: This is a work in progress section.  


Server
------



Ubuntu
^^^^^^

.. hint:: You can install the individual components in the deployment model as in the architecture. Ideal for production use.


.. Installation of Gateway
.. ==========================
..
.. First of all we need to install the Gateway. To do so please add the
.. following line in your ``/etc/apt/sources.list`` file:
..
.. .. code-block:: console
..
..   deb http://ppa:launchpad.net/megamsys/0.1 saucy/
..
.. Then run:
..
.. .. code-block:: console
..
..  # curl https://launchpad.net/megamsys/launchpad.net-megamsys.pub | apt-key add -
..   # apt-get update
..   # apt-get install megamplay   
   
  
**Enterprise Chef: Register for an account**
  
    
    
    `http://www.getchef.com/enterprise-chef/ <http://www.getchef.com/enterprise-chef/>`_
    
    
(or) 

    
**Opensource Chef:**

    .. code-block:: console

        $ wget  https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/mc.sh
        $ sudo ./mc.sh chef
        
        
**Gateway + Riak group:**

    .. code-block:: console

        $ wget  https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/mc.sh
        $ sudo ./mc.sh play
        $ sudo ./mc.sh riak
          
**Herk  + RabbitMQ group:**

    .. code-block:: console

        Install RabbitMQ `http://www.rabbitmq.com/install-debian.html` http://www.rabbitmq.com/install-debian.html
        
        $ sudo ./mc.sh herk
        
        
**UID:**

    .. code-block:: console

        $ sudo ./mc.sh zookeeper
        $ sudo ./mc.sh snowflake
        
        
High Availablity(HA)
--------------------

.. hint:: Contact us, we have automated chef cook books which sets up a HA installation for you. 



Configuration
-------------

Now that you have `megam server installed` successfully installed on your system, you can
continue with configuring  Megam. 

Configuration files for the core components described in the architecture can be found 
in their deploy directories.

If for some reason you encounter any problems check on these.

**Gateway**


``/usr/share/megam/play/application-production.conf`` : 

.. code-block:: console 

    # In this case riak is running at api.megam.co 
	riak.url="http://api.megam.co:8098/riak/"
    # Replace api.megam.co to  myapiserver.mydomain.com 
		
    # In this case uid is running at uid1.megam.co.in  
	sf.host="uid1.megam.co.in"
    # Replace uid1.megam.co.in to  myuidserver.mydomain.com 
	

    # In this case rabbitmq is running at rabbitmq1.megam.co.in
	amqp.url = "amqp://rabbitmq1.megam.co.in:5672/vhost"
    # Replace rabbitmq1.megam.co.in to  myamqpserver.mydomain.com

.. code-block:: console 

    # Restart the Gateway to pickup the changes.
	$ sudo stop play
	$ sudo start play

**Riak**

``/etc/riak/riak.config`` : 

.. code-block:: console 

	# Verify if the storage backend is leveldb.  
	# Storage_backend specifies the Erlang module defining the storage
	# mechanism that will be used on this node.
	storage_backend = leveldb 	
   
.. code-block:: console 

	# Restart Riak to pickup the changes.
	$ sudo riak stop
	$ sudo riak start
	
	

Quick Init
----------

**Gateway**

.. warning:: If you installed megam for your private datacenter. This is strictly a one-time, administrator step. 

Open a browser and point to:

`http://myapi.megam.co:9000/` 

Click `Quick Init`


**What happens during this process**

The quick Init does 3 steps


Once you see the Login screen, go ahead and login using:

| Step 1 : Prepares an initial sandbox userid with a predefined cloud.
| Step 2 : Loads the predefined app/services definitions.
| Step 3 : Automatically downloads and prepares herk with the predefined Chef cookbooks from a public Git repository.



Using the installation
----------------------

If you have our Rails portal installed locally,  

Then open a browser and point to:

`http://myportal.megam.co:3000/`

You should be able to:

* Launch apps/services from the default predefined cloud setting. 
* Launch apps from marketplace
* Use the command line client to access the REST APIs