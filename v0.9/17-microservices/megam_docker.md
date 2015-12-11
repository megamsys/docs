---
title: "Getting started"
excerpt: "Wow ! You are a micro man. Docker can be launched quite easy."
---
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/fVGTMKk0T9Ko5BtYIICk",
        "megam_microservices.png",
        "211",
        "228",
        "#515e65",
        ""
      ]
    }
  ]
}
[/block]
#<b>Container as service</b>

Megam Oja supports provisioning and maintaining containers on bare metal, scaling your application, and operational logistics like logging, monitoring, and health management.
[block:parameters]
{
  "data": {
    "0-0": "Use secure private image repository to launch containers\n* Orchestrating container deploys with zero downtime\n* Networking between containers on multiple hosts\n* Managing container logs\n* Advanced isolation like dedicated host / VM per tenant where only a single tenant’s  docker containers run",
    "h-0": "What do we provide ?"
  },
  "cols": 1,
  "rows": 1
}
[/block]
##Deploying Docker Containers 

You can deploy docker containers and indicate how many containers that you want running. We take care of the rest for you. After your docker containers are deployed, you can easily scale them up or down when the usage or load of the containers change.

##DockerHub

Using docker images from [dockerhub](hub.docker.com) to launch docker containers

##Multiple docker deployment methods

You can deploy docker containers with various deployment methods, whether you want to deploy docker containers inside a VM, launch containers on bare metal, setting up docker clusters, Oja helps you get going. 

[block:callout]
{
  "type": "success",
  "title": "Docker private registory support",
  "body": "Docker private registry is supported with megam Oja\nhttps://docs.docker.com/registry/deploying/"
}
[/block]
Let go ahead and launch a container
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"megam_docker_app\" role=\"button\">Go to the app using docker</a><style></style>"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Why containers ?"
}
[/block]
Containers are based on shared operating systems. They are much skinner and more efficient than hypervisors. Instead of virtualizing hardware, containers rest on top of a single Linux instance. This means you can “leave behind the useless 99.9% VM junk, leaving you with a small, neat capsule containing your application, This has implications for application density.

Containerized virtualization descends from LXC (LinuX Containers) which is an operating system–level virtualization method for running multiple isolated Linux systems (containers) on a single control host.
[block:callout]
{
  "type": "info",
  "title": "What is LXC",
  "body": "LXC is a userspace interface for the Linux kernel containment features. Through a powerful API and simple tools, it lets Linux users easily create and manage system or application containers."
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "LXC features:\n\nKernel namespaces (ipc, uts, mount, pid, network and user\nApparmor and SELinux profiles\nSeccomp policies\nChroots (using pivot_root)\nKernel capabilities\nControl groups (cgroups)"
  },
  "cols": 1,
  "rows": 1
}
[/block]
The one thing that hypervisors can do that containers can’t is to use different operating systems or kernels. For example, you can use kvm to run instances of Linux and Windows at the same time. With LXC, all containers must use the same operating system and kernel. In short, you can’t mix and match containers the way you can with VMs.

##VM vs Docker
Each virtualized application includes not only the application - which may be only 10s of MB - and the necessary binaries and libraries, but also an entire guest operating system - which may weigh 10s of GB.

The Docker Engine container comprises just the application and its dependencies. It runs as an isolated process in userspace on the host operating system, sharing the kernel with other containers. Thus, it enjoys the resource isolation and allocation benefits of VMs but is much more portable and efficient.

Docker currently uses its own default execution environment libcontainer which run in the same operating system as its host. This allows it to share a lot of the host operating system resources. It also uses AuFS for the file system. It also manages the networking for you as well. AuFS is a layered file system, so you can have a read only part, and a write part, and merge those together. So you could have the common parts of the operating system as read only, which are shared amongst all of your containers, and then give each container its own mount for writing. So let’s say you have a container image that is 1GB in size. If you wanted to use a Full VM, you would need to have 1GB times x number of VMs you want. With Docker and AuFS you can share the bulk of the 1GB and if you have 1000 containers you still might only have a little over 1GB of space for the containers OS, assuming they are all running the same OS image.

With Docker (libcontainer) you get less isolation, but they are more lightweight and require less resources. So you could easily run 1000’s on a host, and it doesn’t even blink. A full virtualized system usually takes minutes to start, LXC containers take seconds, and sometimes even less than a second. If you want full isolation with guaranteed resources, a full VM is the way to go. If you just want to isolate processes from each other and want to run a ton of them on a reasonably sized host, then Docker might be the way to go.

Deploying a consistent production environment is easier said than done. What docker does is it gives you the ability to snapshot the OS into a common image, and makes it easy to deploy on other docker hosts. Locally, dev, qa, prod, etc, all the same image. Sure you can do this with other tools, but not as easily or fast.

This is great for unit testing, lets say you have 1000 tests and they need to connect to a database, and in order to not break anything you need to run serially so that the tests don’t step on each other (run each test in a transaction and roll back). With Docker you could create an image of your database, and then run all the tests in parallel since you know they will all be running against the same snapshot of the database. Since they are running in parallel and in Docker containers they could run all on the same box at the same time, and your tests will finish much faster.

The big win here for application developers is that programs such as Docker enable you to create a containerized app on your laptop and deploy it to the cloud. Containers gives you instant application portability. In theory, you can do this with hypervisors, but in reality there’s a lot of time spent getting the VMs right.

## Terminology 

#<b>Docker<b>

Docker is an open-source project that makes creating and managing Linux containers really easy, and provides the capability to package an application with its runtime dependencies into a container. Containers are like extremely lightweight VMs as they allow code to run in isolation from other containers but safely share the machine’s resources, all without the overhead of a hypervisor. It provides a Docker CLI command line tool for the lifecycle management of image-based containers. Linux containers enable rapid application deployment, simpler testing, maintenance, and troubleshooting while improving security. 

The terminology of Docker which we will use in the below sections :

#<b>Layers</b>
In a traditional Linux boot, the kernel first mounts the root File System as read-only, checks its integrity, and then switches the whole rootfs volume to read-write mode.

#<b>Layer</b>
When Docker mounts the rootfs, it starts read-only, as in a traditional Linux boot, but then, instead of changing the file system to read-write mode, it takes advantage of a union mount to add a read-write file system over the read-only file system. In fact there may be multiple read-only file systems stacked on top of each other. We think of each one of these file systems as a layer.

#<b>Container</b>
Container is an application sandbox. Each container is based on an image that holds necessary configuration data.

Once you start a process in Docker from an Image, Docker fetches the image and its Parent Image, and repeats the process until it reaches the Base Image. Then the Union File System adds a read-write layer on top. That read-write layer, plus the information about its Parent Image and some additional information like its unique id, networking configuration, and resource limits is called a container. Every time you commit a container (using the docker commit command), a new image layer is added to store your changes. Containers can change, and so they have state. A container may be running or exited. All containers are identified by a 64 hexadecimal digit string (internally a 256bit value). [For more information ](http://docs.docker.com/terms/container)

#<b>Image</b>
In Docker terminology, a read-only Layer is called an image. An image never changes. Image is  a static snapshot of the containers’ configuration. Image is a read-only layer that is never modified, all changes are made in top-most writable layer, and can be saved only by creating a new image. Each image depends on one or more parent images.

#<b>Base Image</b>
An image that has no parent. Base images define the runtime environment, packages and utilities necessary for containerized application to run. The base image is read-only, so any changes are reflected in the copied images stacked on top of it.

#<b>Registry</b>
Is a repository of images. Registries are public or private repositories that contain images available for download. Some registries allow users to upload images to make them available to others.

#<b>Dockerfile</b>
Is a configuration file with build instructions for Docker images. Dockerfiles provide a way to automate, reuse, and share build procedures.