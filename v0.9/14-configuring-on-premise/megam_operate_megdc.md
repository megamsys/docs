---
title: "#2 Launch ubuntu"
excerpt: "Ok, lets verify, if we can run in OpenNebula"
---
#Taking it to spin

The infrastructure is managed by [OpenNebula](http://docs.opennebula.org)  with storage from [ceph.com](http://ceph.com) and application orchestrator [Megam Oja](https://github.com/megamsys) 

##OpenNebula

When the SlimBox is ready launch [http://<ip>:9869](http://<ip>:9869) which will display the login screen for OpenNebula.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/6w3jgrvTTNqKQ5qgoRFO",
        "megam_checkpoint_one2.png",
        "1227",
        "563",
        "#457881",
        ""
      ]
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "OpenNebula credentials",
    "1-0": "Check the status of opennebula host, it should be `ON`. If not, try to ssh opennebula_host from opennebula_master without password as `oneadmin` user",
    "h-0": "Pre requisites"
  },
  "cols": 1,
  "rows": 2
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"megamoja_configure\" role=\"button\">Go to the step 3.</a>\n<style>\n\n</style>"
}
[/block]