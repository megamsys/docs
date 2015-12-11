---
title: "Bootstrap new master"
excerpt: "Power on your master, we are about to  install the ubuntu and **Megdc**."
---
[block:api-header]
{
  "type": "basic",
  "title": "Hellow ! What is bootstrapping ?"
}
[/block]
This is just  jump starting the bare metal server with operating system and our awesome command line install tool named `Megdc`

Hope you enjoyed reading the [planning](doc:megam_megdc_planning)  guide. If not, do visit it.

#Bare metal

We have `hardware partnership with vendors in india`, contact us to build your private cloud at a minimal cost.

Start by downloading the ISO and burn it as suggested.

##Ubuntu  14.04: Download ISO 
[block:code]
{
  "codes": [
    {
      "code": "wget -r -c https://s3-ap-southeast-1.amazonaws.com/megampub/iso/trusty_megam.iso",
      "language": "shell"
    }
  ]
}
[/block]
##Burn ISO 

  * Follow[ this instruction ](http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu)if you are using Ubuntu.  
  * We recommend [unetbootin](http://unetbootin.sourceforge.net/) for other platforms. 

##Boot Master

Insert the USB pen drive and boot the master.  Select *Megdc Installation* in the prompt.

[block:callout]
{
  "type": "danger",
  "title": "Networking",
  "body": "Network must be setup `manual`. Don't use dhcp, as opennebula-host will fail to spin VMs"
}
[/block]

[block:callout]
{
  "type": "danger",
  "title": "Disk layout",
  "body": "Atleast 2 or 3 separate HDDs,  and manual partitioning with mount points prefixed with **storage**  is needed.\n\nThe below table is just a guidance."
}
[/block]
This assumes you have 3HDDs of 1TB each.
[block:parameters]
{
  "data": {
    "h-2": "Size",
    "h-0": "HDD #",
    "h-1": "Mount",
    "0-0": "**1**",
    "0-1": "/boot",
    "1-0": "",
    "1-1": "/",
    "1-2": "10GB",
    "2-0": "",
    "2-1": "/swap",
    "2-2": "20GB",
    "3-0": "",
    "3-1": "/var",
    "3-2": "50GB",
    "4-0": "only for HA",
    "4-1": "*/drbd*",
    "4-2": "50GB",
    "5-0": "",
    "5-1": "/storage1",
    "5-2": "869GB",
    "1-3": "ext4",
    "2-3": "swap",
    "3-3": "ext4",
    "4-3": "ext4",
    "5-3": "ext4",
    "h-3": "Filesystem",
    "6-0": "**2**",
    "6-1": "/storage2",
    "6-2": "1TB",
    "7-0": "**3**",
    "7-1": "/storage3",
    "7-2": "1TB"
  },
  "cols": 4,
  "rows": 8
}
[/block]
Restart your **Master** you should see the login prompt. 

Let us type the userid **megdc** and password **megdc** that is created for you.
[block:code]
{
  "codes": [
    {
      "code": "Ubuntu 14.04.3 LTS megamubuntu tty1\n\nmegamubuntu login      : megdc\n\t\t     password      : megdc\n\nmegdc@megamubuntut:~# \n",
      "language": "shell"
    }
  ]
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"megam_megdc_tool\" role=\"button\">Go to the megdc tool</a>\n<style>\n\n</style>"
}
[/block]