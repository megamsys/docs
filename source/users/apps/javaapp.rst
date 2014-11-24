.. _javaapp:

#####################
Java
#####################






Basic Combo
===========

1. app + dbserver

Multiple components along with a service is placed in the same VM by the user(Densely Packed VMs)
Each components have individual property dialog boxes and they pop up when the user double clicks on them.
Since there are multiple components involved inside a same VM(Densely Packed VM),they are grouped under a common 'Group Name'.
Each components have a **Component Name**.
Now, all component(s) belong to a group.

The group names and the component names are useful to access using an url ``something.megam.co/componentname"``
Same steps are used for both **varai** and **normal mode**

|megam basiccombo javaapp|



**JVM Runtime**
===============



Now, read further to get a clear walk through on how to deploy a java application with a single click on Megam PaaS.

Start by signing into megam which takes you to the main dashboard.

Megam Dashboard
---------------

Megam Dashboard is designed to provide minimal-yet-effective navigation for user's ease and reduces
unnecessary complexities.
User logging in for the first time, belongs to a default organization.
A user can create as many organizations as he/she wants under **User Settings**

Click **CREATE AN APP** to create a new application.
(You can also choose Visual Designer to visually drag drop various components to deploy applications)


**Megam Java Web Starter Pack:**
--------------------------------


Once **Create an App** is clicked, the page loads to **Megam MarketPlace.**
The marketplace contains all the applications, addons and services neatly segregated.

Click on the Java Starter Pack and a *Deploy Dialog Box* pops up.

Deploy Dialog Box:
------------------
Easy 5 step deployment of a Java Application:

1. Check basic combo: ``java + postgreSQL``

2. Pick your application name

3. Choose your IaaS provider:
   Megam supports all major IaaS providers. Before launching in a particular IaaS provider,
   there are certain set ups between megam and IaaS provider is necessary.
4. BYOC(Bring Your Own Code):
   Megam supports plethora of SCMs, select one.
   Enter the URL of your source code

5. Click **Create an App** with all pride.

Voila! your application is running like a charm!



**Do not have a project to start with? Try out our test project for deployment.**



**Getting Started with Deploying a sample JAVA Application**
-----------------------------------------------------------



Prepare the application:
------------------------


Barebone java app, which can be used to deploy in Megam.


Running Locally:
----------------


**Basic Prerequisites:**

**Installing GIT:**

**Git**:

A tool that has become a part of every linux developer's life is an effective
SCM


**Maven**:

Maven is essentially a project management and comprehension tool and as such provides a way to help with managing:


**Installing Git:**

.. code::

    $sudo apt-get update
    $sudo apt-get install git


**Installing Maven:**

.. code::

     $sudo apt-get install maven

Now, clone the sample github project and test it locally.

.. code::

      $git clone https://github.com/megamsys/java-getting-started.git
      $cd java-getting-started
      $mvn install


Check the app running on localhost:5000



**Deploying in Megam:**
-----------------------

Now we know the application is in a working state, let us deploy it in Megam.

Follow the steps to get started.

* Login Megam to enter dashboard
* Click 'Create an App'
* Choose Java Starter Pack
* Deploy Dialog Box - Select *Github* and paste the URL below.
* Click Create App

Now Megam will launch the application.

App performance can be checked in Apps Overview page.




.. |megam basiccombo javaapp| image:: /images/megam_basiccombo_java.png
