---
title: "Bootstrap already running node"
excerpt: "Get set go to bootstrap a master system"
---
#Existing System

##Ubuntu 14.04

So let us say we have an existing server running [Ubuntu Trusty](http://www.ubuntu.com). 

In order to get started install the following **megdc package**.
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-add-repository \"deb [arch=amd64] http://get.megam.io/0.9/ubuntu/14.04/ trusty testing\"\n\nsudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7\n\nsudo apt-get update\n\nsudo apt-get install megdc",
      "language": "shell",
      "name": "Ubuntu"
    }
  ]
}
[/block]
* We assume you have atleast 3 HDDs with the partitions mounted with names prefixed **storage**. eg:** /storage1, /storage2 and /storage3* 

* We also recommend you to create an user *megdc*, password *megdc* and use that going forward. 
[block:code]
{
  "codes": [
    {
      "code": "adduser megdc\n\nsudo usermod -a -G sudo megdc\n\nsu megdc",
      "language": "shell"
    }
  ]
}
[/block]
##Vagrant

Thanks to `Jorge Valderrama - jorge.valderrama.external@atos.net` for the vagrant contribution.
[block:code]
{
  "codes": [
    {
      "code": "# -*- mode: ruby -*-\n# vi: set ft=ruby :\n\n# All Vagrant configuration is done below. The \"2\" in Vagrant.configure\n# configures the configuration version (we support older styles for\n# backwards compatibility). Please don't change it unless you know what\n# you're doing.\nVagrant.configure(2) do |config|\n  # The most common configuration options are documented and commented below.\n  # For a complete reference, please see the online documentation at\n  # https://docs.vagrantup.com.\n\n  # Every Vagrant development environment requires a box. You can search for\n  # boxes at https://atlas.hashicorp.com/search.\n  config.vm.box = \"ubuntu-trusty\"\n\n  # Disable automatic box update checking. If you disable this, then\n  # boxes will only be checked for updates when the user runs\n  # `vagrant box outdated`. This is not recommended.\n  # config.vm.box_check_update = false\n\n  # Create a forwarded port mapping which allows access to a specific port\n  # within the machine from a port on the host machine. In the example below,\n  # accessing \"localhost:8080\" will access port 80 on the guest machine.\n  config.vm.network \"forwarded_port\", guest: 8086, host: 8086\n  config.vm.network \"forwarded_port\", guest: 8077, host: 8078\n  config.vm.network \"forwarded_port\", guest: 9869, host: 9870\n  config.vm.network \"forwarded_port\", guest: 3069, host: 3069\n  config.vm.network \"forwarded_port\", guest: 29876, host: 29877\n  config.vm.network \"forwarded_port\", guest: 3000, host: 3000\n  config.vm.network \"forwarded_port\", guest: 8080, host: 8080, guest_ip: \"10.0.2.15\", host_ip: \"127.0.0.1\"\n  config.vm.network \"forwarded_port\", guest: 8098, host: 8098, guest_ip: \"10.0.2.15\", host_ip: \"127.0.0.1\"\n  config.vm.network \"forwarded_port\", guest: 8087, host: 8087, guest_ip: \"10.0.2.15\", host_ip: \"127.0.0.1\"\n\n  # Create a private network, which allows host-only access to the machine\n  # using a specific IP.\n   config.vm.network \"private_network\", ip: \"192.168.57.6\"\n\n  # Create a public network, which generally matched to bridged network.\n  # Bridged networks make the machine appear as another physical device on\n  # your network.\n  config.vm.network \"public_network\"\n\n  # Share an additional folder to the guest VM. The first argument is\n  # the path on the host to the actual folder. The second argument is\n  # the path on the guest to mount the folder. And the optional third\n  # argument is a set of non-required options.\n  # config.vm.synced_folder \"../data\", \"/vagrant_data\"\n\n  # Provider-specific configuration so you can fine-tune various\n  # backing providers for Vagrant. These expose provider-specific options.\n  # Example for VirtualBox:\n  #\n  config.vm.provider \"virtualbox\" do |vb|\n  #   # Display the VirtualBox GUI when booting the machine\n    vb.gui = true\n  #\n  #   # Customize the amount of memory on the VM:\n     vb.memory = \"1024\"\n   end\n  #\n  # View the documentation for the provider you are using for more\n  # information on available options.\n\n  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies\n  # such as FTP and Heroku are also available. See the documentation at\n  # https://docs.vagrantup.com/v2/push/atlas.html for more information.\n  # config.push.define \"atlas\" do |push|\n  #   push.app = \"YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME\"\n  # end\n\n  # Enable provisioning with a shell script. Additional provisioners such as\n  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the\n  # documentation for more information about their specific syntax and use.\n   config.vm.provision \"shell\", inline: <<-SHELL\n     sudo apt-get -y install software-properties-common python-software-properties \n     sudo apt-add-repository \"deb [arch=amd64] http://get.megam.io/0.9/ubuntu/14.04/ trusty testing\"\n     sudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7\n     sudo apt-get update\n    # sudo apt-get -y install megamcommon\n    # sudo apt-get -y install megamnilavu megamsnowflake megamgateway megamd \n    # sudo apt-get -y install gitlab megamswarm\n    sudo apt-get -y install megdc\n   SHELL\nend",
      "language": "shell"
    }
  ]
}
[/block]

[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button blue\" href=\"megam_megdc_tool\" role=\"button\">Go to the megdc tool</a>\n<style>\n\n</style>"
}
[/block]