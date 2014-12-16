.. _opennebula_cloud:

================================
OpenNebula Cloud
================================

Overview
--------

OpenNebula can be primarily used as a platform to manage your virtualized infrastructure in the data center or cluster, which is usually referred as **Private Cloud**. OpenNebula supports *Hybrid Cloud* to combine local infrastructure with public cloud-based infrastructure, enabling highly scalable hosting environments. OpenNebula also supports *Public Clouds* by providing Cloud interfaces to expose its functionality for virtual machine, storage and network management"


Cloud In a Box
-----------------------------------------

Both Megam and OpenNebula are Private and setup ready to go.

+------------------------+---------------------------------+-----------------------------------------+
| Megam                  |        OpenNebula               |     Description                         |
|                        |                                 |                                         |
+========================+=================================+=========================================+
| Private                |      Private                    | OpenNebula  and Megam and installed     |
|                        |                                 | in the hardware  accessed privately     |
+------------------------+---------------------------------+-----------------------------------------+




Prepare Template
--------------------

A template file is needed to be setup in OpenNebula before launching with Megam. A template consists of a set of attributes that defines a Virtual Machine.

Using the command ``onetemplate create``, a template can be registered in OpenNebula to be later instantiated by Megam.


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


Steps
============================


If you have your own account with One, you can use the same with megam.



Choose Settings
    The following appears.

    .. image:: /images/cloudsettings_bar.png

    Choose ``OpenNebula`` icon.



Enter the One credentials.
    The following popup appears asking to enter your One Credentials.

    .. image:: /images/cloudsettings_one.png




Select Parameters
    Your One templates should be listed.

    We are working to provide partner images named ``megam_trusty`` which can be used. Hence you will not find an exhaustive list of your images.

    Save the configuration.



List Settings
    The list of your saved settings are shown here.

    .. image:: /images/cloudsettings_list.png
