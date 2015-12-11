---
title: "PostgreSQL"
excerpt: "Now, read further to get a clear walk through on how to deploy a SQL data store service."
---
[block:api-header]
{
  "type": "basic",
  "title": "Launch PostgreSQL"
}
[/block]
Hope you are familiar with [Taking Megam Oja' cockpit to a spin](doc:taking-megam-oja-to-a-spin)

You will enter Megam Oja cockpit (Code name: [Nilavu](https://github.com/megamsys/nilavu.git)) through which you can launch apps, service and torpedos, monitor them seamlessly.

##1. Click Marketplaces on the top bar 

Marketplace contains all the linux distros,  applications, services and microservices which megam oja supports. 

##2. Click PostgreSQL

A window will pop up with for SSHkey options. You can create new sshkey, use an existing sshkey or upload your own sshkeys too. 

##3. Configure SSHKeys

You're almost there

##4. Launch PostgreSQL

Press `Create` 
[block:callout]
{
  "type": "info",
  "title": "Hurray",
  "body": "You can see the launched postgresql up and running on your \"Megam Oja\". Click the link on the nice little box to know more about the instance."
}
[/block]
**Note** Your ip address shall be on the services overview page. You can [SSH into your service](doc:ssh-into-your-torpedo).
[block:parameters]
{
  "data": {
    "0-0": "- port: 5432\n- username: postgres\n- password: megam",
    "h-0": "Defaults settings"
  },
  "cols": 1,
  "rows": 1
}
[/block]