---
title: "#4 Launch torpedo - Oja"
excerpt: "Lets launch a torpedo from Megam Oja"
---
# Megam Oja

The app orchestrator used to manage apps/services is Megam Oja. The web ui is code named as [nilavu](https://github.com/megamsys/nilavu.git)

When the SlimBox is ready launch [http://<ipaddress>:8080](http://<ipaddress>:8080) which will display the login screen of Megam Oja.


[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/HbaU2nQJTKCvqLAYGQ12",
        "megam_krag.png",
        "1350",
        "654",
        "#cd3544",
        ""
      ]
    }
  ]
}
[/block]
The following are the core servers that will be running
[block:parameters]
{
  "data": {
    "h-0": "Servers",
    "0-0": "Megam Nilavu",
    "1-0": "Megam Gateway",
    "0-2": "http://<your_ip>:8080",
    "1-2": "http://<your_ip>:9000",
    "2-2": "http://<your_ip>:7777",
    "2-0": "Megamd",
    "0-1": "The Megam Oja cockpit",
    "1-1": "The Megam Oja API server",
    "2-1": "Omni scheduler",
    "3-0": "Riak",
    "3-1": "No SQLDatabase",
    "3-2": "http://<your_ip>:8098",
    "4-0": "RabbitMQ",
    "4-1": "Messaging layer",
    "4-2": "http://<your_ip>:15672 *we don't enable the web ui."
  },
  "cols": 3,
  "rows": 5
}
[/block]
##Scaling Megam Oja

If you are looking at scaling **Megam Oja**, we will update our [Megdc commandline tool](doc:megam_megdc_tool)  to do the same.

For now we have authored articles, we use this a lot, hence go for it.

  * [Scaling Riak](http://devcenter.megam.io/2015/08/27/riak-cluster/)

  * [Scaling RabbitMQ](http://devcenter.megam.io/2015/08/27/rabbitmq-cluster/) 

  * [Clustering MySQL](http://devcenter.megam.io/2015/09/08/mysql-master-slave-replication/) 
[block:parameters]
{
  "data": {
    "0-0": "If you want to add more compute/storage then its time to upgrade to BeeBox.\n\nCheck out the [What is BeeBox ?](doc:megam_whatis_beebox) .\n\n[Launch Torpedo (ubuntu)](doc:ubuntu)",
    "0-1": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
    "h-0": "Next up",
    "h-1": "Questions"
  },
  "cols": 2,
  "rows": 1
}
[/block]