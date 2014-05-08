.. _gce_cloud:

================================
Google Cloud
================================

This page describes how to define a new AWS target cloud. 


Common Attributes
=================

These are the common attributes for this cloud are:

+--------------------+--------------+--------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------+
|     Attribute      |    Value     |                                                                Description                                                                 |               Mandatory                |
+====================+==============+============================================================================================================================================+========================================+
| **NAME**           | String       | Name of the cloud                                                                                                                          | YES                                    |
+--------------------+--------------+--------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------------+

Steps
============================

If you have your own account with GCE, you can use the same with megam. 

- Have the configuration handy as per this link `GCE <https://developers.google.com/compute/docs/instances#start_vm>`_.

- Watch this `Youtube video for GCE <http://youtu.be/5Q-Jynx-Ads>` 

- We use OAuth to authenticate with google. So for GCE, you need to "Click - Connect to Google" first before proceeding.

- Click ``Settings`` and choose ``GCE`` icon. 
   
.. image:: /images/gce.png 
         
- Click Save

- You can see your saved settings in under ``Manage Settings`` >  ``Clouds``   