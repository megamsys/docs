.. _opennebula_cloud:

================================
OpenNebula Cloud
================================

Overview
--------

OpenNebula can be primarily used as a platform to manage your virtualized infrastructure in the data center or cluster, which is usually referred as **Private Cloud**. OpenNebula supports *Hybrid Cloud* to combine local infrastructure with public cloud-based infrastructure, enabling highly scalable hosting environments. OpenNebula also supports *Public Clouds* by providing Cloud interfaces to expose its functionality for virtual machine, storage and network management"


+------------------------+---------------------------------+-----------------------------------------+
| Megam                  |        OpenNebula               |     Description                         |
|                        |                                 |                                         |
+========================+=================================+=========================================+
| Private                |      Cloud In a Box             | OpenNebula  and Megam and installed     |
|                        |                                 | in the hardware appliance accessed      |
|                        |                                 | privately                               |
+------------------------+---------------------------------+-----------------------------------------+


Cloud In a Box
-----------------------------------------

Both Megam and OpenNebula are Private and setup ready to go.

Megam uses Chef to perform the orchestration on OpenNebula. This is handled using a `knife-opennebula <https://rubygems.org/gems/knife-opennebula>`__ plugin. The Public :ref:`Megam Engine <megamengine>` has `knife-opennebula <https://rubygems.org/gems/knife-opennebula>`__ plugin installed. This allows Megam to connect to Private OpenNebula.
`knife-opennebula` plugin relies on a template to be defined in OpenNebula to launch from Megam. Megam provides facility in the web interface to store the different templates of OpenNebula.


Prepare Image
--------------

http://marketplace.c12g.com/appliance/53e7c1b28fb81d6a69000003

The base trusty image was prepared with `LogMein VPN <https://secure.logmein.com/us/labs/>`__. Refer section below **Prepare Image** to prepare an image with VPN.

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


Prepare Template
--------------------

A template file is needed to be setup in OpenNebula before launching with Megam. A template consists of a set of attributes that defines a Virtual Machine. Using the command ``onetemplate create``, a template can be registered in OpenNebula to be later instantiated by Megam. If you don't want VPN then remove ``NEW_VPN`` flag completely.


Sample Template
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

Refer here to `Manage templates from Sunstone <http://docs.opennebula.org/4.8/administration/sunstone_gui/suns_views.html>`__.

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
