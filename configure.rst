###########################
Configure
###########################

.. _quick-install-guide:



Megam configuration
====================================

Configuration
-------------

Now that you have `megam installed` successfully installed on your system, you can
continue with configuring  Megam. 

Configuration files for the core components described in the architecture can be found 
in their deploy directories.

If for some reason you encounter any problems check on these.

Gateway
-------

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

Riak
----

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
==========

Gateway
-------

.. warning:: If you installed megam for your private datacenter. This is strictly a onetime, administrator step. 

Then open a browser and point to:

`http://myapi.megam.co:9000/` 

What happens during this process
--------------------------------

The quick init does 3 steps


Once you see the Login screen, go ahead and login using:

| Step 1 : Prepares an initial sandbox userid with a predefined cloud.
| Step 2 : Loads the predefined app/services definitions.
| Step 3 : Automatically downloads and prepares herk with the predefined Chef cookbooks from a public Git repository.



Using the installation
======================

Then open a browser and point to:

`http://myportal.megam.co:3000/`

You should be able to:

* Launch apps/services from the default predefined cloud setting. 
* Launch apps from marketplace
* Use the command line client to access the REST APIs