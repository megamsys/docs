---
title: "Completing SlimBox"
excerpt: "In order to complete SlimBox, you'll need to install [OpenNebula](http://docs.opennebula.org), [Megam Oja](doc:megam_oja_gettingstarted)"
---
#Adding Compute/Storage and Megam 

In order to add compute/storage and [Megam Oja](doc:megam_oja_gettingstarted)  to Master

* [megdc shall be ready](doc:megam_megdc_tool)

##Install OpenJDK8 

Install OpenJDK8. We will automate the prerequisite (`openjdk, riak, rabbitmq`) in the next build by adding an option `--prereqs`. 

For now bear with us, this is an extra step.
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-add-repository -y ppa:openjdk-r/ppa\n\nsudo apt-get -y update\n\nsudo apt-get -y install openjdk-8-jdk",
      "language": "shell"
    }
  ]
}
[/block]
##Install Riak & RabbitMQ
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-get install riak\n\nsudo apt-get install rabbitmq-server",
      "language": "shell"
    }
  ]
}
[/block]
##Install Megam Oja
[block:code]
{
  "codes": [
    {
      "code": "megdc megaminstall",
      "language": "shell"
    }
  ]
}
[/block]
##Install OneFrontend and Host
[block:code]
{
  "codes": [
    {
      "code": "megdc oneinstall\n\nmegdc onehostinstall",
      "language": "shell",
      "name": null
    }
  ]
}
[/block]
##Attaching OneHost to OneFrontend

Run the following from OneFrontend. This makes sure OneHost is recognized by OneFrontend.
[block:code]
{
  "codes": [
    {
      "code": "megdc sshpass --host <onehostip>",
      "language": "shell",
      "name": "Connect OneHost to the OneFrontend"
    }
  ]
}
[/block]
Once the install is complete, you still need to add storage to make it work. 

##Adding cloud storage

Let us get ceph ready to have the VMs use a replicated storage. 

Go ahead, do it before moving on. [Add cloud storage](doc:megam_beebox_done) 

##Adding openvswitch network bridge

Let us add a default bridge named `one` to default physical device `etho`
[block:code]
{
  "codes": [
    {
      "code": "megdc createnetwork",
      "language": "shell",
      "name": "Create an openvswitch network bridge"
    }
  ]
}
[/block]
###Create VLAN named `open-vs` in Opennebula

Let us create a private vlan which starts from 192.168.1.205 - 192.168.2.255

In such a case the <start.ip>  will be 192.168.1.205 and <gateway> can be 192.168.1.1

*Arrggh. this is a manual step*
[block:code]
{
  "codes": [
    {
      "code": "sudo -H -u oneadmin bash -c \"cat > //var/lib/one/vn.net <<EOF\nNAME   = \"open-vs\"\nTYPE   = FIXED\nBRIDGE = one\nAR = [ TYPE = \"IP4\", IP   = \"<start.ip>\", SIZE = \"50\" ]\nDNS = \"8.8.8.8 8.8.4.4\"\nGATEWAY    = \"<gateway>\"\nEOF\"\n\n\nsudo -H -u oneadmin bash -c \"onevnet create /var/lib/one/vn.net\"\n\n",
      "language": "text",
      "name": "Attach a vlan to Opennebula"
    }
  ]
}
[/block]
If you need help on `/etc/network/interfaces` give us a shout, we will help you out. But we will update the guide with more information shortly.

Here is our `/etc/network/interfaces` file for 2 nics[p4p1, p4p2], with a bridge named `one`
[block:code]
{
  "codes": [
    {
      "code": "cat /etc/network/interfaces\n\n# The loopback network interface\nauto lo\niface lo inet loopback\n\n# The primary network interface\nauto p4p1\niface p4p1 inet static\n\taddress 192.168.1.102\n\tnetmask 255.255.255.0\n\tgateway 192.168.1.1\n\t# dns-* options are implemented by the resolvconf package, if installed\n\tdns-nameservers 8.8.8.8 8.8.4.4\nauto one\nauto p4p2\niface p4p2 inet static\n     address 192.168.1.103\n     netmask 255.255.255.0\n     gateway 192.168.1.1\n     dns-nameservers 8.8.8.8 8.8.4.4\n     \n$ sudo ovs-vsctl show\n49547900-e76c-4dc6-aa70-1af92dd4fd36\n    Bridge one\n        Port \"vnet2\"\n            Interface \"vnet2\"\n        Port \"vnet0\"\n            Interface \"vnet0\"\n        Port \"p4p2\"\n",
      "language": "shell",
      "name": "sample bridge"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Almost. You have to operationalize your Megdc before you can spin VMs/micro services. which is [configure OpenNebula](doc:megam_configure_megdc)",
  "title": "SlimBox is ready"
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"megam_configure_megdc\" role=\"button\">Go to the operationalizing Megdc</a>\n<style>\n\n</style>"
}
[/block]