.. _deploydocker:

====================
Deploying In Docker
====================

This section describes the **deployment of an dockerized application** in Megam.

Application deployment has 3 steps:

1. Create or use your docker cluster
2. Build a docker image
3. Deploy in Megam


Step 1. Create a Docker Cluster
================================

This assumes that you have a running ``Docker cluster`` launched using the :ref:`Addon - Docker <dockeraddon>`. This is needed as you will point to this running cluster and launch dockerized apps/services.


Step 2. Build Docker Image
================================


Install `docker <https://docs.docker.com/installation/#installation>`_ in your local workstation.

Create a ``Dockerfile`` in your code directory. Read about `Dockerfile <http://docs.docker.com/reference/builder/>`_.



Step 3. Deploy in Megam
========================

Git
---
To deploy via Git, you need it installed on your machine. You can find more information on `Installing Git: <http://git-scm.com/download/linux>`__

Follow these steps to deploy your application:

Get the git deployment url from your source control manager. It will be off the form **http(s)://myserver.gom/<your_app_id>.git.**

In your terminal, go to your code directory. If you do not track your code with git, start by typing:

.. code::

  $ git init
  $ git add .
  $ git commit -m "first commit"

Then, link your local repository to the Git remote url:

.. code::

  $ git remote add <remote-name> <your-git-deployment-url>

  Push your application to Github:

  $ git push <remote-name> <branch-name>:master

Docker
-------

`Build  <http://docs.docker.com/reference/builder/>`_ the docker image and publish to your private or public docker registry.

Deploy App
---------------

:ref:`Launch it Megam <deployapps>`

Checkout your application logs in the dashboard to monitor the deployment.
