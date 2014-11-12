.. _deployapps:

====================
Deploy Applications
====================

This section describes the **deployment of an application functionality of Megam** launched in a cloud.

Application deployment has two main steps: application creation and application deployment.

Create an application
----------------------

Create a new app by clicking on the Add an App button, in the headbar.

Enter your application’s name and description and click “Next”.

Then select the language/framework


Git Deployment
---------------

To deploy via Git, you need it installed on your machine. You can find more information on `Git website: <http://git-scm.com>`__

Follow these steps to deploy your application:

Get the git deployment url from your source control manager. It will be off the form

- git://git@myserver.com/<your_app_id>.git.
- https://myserver.gom/<your_app_id>.git.

In your terminal, go to your code. If you do not already track your app with git, start by typing:

.. code::

	$ git init
	$ git add .
	$ git commit -m "first commit"

Then, link your local repository to Megam by providing the Git remote url:

.. code::

	$ git remote add <remote-name> <your-git-deployment-url>

	Push your application to Github:

	$ git push <remote-name> <branch-name>:master

.. warning::  You can only push to the master branch for deployment.

In order to push to master from a non-master local branch, use this syntax:

git push < name > yourbranch:master


Build App
---------------

Build the app by launching Megam.

Checkout your application logs in the dashboard to monitor the deployment.
