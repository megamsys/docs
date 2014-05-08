.. _generating_sshkeyspairs:


###########################
SSH Keypairs
###########################

After you login to "Megam Cloud", generate a SSH Keypair. If you already have one, just import it. 

SSH keys are used to establish a secure connection between your computer and Megam.

A user can have multiple SSH keys.

.. Warning:

It’s important to not add the same SSH key to more than one account. Otherwise, you’ll get an error in the console.

How to add your SSH key on Megam?
-----------------------------------

You can already have an SSH key and so do not need to generate a new one. To check if you have one, follow the steps:

Find your SSH key
------------------

Wether you use Mac, Linux or Windows, open your Terminal application. Run $ cd ~/.ssh/ in your Terminal.

If it is found, you do not need to generate a new one, simply switch to the following `Import you key on Megam <import_ssh>` !


New SSH Keypair
============================

* Click Settings > SSH Keys
	
  .. image:: /images/step1sshkeys.png
	
* Type in a keypair name > Click 

  .. image:: /images/sshkeypair.png	

You can download the pub/private keys for future use.  

.. _import_ssh:

Import SSH Keypair
============================

If you already have a set of pub/private keys import them here. This is handly to upload keypairs for AWS, HP. 

* Click Import
	
  .. image:: /images/step1sshkeys_import.png
	
* Type in a keypair name > Click Import