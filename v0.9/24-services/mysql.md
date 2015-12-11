---
title: "MySQL"
excerpt: "Now, read further to get a clear walk through on how to deploy a SQL data store service."
---
[block:api-header]
{
  "type": "basic",
  "title": "Launch MySQL"
}
[/block]
Hope you are familiar with [Taking Megam Oja' cockpit to a spin](doc:taking-megam-oja-to-a-spin)

You will enter Megam Oja cockpit (Code name: [Nilavu](https://github.com/megamsys/nilavu.git)) through which you can launch apps, service and torpedos, monitor them seamlessly.

##1. Click Marketplaces on the top bar 

Marketplace contains all the linux distros,  applications, services and microservices which megam oja supports. 

##2. Click MySQL

A window will pop up with for SSHkey options. You can create new sshkey, use an existing sshkey or upload your own sshkeys too. 

##3. Configure SSHKeys

You're almost there

##4. Launch MySQL

Press `Create` 
[block:callout]
{
  "type": "info",
  "title": "Hurray",
  "body": "You can see the launched mysql up and running on your \"Megam Oja\". Click the link on the nice little box to know more about the instance."
}
[/block]
**Note** Your ip address shall be on the services overview page. You can [SSH into your service](doc:ssh-into-your-torpedo).
[block:parameters]
{
  "data": {
    "0-0": "- port: 3306\n- username: root\n- password: megam",
    "h-0": "Defaults settings for MySQL"
  },
  "cols": 1,
  "rows": 1
}
[/block]
Want to cluster and scale MySQL, sure here is the link [scale](http://devcenter.megam.io/2015/09/08/mysql-master-slave-replication/)