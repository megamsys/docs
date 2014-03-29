############
Installation 
############


This guide describes the installation process for Megam client

Megam is built on client/server model. We currently support Linux/Unix-like users, it is quite straightforward to install and
have it up and running in Debian/Ubuntu.

**Userinterface**

Try out online: `https://www.megam.co <http://www.megam.co>`_.


 
**Command line client**

A Ruby based command line client is a work in progress. 

.. The command line client (CLI) uses Ruby 2.0.+/2.1.0 + to interact with Megam. 
.. 
.. * To install the Ruby-based Megam client tools, you first need to install git and Ruby Gems.
.. 
.. **Using the command client**
..  
.. You should be able to:
.. 
.. * Use megam command line client to access the REST APIs.
.. * Create a new account at megam.
.. * Create app/services using a cloud setting.
.. 
.. 
..
.. System Requirements
.. ^^^^^^^^^^^^^^^^^^^
.. 
.. The command line client requires any Ruby 2.0.x to 2.1.x. 
.. 
.. The following table identifies on which combination of Ruby and Platform the unit tests have been run. The result 
.. for each combination is shown, "No" means "in progress we are working on it.":
.. 
.. ============  ============ ============= ============= 
..         \         Ubuntu 13.x  Debian 		 RedHat/CentOS
..    ============  ============ ============= =============
..    Ruby 2.1.0     Yes     		Yes            No     
..    Ruby 2.0.x     Yes     		Yes            No  
..    ============  ============ ============= =============
    

.. Let us know (support [at] megam.co.in) if you have successfully used Megam with 
.. other combinations of Ruby and Platform.
.. 
.. Linux and Unix-like environments
.. ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. Debian/Ubuntu
.. ^^^^^^^^^^^^^

.. On a Debian-based Linux distribution, it’s as easy as:

.. * Install Ruby :

.. .. code-block:: console
 
.. $ sudo apt-get update

..  $ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev 
..  libyaml-dev libxml2-dev libxslt1-dev
 
..  $ sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
 
..  $ curl -L https://get.rvm.io | bash -s stable
 
..  $ source ~/.rvm/scripts/rvm
 
..  $ echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
 
..  $ rvm install 2.1.0-p0

..  $ rvm use 2.1.0-p0 --default
 
..  $ ruby -v

.. * Next, install the Megam client ruby gem:

..  .. code-block:: console

		$ gem install meggy

