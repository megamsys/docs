---
title: "Java"
excerpt: "Now, read further to get a clear walk through on how to deploy a java app"
---
Hope you are familiar with [Taking Megam Oja' cockpit to a spin](doc:taking-megam-oja-to-a-spin)

You will enter Megam Oja cockpit (Code name: [Nilavu](https://github.com/megamsys/nilavu.git)) through which you can launch apps, service and torpedos, monitor them seamlessly.

##2. Click Marketplaces on the top bar 

Marketplace contains all the linux distros,  applications, services and microservices which megam oja supports. 

##3. Click Duke icon (Java)

A window will pop up with for SSHkey options. You can create new sshkey, use an existing sshkey or upload your own sshkeys too. 

##4. Configure SSHKeys

You're almost there

##5. Pick a repository 

Choose your public or private repository. 

Let us use [Github: megamsys/java-getting-started.git](https://github.com/megamsys/java-getting-started.git)

##6. Launch Java App

Click Create.

##7. Make changes to your Java App code *optional*

Let us say we want to make changes in the code. In our case the sample starter pack app code [Java Web](https://github.com/megamsys/java-getting-started.git)
[block:code]
{
  "codes": [
    {
      "code": "$ git clone https://github.com/megamsys/java-getting-started.git",
      "language": "shell"
    }
  ]
}
[/block]
Make sure you have the build tools like **git**, **maven**, or **gradle** installed
[block:code]
{
  "codes": [
    {
      "code": "$ cd java-getting-started\n\n$ mvn install",
      "language": "shell"
    }
  ]
}
[/block]
##8. Push your changes *optional*

Let us say we are done testing the changes and want to push the changes to Git/Github
[block:code]
{
  "codes": [
    {
      "code": "$ cd java-getting-started\n\n$ git push master\n\nUsername for 'https://github.com': megamio\nPassword for 'https://megamio@github.com': \n\nTo https://github.com/indykish/nilavu.git\n   1d26d24..5cabacb  master -> master\n",
      "language": "shell"
    }
  ]
}
[/block]
Voila ! Your App is up to date.


Now that you have launched your app, you might want to launch a service (database) and [bind it](doc:megam_bind_app)

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"postgresql\" role=\"button\">Go to the services</a>\n<style>\n\n</style>"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
  "title": "Any questions? We're always here to help"
}
[/block]