---
title: "Installation"
excerpt: "This page will help you install open source cloud management on baremetal. You'll be up and running microservices in a jiffy!"
---
[block:api-header]
{
  "type": "basic",
  "title": "Installing Oja"
}
[/block]
We support Ubuntu 14.04 but are working to support CentOS7.1. If you wish give a hand in porting [send us pullrequest for packager](https://github.com/megamsys/packager.git)

All our installs are via the [Megdc commandline tool](doc:megam_megdc_tool) 

# Ubuntu 14.04

Go ahead, its a simple command to install our awesome open source application orchestrator using [megdc tool](doc:megam_slimbox_complete)

Once you have installed it,  you can access Megam Oja  by launching **Nilavu**

###Start services

[block:code]
{
  "codes": [
    {
      "code": "start megamnilavu\n\nstart megamgateway\n\nstart megamd",
      "language": "shell",
      "name": "Starting Megam Oja"
    }
  ]
}
[/block]
###Stop services
[block:code]
{
  "codes": [
    {
      "code": "stop megamnilavu\n\nstop megamgateway\n\nstop megamd",
      "language": "shell",
      "name": "Stopping Megam Oja"
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "0-1": "[http://<your_ip>:7777](http://<your_ip>:7777)",
    "1-1": "[http://<your_ip>:8080](http://<your_ip>:8080)",
    "2-1": "[http://<your_ip>:9000](http://<your_ip>:9000)",
    "0-0": "Nilavu : Cockpit awesome  console",
    "1-0": "Gateway: API server",
    "2-0": "Megamd: Omni scheduler",
    "h-0": "Core Oja services",
    "h-1": "URL"
  },
  "cols": 2,
  "rows": 3
}
[/block]
Au Oh ! thinks didn't go well
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button green button\" href=\"http://docs.megam.io/docs/megamoja_ping\" role=\"button\">Go to troubleshooting guide</a><style></style>"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Upgrading"
}
[/block]
The following configuration files shall be backed up before an upgrade.  We will fix upgrades via [Megdc commandline tool](doc:megam_megdc_tool)  in **1.0**

## Backup these files

- /var/lib/megam/nilavu.yml
- /var/lib/megam/megamgateway/gateway.conf
- /var/lib/megam/megamd/megamd.conf

## Ubuntu 14.04 

[block:code]
{
  "codes": [
    {
      "code": "sudo apt-get update\n\n## the above should list the updated packages\n\nsudp apt-get upgrade",
      "language": "shell"
    }
  ]
}
[/block]
It is recommended to use the new `megamd.conf` and  [refer configuration](doc:megam_oja_install)  for more information

We will make sure this process is painless in the future builds.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue button\" href=\"http://docs.megam.io/docs/megamoja_configuration\" role=\"button\">Go to configuration(advanced)</a><style></style>"
}
[/block]