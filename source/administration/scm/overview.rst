.. _scmoverview:

===================================
 Overview
===================================

Megam integrates with different  source control (SCM) which can be used as source code repository to deploy apps/services.

``Megam`` can deploy using public/private Git repository of apps/services in the cloud.  We support integration to  the following.


Gogs  `http://gogs.io <http://gogs.io>`_.
=================================

Gogs is a self hosted Git service written in Go.  This is for customers who wish to run a Git repository on premise.

Read about installing gogs  :ref:`here <installgogs>`

Configuring
----------------

This step needs to be performed by administrators, upon installating **gogs**. The following appears when the very first time  gogs is invoked using the URL ``http:\\<ip>:4000``

|megam gogs1|

Accept the defaults. You can configure a SMTP server  as shown below. If you need an SMTP server, then we suggest you to look at  `http://mandrillapp.com <https://mandrillapp.com>`_.

Once you signup to ``mandrillapp`` note down the following.

|megam mandrill|

Complete the SMTP credentials and **Install Gogs**.

|megam gogs2|

Megam needs to be configured with the client_id and secret_key in gogs. Create a client_id and secret_key in gogs.

.. code::

    $ nano /var/lib/megam/nilavu.yml

    #add the client_id and secret_key

    auth:
        github_client_id: abcde214
        github_secret_key: abcdefff

Restart nilavu. Read about :ref:`Restarting  Megam <restart_megam>`

Github
======


If you don't have an account yet, please feel free to get one. `https://github.com <https://github.com>`_.

Megam needs to be configured with the client_id and secret_key in gogs. Create a client_id and secret_key in gogs.

|megam github1|


When the organization has a key registered, it will appear as follows.


|megam github2|


.. code::

    $ nano /var/lib/megam/nilavu.yml

    #add the client_id and secret_key

    auth:
        github_client_id: abcde214
        github_secret_key: abcdefff



Assembla
========

If you don't have an account yet, please feel free to get one. `https://assembla.com <https://assembla.com>`_.

Read about `How to use Assembla in Megam <http://gomegam.com/blog/2014/03/auto-code-deploy-from-assembla-to-any-cloud/>`_.

.. code::
    $ nano /var/lib/megam/nilavu.yml

    #add the client_id and secret_key

    auth:
        assembla_client_id: abcde214
        assembla_secret_key: abcdefff

.. |megam github1| image:: /images/github_key.png
.. |megam github2| image:: /images/github_key1.png
.. |megam gogs1| image:: /images/gogs_install.png
.. |megam gogs2| image:: /images/gogs_install1.png
.. |megam mandrill| image:: /images/mandrillapp.png
