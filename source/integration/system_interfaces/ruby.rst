.. _ruby:

==========================
Megam Ruby API
==========================

This page contains the Megam API specification for Ruby. It has been designed as a wrapper for the :ref:`REST API <restapi>`, with some basic helpers. This means that you should be familiar with the REST API and the JSON formats returned by the Megam core.

API Documentation
=================


Usage
=====

You can use the Rubygem available in `Rubygems.org <rubygems.org>_`

.. code::

    gem install megam_api


.. code::

    ##############################################################################
    # Required libraries
    ##############################################################################
    require 'megam_api'

Code Sample
=============

This is a small code snippet. As you can see, the code flow would be as follows:

. code::

  #List your Account in megam
  require 'megam_api'

  # where API_KEY = your key, EMAIL = your email
  megam = Megam::API.new(:headers => {:api_key => API_KEY, :email => EMAIL});

  megam.get_accounts(EMAIL);
  
