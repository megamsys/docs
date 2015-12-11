---
title: "Frequently Asked Questions"
excerpt: "We have aggregated a bunch of answers for you. Hopefully it solves your need."
---
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/i3XDb6t8SVVK6MWJsLoL",
        "runs-hardware.png",
        "286",
        "286",
        "#5c6d75",
        ""
      ]
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "Megdc - opensource",
  "body": "Go ahead, hope we have answered your queries ?"
}
[/block]
##Can't import the image from OpenNebula marketplace into the cephds

The cephds shows the size as 0kb in OpenNebula. 

If you use a single system(Slimbox), Name of HOST and CEPH_HOST should be same.
If you want to edit these to you can edit them by clicking edit icons in OpenNebula dash..
[block:callout]
{
  "type": "info",
  "title": "Megam",
  "body": "Go ahead, the next section is for you."
}
[/block]
##When i click on the Marketplace, it returns to the Nilavu - Dashboard?

Your Gateway isn't setup properly. 

Verify if Riak is running, and gateway too.

[block:code]
{
  "codes": [
    {
      "code": "sudo riak ping\n\nsudo status megamgateway",
      "language": "shell"
    }
  ]
}
[/block]
**Open the files **

`/var/lib/megam/nilavu.yml` and verify if the following settings are correct as per your installation.

This assumes that you have installed every thing in one machine and are trying to expose the platform ui (nilavu) outside.
[block:code]
{
  "codes": [
    {
      "code": "## connect.storage.db is a host that the nilavu will connect to\n## for saving key/value pairs in storage\n## Default: localhost\n##\n## Acceptable values:\n##   - text, e.g. localhost, console.megam.io\n  riak: 192.168.1.9\n",
      "language": "text"
    }
  ]
}
[/block]
`/var/lib/megam/megamgateway/gateway.conf`
[block:code]
{
  "codes": [
    {
      "code": "# Riak-Production\n# ~~~~~\nriak.url=\"localhost\"",
      "language": "text"
    }
  ]
}
[/block]
`/etc/riak/riak.conf`

The following assumed that riak is running in localhost.
[block:code]
{
  "codes": [
    {
      "code": "## Name of the Erlang node\n## \n## Default: riak@127.0.0.1\n## \n## Acceptable values:\n##   - text\nnodename = riak@127.0.0.1\n\n## listener.http.<name> is an IP address and TCP port that the Riak\n## HTTP interface will bind.\n## \n## Default: 127.0.0.1:8098\n## \n## Acceptable values:\n##   - an IP/port pair, e.g. 127.0.0.1:10011\nlistener.http.internal = 127.0.0.1:8098\n\n## listener.protobuf.<name> is an IP address and TCP port that the Riak\n## Protocol Buffers interface will bind.\n## \n## Default: 127.0.0.1:8087\n## \n## Acceptable values:\n##   - an IP/port pair, e.g. 127.0.0.1:10011\nlistener.protobuf.internal = 127.0.0.1:8087\n",
      "language": "text"
    }
  ]
}
[/block]
For more information refer [Painless verification](doc:painless-verification) 
[block:callout]
{
  "type": "info",
  "body": "We hang around in our [public hipchat room](http://j.mp/megamchat).\nShoot us an email [support@megam.io](mailto:support@megam.io) and we'll have a support engineer get back to you in 24 hrs.",
  "title": "Any questions? We're always here to help"
}
[/block]