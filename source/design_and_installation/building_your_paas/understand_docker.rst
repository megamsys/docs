.. _understand_docker:

================================================================================
Understanding Docker
================================================================================

This guide is meant for the cloud architect and administrator, to help them understand the way Megam automates the infrastructure resources for ``containers`` like ``Docker``, and how they are consumed by the users.

Containers are based on shared operating systems. They are much skinner and more efficient than hypervisors. Instead of virtualizing hardware, containers rest on top of a single Linux instance. This means you can “leave behind the useless 99.9% VM junk, leaving you with a small, neat capsule containing your application,
This has implications for application density.

Containerized virtualization descends from LXC (LinuX Containers) which is an operating system–level virtualization method for running multiple isolated Linux systems (containers) on a single control host.

What's LXC?
  LXC is a userspace interface for the Linux kernel containment features. Through a powerful API and simple tools, it lets Linux users easily create and manage system or application containers.

Features
  Current LXC uses the following kernel features to contain processes:

  -  Kernel namespaces (ipc, uts, mount, pid, network and user)
  -  Apparmor and SELinux profiles
  -  Seccomp policies
  -  Chroots (using pivot_root)
  -  Kernel capabilities
  -  Control groups (cgroups)

As such, LXC is often considered as something in the middle between a chroot on steroids and a full fledged virtual machine. The goal of LXC is to create an environment as close as possible as a standard Linux installation but without the need for a separate kernel.

The one thing that hypervisors can do that containers can’t is to use different operating systems or kernels. For example, you can use kvm to run instances of Linux and Windows at the same time. With LXC, all containers must use the same operating system and kernel. In short, you can’t mix and match containers the way you can with VMs.

We find ``Docker`` Mania has picked up, in Megam we explain the approach on how its used in our PaaS.

Docker
-------

Docker is an open-source project that makes creating and managing Linux containers really  easy, and provides the capability to package an application with its runtime dependencies into a container. Containers are like extremely lightweight VMs as  they allow code to run in isolation from other containers but safely share the machine’s resources, all without the overhead of a hypervisor. It provides a Docker CLI command line tool for the lifecycle management of image-based containers. Linux containers enable rapid application deployment, simpler testing, maintenance, and troubleshooting while improving security.
Using Megam with Docker allows customers to increase staff efficiency, deploy third-party applications faster, enable a more agile development environment, and manage resources more tightly.

Why Docker
***************

VM vs Docker
  Each virtualized application includes not only the application - which may be only 10s of MB - and the necessary binaries and libraries, but also an entire guest operating system - which may weigh 10s of GB.

The Docker Engine container comprises just the application and its dependencies. It runs as an isolated process in userspace on the host operating system, sharing the kernel with other containers. Thus, it enjoys the resource isolation and allocation benefits of VMs but is much more portable and efficient.

.. image:: /images/megam_docker_introduction.png
  :scale: 70 %
  :alt: Docker intro
  :align: center


Docker currently uses  its own default execution environment  libcontainer which run in the same operating system as its host. This allows it to share a lot of the host operating system resources. It also uses AuFS for the file system. It also manages the networking for you as well. AuFS is a layered file system, so you can have a read only part, and a write part, and merge those together. So you could have the common parts of the operating system as read only, which are shared amongst all of your containers, and then give each container its own mount for writing.
So let's say you have a container image that is 1GB in size. If you wanted to use a Full VM, you would need to have 1GB times x number of VMs you want. With Docker  and AuFS you can share the bulk of the 1GB and if you have 1000 containers you still might only have a little over 1GB of space for the containers OS, assuming they are all running the same OS image.

With Docker (libcontainer) you get less isolation, but they are more lightweight and require less resources. So you could easily run 1000's on a host, and it doesn't even blink.
A full virtualized system usually takes minutes to start, LXC containers take seconds, and sometimes even less than a second.
If you want full isolation with guaranteed resources, a full VM is the way to go.
If you just want to isolate processes from each other and want to run a ton of them on a reasonably sized host, then Docker might be the way to go.

Deploying a consistent production environment is easier said than done.
What docker does is it gives you the ability to snapshot the OS into a common image, and makes it easy to deploy on other docker hosts. Locally, dev, qa, prod, etc, all the same image. Sure you can do this with other tools, but not as easily or fast.

This is great for unit testing, lets say you have 1000 tests and they need to connect to a database, and in order to not break anything you need to run serially so that the tests don't step on each other (run each test in a transaction and roll back). With Docker you could create an image of your database, and then run all the tests in parallel since you know they will all be running against the same snapshot of the database. Since they are running in parallel and in Docker containers they could run all on the same box at the same time, and your tests will finish much faster.

The big win here for application developers is that programs such as Docker enable you to create a containerized app on your laptop and deploy it to the cloud. Containers gives you instant application portability. In theory, you can do this with hypervisors, but in reality there’s a lot of time spent getting the  VMs right.

The terminology of Docker which we will use in the below sections :

Layers
  In a traditional Linux boot, the kernel first mounts the root File System as read-only, checks its integrity, and then switches the whole rootfs volume to read-write mode.

Layer
  When Docker mounts the rootfs, it starts read-only, as in a traditional Linux boot, but then, instead of changing the file system to read-write mode, it takes advantage of a union mount to add a read-write file system over the read-only file system. In fact there may be multiple read-only file systems stacked on top of each other. We think of each one of these file systems as a layer.
For more information http://docs.docker.com/terms/layer

Container:
  Container is an application sandbox. Each container is based on an image that holds necessary configuration data.
Once you start a process in Docker from an Image, Docker fetches the image and its Parent Image, and repeats the process until it reaches the Base Image. Then the Union File System adds a read-write layer on top. That read-write layer, plus the information about its Parent Image and some additional information like its unique id, networking configuration, and resource limits is called a container.  Every time you commit a container (using the docker commit command), a new image layer is added to store your changes. Containers can change, and so they have state. A container may be running or exited.  All containers are identified by a 64 hexadecimal digit string (internally a 256bit value).
For more information http://docs.docker.com/terms/container

Image:
  In Docker terminology, a read-only Layer is called an image. An image never changes. Image is  a static snapshot of the containers' configuration. Image is a read-only layer that is never modified, all changes are made in top-most writable layer, and can be saved only by creating a new image. Each image depends on one or more parent images.
For more information http://docs.docker.com/terms/image/

Base Image:
  An image that has no parent. Base images define the runtime environment, packages and utilities necessary for containerized application to run. The base image is read-only, so any changes are reflected in the copied images stacked on top of it.

Registry
  Is a repository of images. Registries are public or private repositories that contain images available for download. Some registries allow users to upload images to make them available to others.

Dockerfile
  Is a configuration file with build instructions for Docker images. Dockerfiles provide a way to automate, reuse, and share build procedures.

Container as service
----------------------------

Megam Docker supports provisioning and maintaining the underlying virtual machine housing the docker cluster, scaling your application, and operational logistics like logging, monitoring, and health management.

We provide ability to :

-  Use secure private image repository to launch containers
-  Orchestrating container deploys with zero downtime
-  Networking between containers on multiple hosts
-  Managing container logs
-  Advanced isolation like dedicated host / VM per tenant where  only a single tenant’s docker containers run

The virtual machine(VM1...n) that has an operating system contains ``docker`` with features of scaling, high availability, application performance monitoring built in. This is called a **Docker Cluster**.

Megam abstracts and hides most of the complexities that are associated with hosting and managing cloud-based dockerized applications. As an application developer, you can focus on developing your application without having to manage the infrastructure that is required to host it. For dockerized apps, you can upload your ``docker image URL`` to megam and indicate how many containers that you want running. Then, megam takes care of the rest. After your docker containers are deployed, you can easily scale them up or down when the usage or load of the containers change.

The enterprise app is undergoing significant changes in the way it is built, deployed, and updated. The journey toward a customer-facing infrastructure often begins with one of the following events. Not every IT department goes through every event in the same sequence, but these are notable milestones for which businesses should prepare.


|megam docker lifecycle|

Code
    An user works on the code and creates an approach to build a docker container. This is usually by having a `Dockerfile`
Build App
    An user using the docker tools to build the docker container which contains an app or service.
Test
    An user now wants to test it, hence can do testing in their local workstation by running the docker image.
Stage
    An user now wants to stage the code and hences launches a ``Docker Cluster`` from Megam. Read about ``Docker Cluster`` in the next section.
GA/Deploy
    Megam deploys the  users docker container in the ``Docker cluster``

The above illustration summarizes ``Enterprise lifecycle flow``  for container based development and how we handle it in Megam. All the plumbing work needed to setup a docker cluster and its containers are handled by Megam on the cloud of choice.


Publishing your Docker Image
---------------------------------

Docker registry
  In order to use an image built from Docker in Megam, you'll need to push that image into a Docker registry. You can use a private Docker registry or the public DockerHub.

Private docker registry
  To setup private docker registry you can follow the `Registry Install <https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-14-04>`_ to host a registry in Megam. In your configuration of the container to launch in Megam, you should pass the fully qualified registry name of the image you want to push myprivateregistry.com:8080/username/imagename.

Public DockerHub
  To push images to the `DockerHub <hub.docker.com>`_ you need to login using docker login command. This command will create a file named .dockercfg in your home directory containing your Hub credentials. When the docker build completes this file will be read by Docker, and the credentials inside of it will be used to push your image to DockerHub.

.. NOTE: You must tag your built image as <username-for-credentials>/<imagename> when using the DockerHub.


How does it work ?
-------------------

At its core, Megam is an environment for you to build applications and use services when you develop applications as containers. Megam uses IaaS to deploy a docker cluster(virtual machines) that host each deployed docker image as container. In this environment any docker image which may comprise of application, pre-built services (including third-party services) can be launched.

As a developer, you can interact with the Megam infrastructure by using a browser-based user interface called :ref:`Nilavu <nilavu>`. You can also use a Megam command line interface, called :ref:`meg <introcli>`, to deploy docker images.

|megam docker cluster|

When you deploy an application to Megam, you must configure Megam with enough information to support the application.

* For a dockerized app, you must ensure that information about the location of the docker image (an URL : eg: dockerhub url) is communicated to Megam, so that it can set up the proper execution environment to run the dockerized application.

Each execution environment, is isolated from the execution environment of other applications. The execution environments are isolated even though these apps are on the same physical machine. The above figure shows how megam manages the deployment of dockerized applications (from docker images).

When you create an application and deploy it to megam as a docker image, the megam environment determines an appropriate docker cluster which is essentialy a ``CentOS 7`` virtual machine with ``OpenShift Geard`` and orchestrated with ``Gulpd from Megam``. Read about :ref:`Megam Engine - Gulpd <plan>`.


What is geard?
  geard is a command-line client and agent for integrating and linking Docker containers into systemd across multiple hosts. It helps Megam install and manage the components of their developers applications.

What can geard do?
    -  Install a Docker image into systemd with network and environment configuration
    -  Start, stop, and restart individual containers
    -  Create private network links between containers for easy configuration
    -  Enable SSH to containers, distribute public keys, and create and manage Git repositories
    -  Integrate with application orchestrators to manage hundreds or thousands of hosts and many more containers.

The geard client itself is merged directly into the Megam ``Gulpd`` for all-in-one management of a docker cluster.

What happens inside the Docker Cluster
    When an user publishes a docker image URL to Megam, megam receives it and uses  ``Geard`` to start the container. The docker image is downloaded, public/private network is setup on the container with a port mapping of the host(Docker Cluster) and the container.



Accessing the Containers
-------------------------

Every containers will have an URL of the Docker Cluster with port associated with it. When a request comes in, the request is directed to the container it is intended for.

Any container can be terminated, deleted, moved, or cloned on a new Docker Cluster when it is required.

Read about :ref:`Deploying In Docker <deploydocker>` in the users guide.


Container Linking
------------------

When your dockerized apps / dockerized services are running in the cloud, we need a way to link them just so the service gets consumed by the application.

|megam docker container linking|

The above picture shows  a Docker cluster in which several applcation(A1...An) and services(S1..Sn) are running. From a  container standpoint, it just another network end-point its trying to attach itself to. When we say attach itself we merely setup environment variables in the linked-to container and enable communication across the linked containers.

Megam will use Geard to link containers.
Read more about `container link(Docker) <https://docs.docker.com/userguide/dockerlinks/>`_ for that.





.. |megam docker container linking| image:: /images/megam_docker_multitenancy_container_linking.png
.. |megam docker cluster| image:: /images/megam_docker_cluster.png
.. |megam docker lifecycle| image:: /images/megam_docker_lifecycle.png
