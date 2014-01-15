############
Installation 
############


This guide describes the installation process for Megam client and server

Megam is built on client/server model. We currently support Linux/Unix-like users, it is quite straightforward to install and
have it up and running in Debian/Ubuntu.

Client
------

**Command line client**

The command line client (CLI) uses Ruby 2.0.+/2.1.0 + to interact with Megam. 

* To install the Ruby-based Megam client tools, you first need to install git and Ruby Gems.

**Using the command client**

You should be able to:

* Use megam command line client to access the REST APIs.
* Create a new account at megam.
* Create app/services using a cloud setting.

**Userinterface**

Try out online: `https://www.megam.co <http://www.megam.co>`_ We provide more features than the CLI.





System Requirements
^^^^^^^^^^^^^^^^^^^

The command line client requires any Ruby 2.0.x to 2.1.x. 

The following table identifies on which combination of Ruby and Platform the unit tests have been run. The result 
for each combination is shown, "No" means "in progress we are working on it.":

    ============  ============ ============= ============= 
         \         Ubuntu 13.x  Debian 		 RedHat/CentOS
    ============  ============ ============= =============
    Ruby 2.1.0     Yes     		Yes            No     
    Ruby 2.0.x     Yes     		Yes            No  
    ============  ============ ============= =============
    

Let us know (support [at] megam.co.in) if you have successfully used Megam with 
other combinations of Ruby and Platform.

Linux and Unix-like environments
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Debian/Ubuntu
^^^^^^^^^^^^^

On a Debian-based Linux distribution, it’s as easy as:

* Install Ruby :

.. code-block:: console
 
 $ sudo apt-get update

 $ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev 
 libyaml-dev libxml2-dev libxslt1-dev
 
 $ sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
 
 $ curl -L https://get.rvm.io | bash -s stable
 
 $ source ~/.rvm/scripts/rvm
 
 $ echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
 
 $ rvm install 2.1.0-p0

 $ rvm use 2.1.0-p0 --default
 
 $ ruby -v

* Next, install the Megam client ruby gem:

    .. code-block:: console

		$ gem install meggy

Server
------

.. warning:: All in one install. Ideal for development environments. 

    $ curl -L https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/mc.sh all | sudo bash    



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