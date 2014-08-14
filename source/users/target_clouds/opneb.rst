.. _opennebula_cloud:

================================
OpenNebula Cloud
================================

Overview
--------

Megam integrates with OpenNebula by launching Apps/Services and its marketplace catalog on private cloud. This can be performed in 3 ways.

- **Public Megam**   : Launch an app/service from `www.megam.co <https://www.megam.co>`__
- **Private Megam**  : Launch an app/service from a private Megam installation.
- **Cloud in a box** : This is the same as `Private Megam` except that Megam is packaged in a specific hardware appliance.

..  note:: It is assumed that `OpenNebula <http://docs.opennebula.org/4.6/design_and_installation/quick_starts/qs_ubuntu_kvm.html#qs-ubuntu-kvm>`__ is installed and configured. We recommend using `Ubuntu 13.04 +` image. You can download `Ubuntu 14.04 kvm` from `OpenNebula's marketplace <http://marketplace.c12g.com/appliance/536101948fb81d2bb8000004>`__

In all the 3 cases, Megam's intent is to use OpenNebula as an IaaS provider providing compute, network, and storage as a service. In the case of OpenNebula its a hybrid cloud.

Public Megam `https://www.megam.co`
-----------------------------------

Megam uses Chef to perform the orchestration on OpenNebula. This is handled using a `knife-opennebula <https://rubygems.org/gems/knife-opennebula>`__ plugin. The Public :ref:`Megam Engine <megamengine>` has `knife-opennebula <https://rubygems.org/gems/knife-opennebula>`__ plugin installed. Hence this allows us to connect to a private OpenNebula cloud.
`knife-opennebula` plugin relies on a template to be defined in OpenNebula to launch from Megam. Megam provides facility in the web interface to store the different templates of OpenNebula.

As Megam is running on public, there needs to be a way to connect to the VM's running inside a private premise. Hence the approach in doing would be to expose the public i/p address of a VM via a VPN.
LogMein VPN was exercised which provides a public i/p address to Megam. A robust approach in production will be recommended using OpenVPN setup.

|opennebula architecture|

The base trusty image was prepared with `LogMein VPN <https://secure.logmein.com/us/labs/>`__. Refer section below **Prepare Image** to prepare an image with VPN.

Prepare Image
--------------

- **Launch a VM using Trusty image**
- At this point the VM should be in RUNNING state.
- Perform the updates needed in the VM.
- **Select the VM** from the list.
- **Click on Storage button** from top menu, it’ll show you a table.
- **In that table, click on Snapshot link** which is under Actions column. It’ll popup a dialogue box.
- **In that dialogue box**, enter image name and select snapshot type. Then click on Take snapshot.

There are two snapshot types,

- **Diferred :** Image is created immediately, but the contents are saved, only if the vm is shutdown(Using shutdown not Delete)
- **Hot :** Image will be saved immediately.
- **Check in the image list**, if your image is ready, you can use it.

Let us say the image is named as `trusty_snap1`

For more information
- `OpenNebula Managing Images <http://docs.opennebula.org/4.6/user/virtual_resource_management/img_guide.html>`__

Prepare ONE FrontEnd
--------------------

ONE FrontEnd needs to be prepared to send data to OneGate server and ability to join a VPN. A separate `Megam Contextualization` project was spinned off to cater to this need.

Megam Contextualization.
-------------------------

Megam contextualization is the process that adds to the `OpenNebula - Basic Contextualization` by providing

- **Ability to push data to OneGate server**
- **Ability to join a VPN**

.. warning::
  Hence, before we proceed further with `Megam contextualization` the image `trusty_snap1` needs to have the  `Basic OpenNebula one_context <http://docs.opennebula.org/4.6/user/virtual_machine_setup/bcont.html>`__ present.


Ability to push data(parameters) to OneGate server
---------------------------------------------------

**Why is this needed ?** This is needed to push some parameters like public i/p and let Megam know about it. OneGate server is OpenNebula's application monitoring collector. OneGate (An  application  monitoring collector) is configured and running in the ONE FrontEnd.

For more information about `OneGate <http://docs.opennebula.org/4.6/advanced_administration/application_insight/onegate_usage.html>`__

When the VM is launched OpenNebula allows to write a script or ruby code which will inform OneGate using  a unique token which will reside automatically inside the VM along with the OneGate URL. The script can be customized as per the need to figure out the public i/p by doing something like this:

..  code::

    ifconfig ham0 | grep ..

And the script will run  a curl command to notify the OneGate server to notify the public i/p. When a public i/p is received OpenNebula sticks that public i/p inside the USER_TEMPLATE parameter. As Megam is constanly bombarding OneNebula for VM updates, the result should have the USER_TEMPLATE info. If there is no info in the USER_TEMPLATE  and information exists in TEMPLATE then its AWS or public cloud.

Ability to join a VPN
----------------------

**Why is this needed ?** This is needed to create and join a VPN.

`Refer scripts for more information: <https://github.com/megamsys/megam_onecontext>`__

Clone : Megam Contextualization
--------------------------------

From the ONE FrontEnd server store this in a location like eg: ``/home/oneadmin/megam``

..  code::

    git clone https://github.com/megamsys/megam_onecontext

3 scripts will be available.

- **init.sh**: calls `megam_onegate_push.sh` and `megam_vpn.sh`
- **megam_onegate_push.sh**: Sends data to your OneGate server.
- **megam_vpn.sh**: Use VPN if NEW_VPN flag is present in your template.


Prepare Template
--------------------

A template file is needed to be setup in OpenNebula before launching with Megam. A template consists of a set of attributes that defines a Virtual Machine. Using the command ``onetemplate create``, a template can be registered in OpenNebula to be later instantiated by Megam. If you don't want VPN then remove ``NEW_VPN`` flag completely.

1. Sample Template
-------------------

This a sample hybrid VM Template setup in opennebula which would launch a VM in AWS(EC2).

.. code::


    # Local Template section
    NAME=MNyWebServer

    CPU=1
    MEMORY=256

    DISK=[IMAGE="ubuntu-trusty"]
    NIC=[NETWORK="public"]

    EC2=[
      AMI="ami-xxxxx" ]

2. Sample Template
-------------------

This a sample VM Template with ``Megam Contextualization`` and ``ssh keys`` with ``ssh-user as root`` which will launch a VM in private cloud.

.. code::


    # Local Template section
    NAME=MNyWebServer

    CONTEXT=[FILES="/home/oneadmin/megam_onecontext/megam_vpn.sh /home/oneadmin/megam_onecontext/megam_onegate_push.sh",HOSTNAME="localhost",IP_GEN="25.82.208.198",IP_PRIVATE="192.168.0.5",IP_PUBLIC="25.82.208.199",NETWORK="YES",NEW_VPN="YES",ONEGATE_TOKEN="/mnt/token.txt",SSH_PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCl5lN/jlKD6gjEo3Fq+EkaHVyL2XyJ4SnrWft61kllOe/j5sOAY3GTRr3H3MgEki6U9LFhYD+XbFo8ek7zPdi8EAg5/K5bXBOLhbKEnVBD3W3QeHR6ntVYZiwu6wUoPPU2wL19O9ZtaWIiYFY6WNUBfZUH9E2MTuiXs+nYaGZicCc7iWwDJLaE0YbTLz9/no21ZfVD+CLWKUnzmMtKsFoQ186tHTxPyId5UJUnkFjvOF0ryB7mQtBWj+oaRZ2r5xX20qvZ5ZWGhrLSBSiNQw4Dk7HdaNr62pwgj9vaaywK/WSWiV6of5mecNZJLyEcokcabYGHKCpJ5db9D8xdYsQ/ root@Megam",TOKEN="YES",USERNAME="tom",VPN_NAME="MegamApp5",VPN_PASSWORD="team4megam"]

    CPU="1"

    DESCRIPTION="Market Place 12.04 image"

    DISK=[DEV_PREFIX="sd",IMAGE="logmein-curl-12.04",IMAGE_UNAME="oneadmin"]

    GRAPHICS=[LISTEN="0.0.0.0",TYPE="VNC"]

    MEMORY="512"

    NIC=[NETWORK="VN",NETWORK_UNAME="oneadmin"]

    OS=[ARCH="x86_64"]

    SCHED_REQUIREMENTS="ID=\"1\""


Save and Verify Template
----------------------------

Refer here to `Manage templates from Sunstone <http://docs.opennebula.org/4.6/administration/sunstone_gui/suns_views.html>`__.

.. code::

    $ onetemplate create ec2template
    $ ontemplate instantiate ec2template

After the template instantiation Guest VM was runs, a verification was performed manually to see if the ``Megam Contextualization scripts`` reside in the below directory by doing the following.

 .. code::

    # NOTE: Change /dev/sr0 to your VM's CD drive
    mount -t iso9660 /dev/sr0 /mnt



Megam - OpenNebula
==================================

Let us launch an app/service from Megam. The steps are the same for Public or Private cloud lauch of OpenNebula. By having different templates in OpenNebula we can configure the launches to the appropriate cloud accordingly.

Steps in Megam
----------------

- Login in to `megam.co <https://www.megam.co>`__

- Click ``Settings`` and choose ``OpenNebula`` icon.

.. image:: /images/opennebula_setting.png

In the above setting, we have saved template named ``ec2_nk_singapore`` which was setup in the previous step.

- Click Save

- You can see your saved settings in under ``Manage Settings`` >  ``Clouds``

- Refer :ref:`here <apps>` for launching Apps/Services



.. |opennebula architecture| image:: /images/megam_opennebula_try.png
