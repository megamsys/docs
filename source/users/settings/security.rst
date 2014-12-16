.. _generating_sshkeyspairs:

==================================
SSH Keypairs
==================================

In Megam you can define the cloud of choice by declaring its settings. To declare them, you'll need an ssh keypair associated with the cloud.

After you login to Megam, ``create a new SSH Keypair``. If you already have one, just ``import`` it.

SSH keys are used to establish a secure connection between your computer and Megam.

A user can have multiple SSH keys.


Create SSH Keypair
============================

* Click Settings > SSH Key Pairs

  .. image:: /images/sshkey_create.png

* Type in a keypair name > Click

  .. image:: /images/sshkeys_list.png

You can download the pub/private keys for future use.

.. _import_ssh:

Import SSH Keypair
============================

If you already have a set of pub/private keys import them here. This is handy to upload keypairs for AWS, HP or any other cloud.

* Click Import

  .. image:: /images/sshkey_import.png

* Type in a keypair name > Click Import
