---
title: "Riak"
excerpt: "Now, read further to get a clear walk through on how to deploy a NOSQL data store service"
---
[block:api-header]
{
  "type": "basic",
  "title": "Launch Riak"
}
[/block]
Hope you are familiar with [Taking Megam Oja' cockpit to a spin](doc:taking-megam-oja-to-a-spin)

You will enter Megam Oja cockpit (Code name: [Nilavu](https://github.com/megamsys/nilavu.git)) through which you can launch apps, service and torpedos, monitor them seamlessly.

##1. Click Marketplaces on the top bar 

Marketplace contains all the linux distros,  applications, services and microservices which megam oja supports. 

##2. Click Riak

A window will pop up with for SSHkey options. You can create new sshkey, use an existing sshkey or upload your own sshkeys too. 

##3. Configure SSHKeys

You're almost there

##4. Launch Riak

Press `Create` 
[block:callout]
{
  "type": "info",
  "title": "Hurray",
  "body": "You can see the launched riak service up and running on your \"Megam Oja\". Click the link on the nice little box to know more about the instance."
}
[/block]
**Note** Your ip address shall be on the services overview page. You can [SSH into your service](doc:ssh-into-your-torpedo).
[block:parameters]
{
  "data": {
    "0-0": "- port: 8098\n- url: <ip>:8098",
    "h-0": "Defaults settings for riak"
  },
  "cols": 1,
  "rows": 1
}
[/block]
Want to cluster and scale riak, sure here is the link [scale](http://devcenter.megam.io/2015/08/27/riak-cluster/)