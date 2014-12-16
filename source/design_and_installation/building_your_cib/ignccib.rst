.. _ignccib:

========================
Installing the Software
========================

This page shows you how to install cloud in a box.

Step 1. Make a Bootable CIB USB
====================================

.. warning:: The ISO is free during the limited beta period.

1.1. Download the ISO
----------------------

Download the ISO from `here. <https://s3-ap-southeast-1.amazonaws.com/megampub/iso/trusty_megam.iso>`__

(or)

.. code::

    # wget -r -c https://s3-ap-southeast-1.amazonaws.com/megampub/iso/trusty_megam.iso


1.2. Buy the ISO
-------------------------------

.. caution:: Stay tuned. We are working to enable electronic purchase of a handy pendrive with ISO loaded.

Click `here. <http://www.gomegam.com/cloudinabox>`__. to add the ISO to a shopping cart and pay with your credit card or Bitcoin.



1.3. Burn the  ISO in USB Pen drive
-----------------------------------

Skip this step, if you purchased an USB pen drive.

Here are the instructions to burn the CIB ISO.

+----------------+--------------------------------------------------------------------------------------------+
|    OS          |                   Link                                                                     |
|                |                                                                                            |
+================+============================================================================================+
| Ubuntu         | `Instructions <http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu>`__     |
|                |  If you have issues with the startup-creator, then use ``unetbootin``                      |
+----------------+--------------------------------------------------------------------------------------------+
| Others         | `Instructions <http://unetbootin.sourceforge.net/>`__.                                     |
+----------------+--------------------------------------------------------------------------------------------+

Using ``unetbootin``, point the *Disk Image* to the downloaded ISO location as shown below and click *OK*

|Unetboot|

Step 2. Register at Megam
====================================

Register at Megam SaaS `here https://www.megam.co. <https://www.megam.co>`__ The registered  ``email`` and ``api_key`` are needed when you start installing the CIB.



Step 3. Cloud in box : 2-Node Installation
============================================

Let us start a 2-Node installation.  We assume that the 2-Node setup is commissioned on premise and is connected to a private lan and external network.  Commissioned means the nodes are installed in their racks physically and ready to go.

Read more about :ref:`Planning the Installation  <cloudinabox_2node>`.


|Megam 2Unit CIB|

In this scenario we assume that the private subnet is ``192.168.2.x`` with gateway 192.168.2.1 to external public network. It could be different in your case.

Please have those information handy.

The CIB ISO is intelligent to start with `dhcp` and then fallsback to `manual static` network mode.


4. Install CIB Base Unit #1
====================================

Verify that the CIB Base Unit Bios uses ``Legacy Support``. We don't support UEFI yet. We are working to support UEFI as seen in this `limitation <https://github.com/megamsys/cloudinabox/issues/49>`__.

If you burned the ISO using ``unetbootin``, the boot prompt will look different. You should still see the option **Cloud In a Box Installation**

|Megam CIB Base Boot|


.. code::

    > *Cloud In a Box Installation* to start the install.
    > You'll have to select your **Wired** private lan ethernet port
    > The default language, keyboard, mirror to update OS are ``English``, ``US``, ``US``
    > You'll have to select the option to erase your harddisk and install the OS.

|Megam CIB Base Ready|

Reboot the CIB Base unit and you'll see a command prompt as below.

|Megam CIB Base Booted|

Now our CIB Web is running. Its time to put it to action.


4.1.  Login to CIB Base Unit
----------------------------

The default credentials are  userid: **cibadmin** password: **cibadmin**

.. code::

    userid   : cibadmin
    password : cibadmin

    # ifconfig
    eth0  Link encap:Ethernet  HWaddr c0:18:85:58:1c:4b
          inet addr:192.168.2.77  Bcast:192.168.2.255  Mask:255.255.255.0
          inet6 addr: fe80::c218:85ff:fe58:1c4b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:58376 errors:0 dropped:0 overruns:0 frame:383244
          TX packets:55016 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:34101695 (34.1 MB)  TX bytes:11322780 (11.3 MB)
          Interrupt:19


Note down the `i/p address` from the above instruction. This is needed in case you forgot to note down the URL from **Step 4**


4.2. Start CIB Web
-----------------------------

As you saw in  :ref:`Planning the Installation  <cloudinabox_2node>` we will use a thin client with a browser to manage the **CIB Units**.

Type the URL you saw in **Step 4** in a browser which looks something like `http://ip_address_cibbase:8086 <http://ip_address_cibunit1:8086>`__.

Replace the **ip_address_cibbase** with your own. If you forgot to note it down in **Step 4** then get the i/p from **Step 4.1**

|Megam Cloudinabox Web|

You will be greeted with a login. Type the registered ``email`` and ``api_key`` you created in **Step 2**


4.3. Install Megam
-----------------------------

Upon successful authentication, Megam install starts automatically in  CIB Base unit.

|Megam Cloudinabox Megam|


Upon successful completion, Cobblerd is started.


4.4. Install Cobblerd
-----------------------------

|Megam Cloudinabox Cobblerd|

Upon successful completion, Click next to proceed.


4.5. Install Opennebula FrontEnd
---------------------------------

Click Install. The install starts in ``CIB Base Unit``


|Megam Cloudinabox One|


Upon successful completion, Click next to proceed.


5. Install Node Unit
====================================

We'll have to prepare the ``CIB Node Unit``.

Verify that the CIB Node Unit Bios uses ``Legacy Support``. We don't support UEFI yet. We are working to support UEFI as seen in this `limitation <https://github.com/megamsys/cloudinabox/issues/49>`__.

Plug the `CIB Node Unit` in the same private LAN as `CIB Base Unit`. This node boots using pxe automatically.


|Megam CIB Node Boot|


.. code::

    > *Cloud In a Box(Node)* to start the install.
    > You'll have to select your **wired** private lan ethernet port
    > The default language, keyboard, mirror to update OS are ``English``, ``US``, ``US``
    > You'll have to select the option to erase your harddisk and install the OS.


Reboot the CIB Node unit and you'll see a commad prompt as below.

|Megam CIB Node Booted|

Now our CIB Node Agent is running. Its time to put it to action.


5.1. Install Open Nebula Host
-----------------------------

``CIB Web spins and waits till the ``CIB Node Unit`` is up and it is intelligent to get the connection information of the newly running unit.

Click Install.

|Megam Cloudinabox OneHost|

This completes the 2-Node install.

5.2 Checkpoint.
----------------

At this point you have a working OpenNebula (Private IaaS) running with Megam (PaaS) up and ready to go.

- Launch ``http://yourip_address_cibunit1:9687``

|Megam Cloudinabox Checkpoint One2|

- Launch ``http://yourip_address_cibunit1:8080`` Read more about :ref:`Megam Brower-based UI <nilavu_overview>`

|Megam Cloudinabox Checkpoint Megam1|


Step 6. Cloud in box : 3-Node Installation
============================================


.. note:: Read more about :ref:`Overview of Storage <storage>`.

The Node Unit can be brought up by following **Step 5**.

``CIB Web spins and waits till the ``CIB Node Unit`` is up and it is intelligent to get the connection information of the newly running unit.

Click Install.

|Megam Cloudinabox Ceph|

This completes the 3-Node install.



Step 7. Cloud in box : 4-Node Installation
==============================================

.. note:: Read more about :ref:`Overview of High Availability <ha>`.


The Node Unit can be brought up by following **Step 5**.

``CIB Web spins and waits till the ``CIB Node Unit`` is up and it is intelligent to get the connection information of the newly running unit.

Click Install.

|Megam Cloudinabox HA|

This completes the 4-Node install.



Step 8. Next steps
=====================


Now that you have a fully functional Cloud in a Box, it is time to start learning how to use it. A good starting point is this :ref:`overview of the applications <intrapps>`.


.. |Unetboot| image:: /images/unetboot.png
.. |Megam CIB Node Booted| image:: /images/megam_booted_cibnode.jpg
.. |Megam CIB Base Booted| image:: /images/megam_booted_cibbase.jpg
.. |Megam CIB Node Boot| image:: /images/megam_boot_cibnode.jpg
.. |Megam CIB Base Ready| image:: /images/megam_cibweb_ready.png
.. |Megam CIB Base Boot| image:: /images/megam_boot_cibbase.jpg
.. |Megam 2Unit CIB| image:: /images/megam_cib_2unit.png
.. |Server Node| image:: /images/server_sample.png
.. |Megam Cloudinabox Web| image:: /images/megam_cloudinabox_login.png
.. |Megam CIB 5step intro| image:: /images/megam_cib_5step_intro.png
.. |Megam Cloudinabox Megam| image:: /images/megam_cib_step1_megam.png
.. |Megam Cloudinabox Cobblerd| image:: /images/megam_cib_step1a_cobbler.png
.. |Megam Cloudinabox One| image:: /images/megam_cib_step2_one.png
.. |Megam Cloudinabox OneHost| image:: /images/megam_cib_step3_onehost.png
.. |Megam Cloudinabox Ceph| image:: /images/megam_cib_3unit.png
.. |Megam Cloudinabox HA| image:: /images/megam_cib_4unit.png
.. |Megam Cloudinabox Checkpoint One2| image:: /images/megam_checkpoint_one2.png
.. |Megam Cloudinabox Checkpoint Megam1| image:: /images/megam_checkpoint_megam1.png
