---
title: "#3 Megam oja"
excerpt: "Let us tell our ominscheduler how to orchestrate"
---
#Connect OpenNebula to Megamd

Megamd is our core engine that is an omni scheduler. The scheduler needs to know the credentials for communicating with  OpenNebula or any IaaS layer natively.

Want to contribute, sure here is the project [megamsys/opennebula-go](https://github.com/megamsys/opennebula-go).

##Get OpenNebula credentials
[block:code]
{
  "codes": [
    {
      "code": "#ssh to OneFrontend \n\ncat  /var/lib/one/.one/one_auth \n\n## this will be in the format (oneadmin:password)",
      "language": "shell",
      "name": "OpenNebula credentials"
    }
  ]
}
[/block]
##Feed the credentials to megamd
[block:parameters]
{
  "data": {
    "h-0": "Field",
    "0-0": "one_userid",
    "1-0": "one_password",
    "2-0": "one_endpoint: http://<your_opennebula_master_ip>:2633/RPC2",
    "0-1": "The opennebula user as found in the /var/lib/one/.one/one_auth file",
    "1-1": "The opennebula user as found in the /var/lib/one/.one/one_auth file",
    "2-1": "The opennebula master ip address."
  },
  "cols": 2,
  "rows": 3
}
[/block]
Open the file /var/lib/megam/megamd/megamd.conf and add the values
[block:code]
{
  "codes": [
    {
      "code": "nano /var/lib/megam/megamd/megamd.conf\n\n\n[deployd]\n    one_endpoint = \"http://192.168.1.100:2633/RPC2\"\n    one_userid = \"oneadmin\"\n    one_password =  \"password\"\n\n",
      "language": "shell"
    }
  ]
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"taking-megam-oja-to-a-spin\" role=\"button\">Go to the step 4.</a>\n<style>\n\n</style>"
}
[/block]