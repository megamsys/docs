#####################
Target cloud
#####################

This option allows you setup target cloud definitions.::

   1. Helpful when you run your apps/services with different memory/cpu and storage. 

   2. Helpful when you want to quickly launch the same app/service in a different cloud.

You can launch your apps and service in the cloud of your choice. If your cloud isn't here, please let us know. 


.. hint:: The supported clouds are:


+------------------------+----------------------------------------------------------------------+
| Cloud                  | Description                                                          |
|                        |                                                                      |
+========================+======================================================================+
| Profit bricks          | `profitbricks.com <https://www.profitbricks.com>`_.                  |
|                        | supported, tested with ubuntu images                                 |
+------------------------+----------------------------------------------------------------------+
| hp (openstack)         | `hpcloud.com <https://console.hpcloud.com>`_.                        |
|                        | supported, tested with ubuntu images                                 |
+------------------------+----------------------------------------------------------------------+
| AWS                    | `AWS EC2 <https://console.aws.amazon.com/console/homem>`_.           |
|                        | supported, tested with ubuntu images                                 |
+------------------------+----------------------------------------------------------------------+
| Google cloud           | `google cloud <https://cloud.google.com/>`_.                         |
|                        | supported, tested with debian images                                 |
+------------------------+----------------------------------------------------------------------+
| Gogrid                 | `gogrid.com <http://www.gogride.com>`_.                              |
|                        | 0.3 release - work in progress                                       |
+------------------------+----------------------------------------------------------------------+
| openQRM                | `openqrm-enterprise.com.com <http://openqrm-enterprise.com>`_.       |
|                        | 0.3 release - work in progress                                       |
+------------------------+----------------------------------------------------------------------+
| Podnix Cloud           | `podnix.com <https://www.podnix.com>`_.                              |
|                        | work in progress                                                     |
+------------------------+----------------------------------------------------------------------+

Profit Bricks
============================

If you have your own account with profitbricks, you can use the same with megam. 

1. Have the configuration handy

2. The "Image can't be entered for now". But use our custom snapshot named "raring_stencil" with a canned password for the snapshot "team4megam".  

3. We can fix it up to remove the canned password limitation.   
  
.. image:: _static/images/pb.png 
          
3. Click Save
   
4. You can see your saved settings in under ``Manage Settings`` >  ``Clouds``  


hp(Openstack)
============================

If you have your own account with hp, you can use the same with megam. 

1. Have the configuration handy as per this link `hp <https://community.hpcloud.com/article/getting-started-compute-135>`_.

2. Click ``Settings`` and choose ``hp`` icon. 
   
.. image:: _static/images/hpcloud.png 
          
3. Click Save
   
4. You can see your saved settings in under ``Manage Settings`` >  ``Clouds``   
 

 
AWS
============================


If you have your own account with AWS, you can use the same with megam. 

1. Have the configuration handy as per this link `AWS EC2 <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-instance_linux.html>`_.

2. Click ``Settings`` and choose ``AWS`` icon. 
   
.. image:: _static/images/aws.png 
 
3. Click Save
   
4. You can see your saved settings in under ``Manage Settings`` >  ``Clouds``   
 


GCE
============================

If you have your own account with AWS, you can use the same with megam. 

1. Have the configuration handy as per this link `GCE <https://developers.google.com/compute/docs/instances#start_vm>`_.

2. Watch this `Youtube video for GCE <http://youtu.be/5Q-Jynx-Ads>` 

3. We use OAuth to authenticate with google. So for GCE, you need to "Click - Connect to Google" first before proceeding.

4. Click ``Settings`` and choose ``GCE`` icon. 
   
.. image:: _static/images/gce.png 
         
5. Click Save

6. You can see your saved settings in under ``Manage Settings`` >  ``Clouds``   


Gogrid 
============================

.. hint:: This will be available in the 0.3 release due on April 11, 2014.
 


openQRM
============================

.. hint:: This will be available in the 0.3 release due on April 11, 2014.


Manage
============================

Once the cloud setting was saved, to manage them.   Click ``Settings`` from Dashboard.

.. image:: _static/images/manageclouds.png
 		
 		   
**View**  		
 		
Click ``Clouds`` on the tab view
             
Select and View the cloud          

.. image:: _static/images/viewcloud.png
