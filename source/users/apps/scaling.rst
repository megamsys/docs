.. _scalingapps:

#####################
Scaling 
#####################


Megam gives you the ability to fine tune your application’s scaling by managing both horizontal and vertical scaling. These two parameters can be combined or not and are based on the notion of ``Auto Scaler``.


What is an Auto Scaler?
-------------------------

An Auto Scaler is an individual virtual machine hosting your application and are independent.

An Auto Scaler is defined by two factors: RAM and CPU on the cloud of your choice

With the Auto Scalers, Megam gives you the ability to scale your application up and down with two non exclusive methods: horizontal and vertical scaling.

Horizontal scaling
---------------------


In case of large traffic, we detect a high load on your application and spawn another instance in parallel. It gives more power to your application by setting up another identical application. Both will run in parallel with load balancing. And so on.

This process is exactly the opposite when the load decreases. A Scaler is removed and so on till a minimum reasonable level.

The following scheme depicts a Scaler replication in case of a load increase:






You can manage the range of Scalers you consider in the application configurator. The range is from 1 to 40.


Vertical scaling
------------------

In case of large traffic, we detect a high load on your application and setup a new larger Scaler.

In case of low traffic, we detect a low load and setup a new smaller Scaler.

You give more power to your application by setting up a larger instance that will replace the previous one. The more the load, the larger the instance.

The following scheme depicts a larger Scaler replacement in case of a load increase: