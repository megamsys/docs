---
title: "Overview"
excerpt: "Learn what we offer, and how you can get started,."
---
[block:api-header]
{
  "type": "basic",
  "title": "Megam cloud platform"
}
[/block]
Megam  cloud platform helps agile enterprises achieve their DevOps vision. An organization will become cloud ready with battle tested open source products with an improved ROI. A built-in marketplace allows IT operations engineers to build automation, application components, runtimes, and libraries using popular open source tools like 

* [OpenNebula](http://opennebula.org)
* [Urknall](http://urknall.dynport.de/)
* [Ceph](http://ceph.com)
* [Chef](https://chef.io)
* [Docker](http://docker.com)
* [GitHub](https://github.com/megamsys)
* [Gitlab](https://gitlab.com) 

Developers and QA don't need to worry how the underlying automation or tools work. They simply self-service environments at the click of a button from the marketplace on demand.
[block:callout]
{
  "type": "success",
  "title": "Editions",
  "body": "1. On premise opensource\n2. On premise enterprise edition (contact [info@megam.io](mailto:info@megam.io))\n**Public offering**  -  coming soon by the end of this year"
}
[/block]
The projects under *`Megam cloud platform`* umbrella are as shown below.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/MmGI83pRj6vKbknKkZGQ",
        "megam_cloudy.png",
        "195",
        "138",
        "#ae2746",
        ""
      ]
    }
  ]
}
[/block]
#Megdc

*Megdc*  helps you to setup **Megam cloud platform** in your organization(onpremise) in a few lines of of command. Sweet. 
[block:html]
{
  "html": "<div></div>\n<div></div>\n<a class=\"megam-button blue\" href=\"http://docs.megam.io/docs/megam_megdc\" role=\"button\">Go to Megdc</a><style></style>\n<style></style>"
}
[/block]
#Megam Oja

Megam *Oja* is our application orchestrator that helps you to manage and orchestrate apps services in your own cloud.
[block:html]
{
  "html": "<div></div>\n<div></div>\n<a class=\"megam-button green\" href=\"http://docs.megam.io/docs/megam_oja\" role=\"button\">Go to Megam Oja</a><style></style>\n<style></style>"
}
[/block]
#Remote backup

*Remote backup* is our object based backup storage that helps you to store and manage your backup dumps (csvs, txts, database dumps) using an awesome, intuitive UI.  

:1234:  We will name this project in the future.
[block:html]
{
  "html": "<div></div>\n<div></div>\n<a class=\"megam-button blue\" href=\"http://docs.megam.io/docs/megam_backup\" role=\"button\">Go to Remote backup</a><style></style>\n<style></style>"
}
[/block]
#Meglytics

Meglytics helps an organization make sense of the remotely backed up data. We provide abilty to build custom templates that can be processed in our analytics workbench using an intuitive UI. This is like `Bring your analyics` 
[block:html]
{
  "html": "<div></div>\n<div></div>\n<a class=\"megam-button green\" href=\"http://docs.megam.io/docs/megam_meglytics\" role=\"button\">Go to Meglytics</a><style></style>\n<style></style>"
}
[/block]
## Terminology 

The verbose you need to be familiar with when reading this documentation for our projects **Megdc**, **MegamOja**, **Remote backup** and **Meglytics** are detailed below. 

 #<b>Torpedo</b>

A torpedo is a colored VM, which means we provide more frill features like logs, monitoring, orchestration built in  a VM.

We've written torpedo guides for a variety of different platforms: Debian, Ubuntu, CentOS, CoreOS. This guide will walk you through launching a torpedo in Megam Oja
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"http://docs.megam.io/docs/debian\" role=\"button\">Go to the torpedos</a>\n<style>\n\n</style>"
}
[/block]
#<b>Microservices(Docker)</b>

We've written microservice  guide for a variety of different services, apps available in  [Docker Hub](hub.docker.com)  which can be launched in Megam Oja. 
[block:parameters]
{
  "data": {
    "0-0": "CoreOS",
    "0-1": "Deploy micro service (docker) clusters using your favorite service discovery framework (etcd, serf, consul)",
    "1-0": "DockerContainers *beta*",
    "1-1": "Micro services (Docker containers) in baremetal using a clustered [megamswarm](doc:megam_cmp_install)",
    "2-0": "DockerBox *beta*",
    "2-1": "Micro service (Docker containers) in a VM"
  },
  "cols": 2,
  "rows": 3
}
[/block]
This guide will walk you through in launching an image in [Docker Hub](hub.docker.com) or private docker hub registry in Megam Oja.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue button\" href=\"http://docs.megam.io/docs/megam_docker\" role=\"button\">Go to the micro services</a><style></style>"
}
[/block]

#<b>Apps</b>

We've written language and framework guides for a variety of different platforms: 
- Java
- Rails
- Playframework (Scala)
- Node.js 
- PHP *beta*
- 
This guide will walk you through in launching your app in Megam Oja

The sky is the limit, the marketplace can be extended to your need.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"http://docs.megam.io/docs/megam_app_java\" role=\"button\">Go to the apps</a>\n<style>\n</style>"
}
[/block]

#<b>Services</b>

We've written guides for a variety of different services: 
- Hadoop
- Spark
- SparkNotebook
- OwnCloud
- Zarafa
- PostgreSQL
- Redis
- Riak
- MySQL *beta*

These guides will walk you through in integrating your launched app with a service in Megam Oja.

The sky is the limit, the marketplace can be extended to your need.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue button\" href=\"http://docs.megam.io/docs/postgresql\" role=\"button\">Go to the services</a><style></style>"
}
[/block]