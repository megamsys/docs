.. _context_overview:

===================================
Source Control Manager Overview
===================================

Megam provides different methods to pass source control (SCM) information to a newly created Virtual Machine. This information can be reside in a public/private SCM 


###########################
Source Control Manager
###########################

"Megam" uses any public/private Git repo to deploy the apps/services in the cloud. 


Some of the popular ones are described here. There are two choices for providing a Git repo. You can ``manually`` type the repo url
or ``authenticate to the scm`` and we use the api to list your repos. 

 .. image:: /images/scm.png

Github
============================

If you don't have an account yet, please feel free to get one. `https://github.com <https://github.com>`_.

- When you click on the Github octocat icon, we use OAuth to authenticate you and list the repos.  
     
  

Assembla
============================

If you don't have an account yet, please feel free to get one. `https://assembla.com <https://assembla.com>`_.

- When you click on the Assembla icon, we use OAuth to authenticate you with assembla and list the repos.  
   


SCM-Manager 
============================

This option is for customers who wish to run a SCM and use it in Megam.  Launch your own SCM-Manager instance
 


-  :ref:`Github   <github>`: If you want to configure Github read this guide.
-  :ref:`Assembla <assembla>`: If you only want to configure Assembla read this guide.
-  :ref:`SCM-Manager <scm-manager>`: If you only want to configure SCM-Manager read this guide.
-  :ref:`Bitbucket  <bitbucket>`: If you only want to configure Bitbucket read this guide.
-  :ref:`CloudForge  <cloudforge>`: If you only want to configure CloudForge read this guide.
