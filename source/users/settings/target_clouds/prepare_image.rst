.. _prepare_image:

================================
Prepare Your Image
================================

We use a special image for apps and service launches. You can build your own on the cloud of choice.

This section describes how to define a new Image on a target cloud.


Steps
============================


Spin a VM in to the target cloud.  SSH into to the instance.


Download Script : Ubuntu Trusty
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

SSH into the VM

Download and Run `this <https://gist.githubusercontent.com/thomasalrin/4cc396b1478ad4ce76ad/raw/54fc82b9de00823c2ee3a7b844332448304a8026/megam_pim.sh>`__ script.

.. code::

  # chmod 755 megam_pim.sh
  # ./megam_pim.sh


Take a Snapshot
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Every cloud has its own way of taking a snapshot. Snapshot the VM and use it as an image for future runs in Megam.
