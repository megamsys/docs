.. _chefinternals:

========================
Chef Internals
========================

The Chef Subsystem is the component in charge of talking to the hypervisor installed in the hosts and taking the actions needed for each step in the VM lifecycle.


Chef Internal Process
----------------------

|chef internal|

The `cookbooks in chef-repo <https://github.com/megamsys/chef-repo.git>`__ offers a powerful, efficient and secure feature set for standing up apps, service. They can be extended to your requirement.

Cookbooks has support for ubuntu trusty.  debian and centos are a work in progress.

Usually any launch in the cloud follows the steps as shown in the picture.


.. |chef internal| image:: /images/megam_chef_process_internal.png

.. note:: Integration to saltstack is being explored as it offer performance improvement  and  will be supported in the future releases. 
