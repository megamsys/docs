---
title: "Megdc commandline tool"
excerpt: "A CLI based tool to setup your data center in minutes."
---
[block:api-header]
{
  "type": "basic",
  "title": "CLI"
}
[/block]
Now that you have bootstrapped the Master, this guide will walk you through in using the CLI based megdc tool 

## What does the tool provide ? 

You can 

  * Setup SlimBox
  * Upgrade SlimBox to BeeBox
  * Upgrade SlimBox to RhinoBox 
  * Upgrade BeeBox with more compute/storage.
  * See the status and generate a report for support

[block:callout]
{
  "type": "success",
  "title": "Pre requisite",
  "body": "* Bootstrapping master is complete\n* You have the master's IP address handy (hint :  use  `ifconfig` in master)"
}
[/block]
##Running version
[block:code]
{
  "codes": [
    {
      "code": "megdc version",
      "language": "shell"
    }
  ]
}
[/block]
##Running help
[block:code]
{
  "codes": [
    {
      "code": "megdc help",
      "language": "shell"
    }
  ]
}
[/block]
Now that you are ready, lets [complete the slimbox installation](doc:megam_slimbox_complete). 
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue button\" href=\"megam_slimbox_complete\" role=\"button\">Go to the completing SlimBox</a><style></style>"
}
[/block]