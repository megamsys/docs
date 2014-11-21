.. _installcli:

===================================
Command Line
===================================


This page shows you how to install meggy - Megam's Command Line using a ruby gem.

Step 1. Installing Meggy
========================

.. note:: You'll need ruby 2.0 > . You can install ruby using rvm.

Installing on any Linux distro
---------------------------------

.. code::

    gem install meggy

help
--------

.. code::

    meg help

|meg help|


account create
---------------

.. code::

    gem install meggy

|meg account create|


config .megam/meg.rb
---------------------

.. code::

    ls ~
    mkdir -p .megam

|meg cli|


open .megam/meg.rb
---------------------

.. code::

    nano ~/.megam/meg.rb

|meg account nano|


account show
---------------------

.. code::

    meg account show

|meg account show|


cloudset list
---------------------

.. code::

    meg cloudset list

|meg cloudset list|


csar create
---------------------

.. code::

    meg csar create appdb.csar

|meg csar create|


csar list
---------------------

.. code::

    meg csar list

|meg csar list|


csar push
---------------------

.. code::

    meg csar push CSAR01212312312
|meg csar push|


  .. |meg help| image::  /images/cli_meg_help.png
  .. |meg cli|  image::  /images/cli_meg.rb.png
  .. |meg account create| image:: /images/cli_account_create.png
  .. |meg account nano| image::  /images/cli_account_nano.png
  .. |meg account show| image::  /images/cli_account_show.png
  .. |meg cloudset list| image:: /images/cli_cloudset_list.png
  .. |meg csar create| image::  /images/cli_csar_created.png
  .. |meg csar list| image::  /images/cli_csar_list.png
