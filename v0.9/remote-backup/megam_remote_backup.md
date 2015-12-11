---
title: "Installation"
excerpt: ""
---
[block:api-header]
{
  "type": "basic",
  "title": "Installing ceph gateway"
}
[/block]
We support Ubuntu 14.04 but are working to support CentOS7.1. If you wish give a hand in porting [send us pullrequest for packager](https://github.com/megamsys/packager.git)

All our installs are via the [Megdc commandline tool](doc:megam_megdc_tool) 

# Ubuntu 14.04

Go ahead, its a simple command to install our awesome open source object storage using [Megdc commandline tool](doc:megam_megdc_tool) 
[block:code]
{
  "codes": [
    {
      "code": "megdc cephgateway",
      "language": "shell",
      "name": "ceph gateway"
    }
  ]
}
[/block]
Once you have installed it,  you can need to configure **Nilavu** to use the remote backup.

##Configure [nilavu](https://github.com/megamsys/nilavu.git)
[block:code]
{
  "codes": [
    {
      "code": "## Backup cephgw, host, adminuser, admin password.\n  backup:\n    enable: on\n    host: <localhost>\n    username: <megdc>\n    password: <megdc>\n",
      "language": "yaml",
      "name": "/var/lib/megam/nilavu.yaml"
    }
  ]
}
[/block]
##Restart [nilavu](https://github.com/megamsys/nilavu.git)
[block:code]
{
  "codes": [
    {
      "code": "stop megamnilavu\n\nstart megamnilavu",
      "language": "shell",
      "name": "restart nilavu"
    }
  ]
}
[/block]
##Remote backup[nilavu](https://github.com/megamsys/nilavu.git)

Launch [Megam Oja](doc:megam_oja_install) 

You should see a little icon named **Storage**. Click on it, and  you can create and upload files.