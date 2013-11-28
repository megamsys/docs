###########################
Private PaaS
###########################

Prerequisites
============================



Installing at your backyard
============================

Before installing "Megam Cloud", one must install its prerequisites, popularly called "Make.mm" because it is triggered by the "mm" comand.  It is essentially a set of macros and add-ons to normal make.  Typing 'mm' activates a file called Make.mm in each directory.  This configuration file can be used to compile and install pyre apps, odb files, components, and c extensions.


There is a prebuilt script available for Ubuntu.

On a Debian-based Linux distribution, it’s as easy as:

`` $> curl -L https://s3.megampub.com/abcd/install.sh | bash -s 0.1 ``


Quick Initialization (Prime)
============================

Once the above environment variables have been set, download and build config/ and the templates/ with the following steps::

   1. create development directory
          * $ mkdir -p $DV_DIR 
   2. create tools directory
          * $ mkdir -p $TOOLS_DIR 
   3. create builds directory
          * $ mkdir -p $BLD_ROOT 
   4. change to development directory
          * $ cd $DV_DIR 
   5. use anonymous cvs to get config and the templates
          * $ cvs -d :pserver:config@cvs.cacr.caltech.edu:/config login
            [password: config]
          * $ cvs -d :pserver:config@cvs.cacr.caltech.edu:/config co config
          * $ cvs -d :pserver:pyre@cvs.cacr.caltech.edu:/pyre login
            [password: pyre]
          * $ cvs -d :pserver:pyre@cvs.cacr.caltech.edu:/pyre co templates 
   6. change to templates directory
          * $ cd $TEMPLATES_DIR 
   7. build templates
          * $ mm 

$DV_DIR should now have the following structure::

  builds/  config/  templates/  tools/

For support refer (point to support link)  

#####################
Hybrid PaaS
#####################

To test the templates installation::

   1. change to home directory
          * $ cd 
   2. build a template pyre application
          * $ app.py
          * creating application 'Simple' in 'simple.py'

Now that the build system is installed, let's install pyre. 




