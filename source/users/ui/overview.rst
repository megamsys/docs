.. _nilavu_overview:


==================================
Megam Browser-based User Interface
==================================

As a developer, you can interact with the Megam infrastructure by using a browser-based user interface.

There are two ways interacting with Megam using an user interface.

Nilavu
==========

Nilavu presents an easy to use interface as shown below which allows apps and services to be launched on any cloud.

.. note:: http://ip:8080 starts  Nilavu

|nilavu_ui|

Read about launching the following Using Nilavu

-  :ref:`Apps  <appsguide>`
-  :ref:`Services <servicesguide>`
-  :ref:`Marketplace <marketplacesguide>`


Visual Designer
======================

.. note:: Click on the icon ``Visual Designer`` to launch it. This can only be launched upon launching Nilavu. Megam provides an intuitive drag and drop user interface called ``Visual Designer``

The following user interface comes up.

|varai_ui|


Concepts
==========

Visual Designer consists of palette, sheet, graphical node.

Palette
    In visual designer, a palette consists of a draggable canvas with the necessary tools that a developer is planning to compose.

|varai palette|

Sheet
    In visual designer, sheet is the area where the actual composing of an ``Assembly`` happens. Read about :ref:`What is an Assembly <tosca>`

Graphical Node
    In visual designer, a node is a single artifact that may or may not have links at both the ends. The fundamental graphical nodes supported are apps, services, cloud settings.

|varai node|

Applications
    In visual designer, an application, or app, represents the artifact that a developer is building.
|varai node|


Services
    A service is a cloud extension that is may be hosted by megam or created by you. The service provides functionality that is ready-for-use by the app's running code. The predefined services provided by megam include database, messaging.

You can create your own services in megam. These services can vary in complexity. They can be simple utilities to a database.

Megam simplifies the use of services by provisioning new instances of the service, and binding those service instances to your application. The management of the service is handled automatically by megam. For all available services in megam, see the ``Palette`` in the megam visual designer user interface.

Cloud Setting
    In visual designer, a cloud setting, represents the properties that a developer wished to compose and launch the app.

|varai cloud setting|
After the cloud setting node is dropped in the sheet, by clicking on it, opens a dialog to select the pre stored cloud setting options. Currently new cloud setting needs to entered in :ref:`Nilavu <nilavu>`

|varai pick a cloud|

Use cases for Varai
---------------------

Quite common in enterprise you have a complex picture that needs to be stood up instantly on your private cloud. For example.

An App load balanced + linked to a service.

What does it convey, it says that a sample application (eg: Customer Relationship App) stores its data in a PostgreSQL needs to be load balanced. When one goes down the other can work or handle load spike efficiently. This is just  sample example, but imagine more complex scenarios where App + DB load balanced and front ended by webservers like (nginx).

This demands for an easy to use visual designer with drag and drop ability.

Composing Rules
----------------

The visual designer is intelligent enough to figure out the completeness of the drawing. The is done by following rules mentioned above.

-  Any app or services as used in the sheet needs to have a link to a cloud setting.

Error : When the drawn ``Assembly`` isn't complete.
  |varai error|


Invalid as ``service postgresql`` doesn't link to a cloud setting
  |varai err drawn1|

Invalid as ``app java`` and ``service postgresql`` doesn't link to a cloud setting.
  |varai err drawn2|

Invalid as cloud setting isn't attached to any ``graphical node``.
  |varai err drawn3|

Invalid ``service postgresql`` doesn't link to a cloud setting
  |varai err drawn4|

Invalid ``service postgresql`` doesn't link to a cloud setting
  |varai err drawn5|

.. _compose_gn:

Compose a Graphical Node(GN).
===============================

We'll discuss the fundamental steps which will be useful when trying to compose apps and a service in the further examples.

Step 1. Drag and drop GNs
---------------------------

-  Drag a Cloud Setting Node.

-  Drag a App Node.

|varai compose step1|


Step 2. Link the two GN
---------------------------

-  Click the edge in Cloud Setting node and attach it to the App Node.

|varai compose step2|

Step 3. Enter Git for App
---------------------------

Click the ``App Node`` and enter the ``Git`` information for source code.

|varai compose step3|

Step 4. Properties for GN
---------------------------

Upon update the properties are shown in the right side bar.

|varai compose step4|

Step 5. Deleting GNs
---------------------

Make a bounding box by using the mouse on top the GN and click delete.

|varai compose step5|

Step 6. Add Service
---------------------------

-  Drag a Cloud Setting Node.

-  Drag a Service Node.

-  Click the edge in Cloud Setting node and attach it to the Service Node.

|varai compose service|


Compose a App + Service
===============================


Step 1. Drag and drop GNs
---------------------------

-  Make a drawing as shown below. Read about :ref:`building a drawing <compose_gn>`

-  Click Java Node enter the ``Git`` information for source code.
You'll notice a  random ``Name`` **MarcusHuff** and ``Application`` **MattieBaker** appears.

- Click Ok

|varai compose appdb step1|


Step 2. To Link App and Service
--------------------------------

-  Copy the ``Application`` **VoilaMontgomery**

-  We need **VoilaMontgomery** as the ``Application`` in the service node.

|varai compose appdb step2|


Step 3. Linked App and Service
-------------------------------

-  Paste the ``Application`` **VoilaMontgomery**

-  Enter other parameters such as DB password etc.


|varai compose appdb step3|

Compose a App + Service (Multi cloud)
======================================


Step 1. Drag and Drop GNs
--------------------------

-  Make a drawing as shown below. Read about :ref:`building a drawing <compose_gn>`

-  Click Java Node enter the ``Git`` information for source code.
You'll notice a  random ``Name`` **MilleBallard** and ``Application`` **PeterStrokes** appears.

- Click Ok

|varai compose appdb step4|

Step 2. Individual App and Service
------------------------------------

-  Click PostgreSQL node.

-  The ``Application`` **JosephBishop**

-  We need a different ``Application`` than the App **JosephBishop** as in the service node.

|varai compose appdb step5|


Step 3. Composed App and Service
---------------------------------

The following depicts two individual GNs ``App`` and ``Service`` that will get launched in Multi cloud

|varai compose appdb step6|


Step 4. Linked App and Service (Multi cloud)
--------------------------------------------

The following depicts two individual GNs ``App`` and ``Service`` that will get launched in Multi cloud and are linked.

|varai compose appdb step7|

Step 5. Click Deploy
---------------------

Make a bounding box by using the mouse on top the GN and click delete.

|varai success|






.. |varai compose appdb step7| image:: /images/varai_compose_appdb_step7.png
.. |varai compose appdb step6| image:: /images/varai_compose_appdb_step6.png
.. |varai compose appdb step5| image:: /images/varai_compose_appdb_step5.png
.. |varai compose appdb step4| image:: /images/varai_compose_appdb_step4.png
.. |varai compose appdb step3| image:: /images/varai_compose_appdb_step3.png
.. |varai compose appdb step2| image:: /images/varai_compose_appdb_step2.png
.. |varai compose appdb step1| image:: /images/varai_compose_appdb_step1.png
.. |varai compose service| image:: /images/varai_compose_service1.png
.. |varai compose step5| image:: /images/varai_compose_step5.png
.. |varai compose step4| image:: /images/varai_compose_step4.png
.. |varai compose step3| image:: /images/varai_compose_step3.png
.. |varai compose step2| image:: /images/varai_compose_step2.png
.. |varai compose step1| image:: /images/varai_compose_step1.png
.. |varai success| image:: /images/varai_success.png
.. |varai err drawn1| image:: /images/varai_error2.png
.. |varai err drawn2| image:: /images/varai_error3.png
.. |varai err drawn3| image:: /images/varai_error4.png
.. |varai err drawn4| image:: /images/varai_error5.png
.. |varai err drawn5| image:: /images/varai_error6.png
.. |varai error| image:: /images/varai_er.png
.. |varai pick a cloud| image:: /images/varai_pick_a_cloud.png
.. |varai cloud setting| image:: /images/varai_cloudsettings.png
.. |varai node| image:: /images/varai_node.png
.. |varai palette| image:: /images/varai_palette.png
.. |varai_ui| image:: /images/varai.png
.. |nilavu_ui| image:: /images/nilavu_ui.png
