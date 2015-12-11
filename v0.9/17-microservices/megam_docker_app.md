---
title: "Launch a container"
excerpt: "Now, read further to get a clear walk through on how to deploy an app as Docker container"
---
Hope you are familiar with [Taking Megam Oja' cockpit to a spin](doc:taking-megam-oja-to-a-spin)

You will enter Megam Oja cockpit (Code name: [Nilavu](https://github.com/megamsys/nilavu.git)) through which you can launch apps, service and torpedos, monitor them seamlessly.

##2. Click Marketplaces on the top bar 

Marketplace contains all the linux distros,  applications, services and microservices which megam oja supports. 

##3. Click Docker icon (Stacked one)

A window will pop up with for SSHkey options. You can create new sshkey, use an existing sshkey or upload your own sshkeys too. 

##4. Configure SSHKeys

You're almost there

##5. Pick a dockerhub image 

This an URL of the image you would like to launch in [hub.docker](hub.docker.com)

##6. Launch your Docker Java app

Click create. 

##7. Build and push docker image *optional*

Skip this step, if you already have an image to run

Let us Build the docker image and publish to your private or public docker registry.

Create a Dockerfile in your code directory. 
[block:code]
{
  "codes": [
    {
      "code": "FROM dockerfile/java\n\n# Install Tomcat\nRUN sudo apt-get update\nRUN sudo apt-get install tomcat7\n\n# Add your webapp file into your docker image into Tomcat's webapps directory\n# Your webapp file must be at the same location as your Dockerfile\nADD mywebapp.war /var/lib/tomcat7/webapps/\n\n# Expose TCP port 8080\nEXPOSE 8080\n\n# Start Tomcat server\nCMD sudo service tomcat7 start && tail -f /var/log/tomcat7/catalina.out",
      "language": "shell",
      "name": "Dockerfile"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "$ docker build -t tomcat7-test <Dockerfile's path>\n\n$ docker build -t tomcat7-test megamio/myjavaapp",
      "language": "text"
    }
  ]
}
[/block]
The built docker image is stored under *megamio* in *DockerHub hub.docker.com* under name *myjavaapp*


Voila ! Your container is running.
[block:callout]
{
  "type": "info",
  "body": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
  "title": "Any questions? We're always here to help"
}
[/block]