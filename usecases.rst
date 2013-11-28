#####################
Typical Usecases
#####################

To test the templates installation::

   1. change to home directory
          * $ cd 
   2. build a template pyre application
          * $ app.py
          * creating application 'Simple' in 'simple.py'

Now that the build system is installed, let's install pyre. 


Developer Scenario
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

Team Scenario
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

Cloud Bursting
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


