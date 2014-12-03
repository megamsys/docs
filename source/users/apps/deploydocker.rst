.. _deploydocker:

====================
Deploying In Docker
====================

This section describes the **Deployment of an Application** in a ``Dockerized VM`` from Megam.

Deployment has 3 steps:

1. Create or use your Dockerized VM
2. Build your Docker image
3. Deploy in Megam


Step 1. Create Dockerized VM
================================

This assumes that you have a running ``Dockerized VM`` launched using the :ref:`Addon - Docker <dockeraddon>`. This is needed as you will point to this running dockerized VM and launch apps/services containers in them.


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

A sample Docker file to build a java image is shown below.

.. code::

    FROM dockerfile/java

    # Install Tomcat
    RUN sudo apt-get update
    RUN sudo apt-get install tomcat7

    # Add your webapp file into your docker image into Tomcat's webapps directory
    # Your webapp file must be at the same location as your Dockerfile
    ADD mywebapp.war /var/lib/tomcat7/webapps/

    # Expose TCP port 8080
    EXPOSE 8080

    # Start Tomcat server
    CMD sudo service tomcat7 start && tail -f /var/log/tomcat7/catalina.out

    $ docker build -t tomcat7-test <Dockerfile's path>

    $ docker build -t tomcat7-test myuser/myjavaapp

    In the above example you can see that the docker image is stored under `myser` in `DockerHub hub.docker.com` under name ``myjavaapp``

Deploy App in Dockerized VM
----------------------------

Register an userid with Megam.

Launch an addon Docker which launches a dockerized VM.

Upon launch you can find your ``Dockerized VM`` appearing in the Dashboard.

|varail docker run|

Launch ``Visual Designer``, and drag and drop a ``Cloud Settings``. Click on the cloud settings.

|varai docker vm1|

Now drag and drop a ``Java App`` and click on the icon by providing the ``DockerHub`` URL.

|varai docker vm2|

When you click deploy a docker container will be launched in the dockerized VM.


Please click here to watch a screen cast. https://www.youtube.com/watch?v=fUg4MrRh1NI&feature=youtu.be

.. |varai docker vm1| image:: /images/dockerizedvm_1.png
.. |varai docker run| image:: /images/dockerizedvm_run.png
.. |varai docker vm2| image:: /images/dockerizedvm_2.png
