---
title: "#1 Oneclick marketplace"
excerpt: "Well, you need to tinker a little bit and setup one click images."
---
# Oneclick Marketplace

[Megam Oja](doc:megam_oja_gettingstarted) provides a marketplace for one click launches.  We need to configure OpenNebula with a template and some images.

[block:parameters]
{
  "data": {
    "0-0": "- OpenNebula Frontend has host added and its `ON`\n- Datastore `cephds` shoud be in `ON` state, and it should show the storage size.",
    "h-0": "Pre requisites"
  },
  "cols": 1,
  "rows": 1
}
[/block]
 We will use [`cephds` datastore](doc:megam_beebox_done) created to store images.

Before moving on, we need a template in OpenNebula.

## Template

Megam Oja will use a common template for all the vms launched by our omni scheduler megamd.

Template name shall be named as **megam**

### Launch OpenNebula Frontend  [http://<ipaddress>:9869](http://<ipaddress>:9869) and type your credentials as seen in here.
[block:code]
{
  "codes": [
    {
      "code": "$ ls -1 /var/lib/one/.one\ncat one_auth\n\noneadmin:xyz123",
      "language": "shell",
      "name": "oneadmin credentials"
    }
  ]
}
[/block]
Here is the template you need to import. Read [VM template primer](http://docs.opennebula.org/4.14/user/virtual_resource_management/vm_guide.html) for more information
[block:code]
{
  "codes": [
    {
      "code": "CONTEXT=[FILES=\"/megam/init.sh\",NODE_NAME=\"$NAME\",SET_HOSTNAME=\"$NAME\",NETWORK=\"YES\",SSH_PUBLIC_KEY=\"<MANUAL_YOUR_SSH_PUBLIC_KEY>\"]\nCPU=\"1\"\nDESCRIPTION=\"test trusty image\"\nDISK=[IMAGE=\"megam\",IMAGE_UNAME=\"oneadmin\"]\nGRAPHICS=[LISTEN=\"0.0.0.0\",TYPE=\"VNC\"]\nMEMORY=\"768\"\nNIC=[NETWORK=\"VN_NAME\",NETWORK_UNAME=\"oneadmin\"]\nOS=[ARCH=\"x86_64\"]\nSUNSTONE_CAPACITY_SELECT=\"YES\"\nSUNSTONE_NETWORK_SELECT=\"YES\"\nNAME=\"megam\"",
      "language": "text",
      "name": "megam-template"
    }
  ]
}
[/block]
You have noticed that  there are manual inputs needed  in the template. 

1.  FILES="/megam/init.sh"

Yes, we need to create a context shell script in the directory '/megam`.  The script is as shown below.
[block:embed]
{
  "html": false,
  "url": "https://github.com/megamsys/megdc/blob/master/one-context/init.sh",
  "title": "megamsys/megdc",
  "favicon": "https://assets-cdn.github.com/favicon.ico",
  "image": "https://avatars2.githubusercontent.com/u/5526825?v=3&s=400",
  "iframe": false
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "mkdir /megam\n\ncd megam\n\nwget https://raw.githubusercontent.com/megamsys/megdc/master/one-context/init.sh\n\nls",
      "language": "shell",
      "name": "/megam/init.sh"
    }
  ]
}
[/block]
2. SSH_PUBLIC_KEY="<contents of id_rsa.pub>"


Refer [generate SSH public key](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)

We will make the above steps as part of our [Megdc commandline tool](doc:megam_megdc_tool)  in **1.0**

## Oneclick ubuntu

Download this torpedo - ubuntu 14.04 flavor. This comes bundled with monitoring and an agent for orchestration.
[block:code]
{
  "codes": [
    {
      "code": "wget https://s3-ap-southeast-1.amazonaws.com/megampub/iso/ubuntu.img.tar.gz\n\ntar -zxvf ubuntu.img.tar.gz ubuntu.img",
      "language": "shell",
      "name": "ubuntu_14.04"
    }
  ]
}
[/block]
 Import the image named as `Ubuntu_14.04` in OpenNebula to `cephds` datastore.

## Megam Oja

This image is the base image for the application orchestrator launches. Comes bundled with metering, and an agent. 

Download this base oja image. This comes bundled with monitoring and an agent for orchestration.
[block:code]
{
  "codes": [
    {
      "code": "wget https://s3-ap-southeast-1.amazonaws.com/megampub/iso/megam.img.tar.gz\n\ntar -zxvf megam.img.tar.gz megam.img",
      "language": "shell",
      "name": "Megam"
    }
  ]
}
[/block]
Import the image named as `Megam` in OpenNebula to `cephds` datastore.

## Debian Jessie:
 
Download this torpedo - Jessie flavor. This comes bundled with monitoring and an agent for orchestration.
[block:code]
{
  "codes": [
    {
      "code": "# this isn't uploaded yet\nwget https://s3-ap-southeast-1.amazonaws.com/megampub/iso/debian_8.0.img.tar.gz\n\ntar -zxvf debian_8.0.img.tar.gz debian_8.0.img",
      "language": "shell"
    }
  ]
}
[/block]
 Import the image named as `Debian_8.0` in OpenNebula in `cephds` datastore.

##CentOS 7.1

Download this torpedo - centos 7.1 flavor. This comes bundled with monitoring and an agent for orchestration.
[block:code]
{
  "codes": [
    {
      "code": "# this isn't uploaded yet\nwget https://s3-ap-southeast-1.amazonaws.com/megampub/iso/centos_7.1.img.tar.gz\n\ntar -zxvf centos_7.1.img.tar.gz centos_7.1.img",
      "language": "shell",
      "name": "CentOS_7.1"
    }
  ]
}
[/block]
Import the image named `CentOS_7.1` in OpenNebula in `cephds` datastore

##CoreOS (*Optional)

Opennebula marketplace does not have coreos image. To have a coreos qemu image, we need to build it. 

Follow further steps, below to build a coreos image. 

Don't worry, we will be releasing an image shortly.

**Step1: Install Qemu** 
[block:code]
{
  "codes": [
    {
      "code": "sudo apt-get -y install qemu-system-x86 qemu-utils",
      "language": "shell"
    }
  ]
}
[/block]

**Step2: Download coreos image** 
[block:code]
{
  "codes": [
    {
      "code": "wget https://s3-ap-southeast-1.amazonaws.com/megampub/coreos/coreos_production_openstack_image.img.bz2\nbunzip2 coreos_production_openstack_image.img.bz2",
      "language": "shell"
    }
  ]
}
[/block]
**Step3: Download script to boot the image** 
[block:code]
{
  "codes": [
    {
      "code": "wget https://s3-ap-southeast-1.amazonaws.com/megampub/coreos/coreos_production_qemu.sh\nchmod 755 coreos_production_qemu.sh",
      "language": "shell"
    }
  ]
}
[/block]
**Step4: Boot coreos image using the script** 
[block:code]
{
  "codes": [
    {
      "code": "./coreos_production_qemu.sh -nographic",
      "language": "shell"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Note : It will take `~/.ssh/id_rsa.pub` and push it in the image. So, you can access the image using your `~/.ssh/id_rsa`. \n\nIf you don't have ssh keys please generate it using `ssh_keygen`."
}
[/block]
**Step5: On new terminal or tab, Start the image** 
[block:code]
{
  "codes": [
    {
      "code": "ssh -l core -p 2222 -i  ~/.ssh/id_rsa localhost",
      "language": "shell"
    }
  ]
}
[/block]
Now you can ssh into the coreos image

**Step 6: Add contextualization in that image. Inside the image follow the steps below** 
[block:code]
{
  "codes": [
    {
      "code": "wget https://github.com/thomasalrin/addon-context-linux/archive/v4.8.1.tar.gz\ntar -xvf v4.8.1.tar.gz",
      "language": "shell"
    }
  ]
}
[/block]
**Step 7: Copy the files under the dir "addon-context-linux-4.8.1/base/etc" to /etc/** 
[block:code]
{
  "codes": [
    {
      "code": "cp -r addon-context-linux-4.8.1/base/etc/* /etc/",
      "language": "shell"
    }
  ]
}
[/block]
**Step 8: add a service for one-context in coreos**

Create a new file in /etc/systemd/system/onecontext.service 
[block:code]
{
  "codes": [
    {
      "code": "cat /etc/systemd/system/onecontext.service \n\n[Unit]\nDescription=Opennebula onecontext\n\n[Service]\nTimeoutStartSec=0\nExecStart=/etc/init.d/vmcontext start",
      "language": "shell"
    }
  ]
}
[/block]
**Step 9: Create a cloud-config file to run at boot time**

Create a new file in /usr/share/oem/cloud-config.yml
[block:callout]
{
  "type": "info",
  "body": "Note :\" `#cloud-config` should be the starting line of this file"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "#cloud-config\n\ncoreos:\n    units:\n      - name: onecontext.service\n        command: restart\n\npower_state:\n  mode: reboot",
      "language": "yaml"
    }
  ]
}
[/block]
Thats all. Now exit from coreos image edit

**Step10 : Add this image(iso file) in opennebula**

**Step11: Create a file in /megam/init.sh from opennebula master server**
[block:code]
{
  "codes": [
    {
      "code": "#!/bin/bash\n#root@megammaster:/megam# cat init.sh \n \nif [ -f /mnt/context.sh ]; then\n  . /mnt/context.sh\nfi\n\nsudo cat >> //home/core/.ssh/authorized_keys <<EOF\n$SSH_PUBLIC_KEY\nEOF\n\nsudo -s\n\nsudo cat > //etc/hostname <<EOF\n$HOSTNAME\nEOF\n\nsudo cat >> //etc/hosts <<EOF\n$IP_ADDRESS $HOSTNAME localhost\n\nEOF\n\nsudo cat > //etc/systemd/network/static.network <<EOF\n[Match]\nName=ens3\n\n[Network]\nAddress=$IP_ADDRESS/24\nGateway=$GATEWAY\nEOF\n\nsudo systemctl restart systemd-networkd",
      "language": "text"
    }
  ]
}
[/block]
**Step 12: Create a template in opennebula with the following content.**
[block:code]
{
  "codes": [
    {
      "code": "CONTEXT=[FILES=\"/megam/init.sh\",GATEWAY=\"$NETWORK[GATEWAY, NETWORK=\\\"$NETWORK_NAME\\\"]\",HOSTNAME=\"$HOSTNAME\",IP_ADDRESS=\"$NIC[IP, NETWORK=\\\"$NETWORK_NAME\\\"]\",NETWORK=\"YES\",SSH_PUBLIC_KEY=\"$SSH_PUB_KEY\"]\nCPU=\"1\"\nDESCRIPTION=\"Coreos image\"\nDISK=[IMAGE=\"megam_coreos\",IMAGE_UNAME=\"oneadmin\"]\nGRAPHICS=[LISTEN=\"0.0.0.0\",TYPE=\"vnc\"]\nMEMORY=\"768\"\nNIC=[NETWORK=\"$NETWORK_NAME\",NETWORK_UNAME=\"oneadmin\"]\nOS=[ARCH=\"x86_64\"]\nSUNSTONE_CAPACITY_SELECT=\"YES\"\nSUNSTONE_NETWORK_SELECT=\"YES\"\nNAME=\"megam_coreos\"",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "title": "",
  "body": "NOTE: Don't forget to replace $NETWORK_NAME, $HOSTNAME and $SSH_PUB_KEY with yours"
}
[/block]
That's all. Now you can instantiate this template to have a coreos vm.
[block:html]
{
  "html": "<div></div>\n<a class=\"megam-button\" href=\"megam_operate_megdc\" role=\"button\">Go to the next step.</a>\n<style>\n\n</style>"
}
[/block]