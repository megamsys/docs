.. _javaapp:

#####################
Java
#####################


Java

The Megam offers you to run your Java projects. You can deploy this kind of project without changing your code, but running it on Megamneeds some configuration files, to add parameters like your targeted container for instance.


Create an application ref: 'Apps Overview <apps>'



Tomcat 8.0
------------

|megam basiccombo javaapp|


JVM Runtime
------------

#1 app + dbserver

User picks the components and composes the app and service to be placed in the same VM,  this is named as densely packed VM.
Each component has individual properties dialog box. When user double click the
      component, the properties dialog box appears, then create new group(densely packed
VM) name or use already created group name in that properties box.
Every component has a name and the group name.
In this the group name is also like subdomain name eg: something.megam.co .
User invoked app via an url “something.megam.co/componentname”.
These same steps are the same for varai  and normal mode.
Diego includes CC-Bridge, a collection of components that interface with Cloud Foundry's Cloud Controller and stage and run user applications. This is done by translating the domain-specific notion of apps into the generic language of tasks and LRPs




Maven
------

Maven is essentially a project management and comprehension tool and as such provides a way to help with managing:

.. |megam basiccombo javaapp| image:: /images/megam_basiccombo_java.png
