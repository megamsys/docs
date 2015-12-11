---
title: "Hacking guide"
excerpt: "So you have decided to build your own cloudplatform  or datacenter management software."
---
#Megam  Oja

Consists of applications, services, buildpacks, and other components.

##Applications

In Megam, an application, or app, represents the artifact that a developer is building.

##Web apps

Web apps consist of all the code that is required to be run or referenced at run time. Web app artifacts are uploaded to Megam to host the application. 

##Services

A service is a cloud extension that is may be hosted by Megam  or created by you. The service provides functionality that is ready-for-use by the app’s running code. The predefined services provided by Megam  include database, messaging, big data.

Megam simplifies the use of services by provisioning new instances of the service, and binding those service instances to your application. 

##Add-ons

An add-on is a Megam extension that enriches the platform. Addon items like Docker, Monitoring are not used by the running code, but provide functions to enrich the platform. They in turn can be used to manage applications in docker or manage the application in a better way.

Some of the addon functions are

* Auto scaling to automatically increase or decrease the platform capacity by adding more application or service instances.
* Monitoring response time, performance, and availability.
* Continuous integration(CI) through automatic building, testing, and deployment.

##Starter Packs

A starter is a template that includes predefined services and application code that is configured with a particular buildpack. You can use a starter pack to quickly get up and running. For example, you can select the Java Web App starterpack to host java web app and sqllite db.

##Runtimes

A runtime is the set of resources that is used to run an application. Megam provides runtime environments for different types of applications. The runtime environments are integrated as buildpacks into Megam, and are automatically configured for use.

##Buildpacks

A buildpack is a collection of scripts that prepare your code for execution on the target. A buildpack gathers the runtime and framework dependencies of an application. Then, it packages them with the application that can be deployed to the cloud.
If you do not specify a buildpack when you deploy your application to Megam, built-in buildpacks are used by default.
[block:callout]
{
  "type": "info",
  "title": "Built-in Buildpacks",
  "body": "Java\nRuby\nPlay\nNode.js\nPHP *beta*"
}
[/block]
##Application Lifecycle

This describes the lifecycle of an app, from the time it is deployed through its removal. 

* User starts by going to the [spring-petclinic](https://github.com/megamsys/java-spring-petclinic) on GitHub and cloning the Java application to a local notebook machine.

* User then makes changes and pushes the code in GitHub.

* User launches Megam cockpit (Code named: [Nilavu](https://github.com/megamsys/nilavu.git)) browser-based user interface and creates a Application with the GitHub link.

* User then sees the application appearing in the Megam palette of applications launched

* User deletes an application when you are done with it

The app lifecycle is illustrated by the sequence diagram below.


The various states transitions an Application may undergo are shown below.

**App state**
This illustration represents the transitions between app execution states. The next several sections of this topic describe these states and events.

**App launched**
An app is launched whenever it is submitted by the user to Megam.

**App started**
If an App is staged successfully in Megam, then the App enters running/started state.

**App stopped**
When the user sends an event to stop an App, the app enter Stopped state.

**App restart**
When the user sends an event to restart an App, the app is restarted and goes to Started state.

**App removal**
When a user deletes your app, the app is removed, along with all its local data.
[block:callout]
{
  "type": "info",
  "body": "Read below for more detail about when each state transition occurs and what your app should do in response.",
  "title": "Note"
}
[/block]
##Sequence of steps

From the Megam browser-based user interface, the user enters the credentials and is signed into Megam. 

* The user performs Create App

The Megam browser-based user interface tells the Gateway to create a record for the application.

* The Gateway stores the application metadata (e.g. the app name, number of instances the user specified, source repo(Git), host pool to launch, and the buildpack).
[block:callout]
{
  "type": "warning",
  "body": "Assembly represents the internal philosophy of describing application and services in Megam.",
  "title": "What is Assembly ?"
}
[/block]
* The Gateway issues a staging request to the Assembly execution engine.

* The Assembly Execution Engine chooses a host(VM) as preferred by the user to launch the application and starts the staging by using the Provisioner.

* The staging Assembly streams the output of the staging process so the user can troubleshoot application staging problems.

* The Provisioner gets an ``Assembly running` and brings the state of it to the one desired by the user. This would involve building the assembly, starting the assembly.

* The Assembly Running reports to the Store that the process is complete.

* The running Assemblies stream the status of the application to the Streamer.

* The Assembly Running starts an Assembly Agent which handles all the requests like Start, Stop, Restart, Delete as asked by the user.

#<b>Megam cloud platform from source</b>


[block:callout]
{
  "type": "warning",
  "title": "Package install caveats",
  "body": "- Ubuntu: **apt-get  install** command installs a package \n- ArchLinux: **pacman -S** or **yaourt** command installs a package."
}
[/block]
##<b>Ubuntu</b>
 
 ###<b>Nilavu</b>

 * Setup ruby using [devcenter article](http://devcenter.megam.io/2015/03/03/megam_install_ruby/) 

 *  Setup MEGAM_HOME variable in .bashrc

[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/megamsys/nilavu.git",
      "language": "text"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "$ cd nilavu\n\n$ cp conf/nilavu.yml $MEGAM_HOME\n\n$ bundle update\n\n$ bundle install\n\n$ bundle exec passenger start -p 3000",
      "language": "text"
    }
  ]
}
[/block]
###Megam SnowFlake

[block:code]
{
  "codes": [
    {
      "code": "sudo apt-add-repository \"deb [arch=amd64]  http://get.megam.co/0.6/ubuntu/14.04/ testing megam\"\n\nsudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7\n\nsudo apt-get update\n\nsudo apt-get install megamcommon\n\nsudo apt-get install megamsnowflake riak",
      "language": "text"
    }
  ]
}
[/block]
###RabbitMQ

 * Setup rabbitmq-server
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-get install rabbitmq-server",
      "language": "text"
    }
  ]
}
[/block]
###Gateway:

* Setup sbt, scala, play - [here](http://devcenter.megam.io/2015/03/16/setting-up-scala-sbt-play-akka/)
[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/megamsys/megam_gateway.git",
      "language": "text"
    }
  ]
}
[/block]
Once you have set up and cloned gateway, run it
[block:code]
{
  "codes": [
    {
      "code": "cd megam_gateway\n\nsbt\n\nclean\n\ncompile\n\nrun",
      "language": "text"
    }
  ]
}
[/block]




##megamd :

 * Setup [golang](http://devcenter.megam.io/2015/03/13/setting-up-golang/)
 
 * Setup GOPATH

[block:code]
{
  "codes": [
    {
      "code": "mkdir ~/.go\n\nnano .bashrc\n\nexport GOPATH=~/.go\nexport GOROOT=~/software/go",
      "language": "text"
    }
  ]
}
[/block]

 * clone and run megamd
[block:code]
{
  "codes": [
    {
      "code": "$ git clone https://github.com/megamsys/megamd.git\n\n$ go get github.com/tools/godep\n\n$ cd megamd\n\n$ make test",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "title": "Launch Nilavu",
  "body": "Nilavu: [http://localhost:3000](http://localhost:3000)\n\nGateway: [http://localhost:9000](http://localhost:9000)"
}
[/block]
If incase...
[block:code]
{
  "codes": [
    {
      "code": "#Fix for \"gateway failing with an *IOException - permission denied*.\"\n\ncd /var/lib/megam\n\nmkdir megamgateway\n\nnano .megam_primed (and save it)",
      "language": "text"
    }
  ]
}
[/block]
##ARCHLINUX

##Nilavu:

* setup Ruby

[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/megamsys/nilavu.git",
      "language": "text"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "$ cd nilavu\n\n$ cp conf/nilavu.yml $MEGAM_HOME\n\n$ bundle update\n\n$ bundle install\n\n$ bundle exec passenger start -p 3000",
      "language": "text"
    }
  ]
}
[/block]
###Gateway:


* Setup sbt, scala, play - [here](http://devcenter.megam.io/2015/03/16/setting-up-scala-sbt-play-akka/)

[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/megamsys/megam_gateway.git",
      "language": "text"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "cd megam_gateway\n\nsbt\n\nclean\n\ncompile\n\nrun",
      "language": "text"
    }
  ]
}
[/block]
###RabbitMQ

[block:code]
{
  "codes": [
    {
      "code": "sudo yaourt rabbitmq",
      "language": "text"
    }
  ]
}
[/block]
###Megam Snowflake

[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/megamsys/pysnowflake.git\n\nsetup an systemd job for snowflake after cloning\n\nyaourt  riak",
      "language": "text"
    }
  ]
}
[/block]
##megamd :

* Setup golang

[block:code]
{
  "codes": [
    {
      "code": "mkdir ~/.go\n\nnano .bashrc\n\nexport GOPATH=~/.go\nexport GOROOT=~/software/go",
      "language": "text"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "$ git clone https://github.com/megamsys/megamd.git\n\n$ go get github.com/tools/godep\n\n$ cd megamd\n\n$ make test",
      "language": "text"
    }
  ]
}
[/block]