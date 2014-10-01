.. _install_megam:

========================
Installing the Software
========================

This page shows you how to install Megam from the binary packages.

Step 1. Installing Megam
------------------------------------


Installing on Ubuntu 14.04 Trusty
==================================

.. code::

    sudo add-apt-repository "deb http://get.megam.co/0.5/ubuntu/ trusty testing"

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7

    sudo apt-get update

    sudo apt-get install megamnilavu megamsnowflake megamgateway megamd megamanalytics


The package hierarchy for ``Ubuntu 14.04 Trusty`` is shown below.

|megam trusty packages|


Installing on Ubuntu 12.04 Precise
=====================================

.. code::

    sudo add-apt-repository "deb http://get.megam.co/0.5/ubuntu/ precise testing"

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7

    sudo apt-get update

    sudo apt-get install megamnilavu megamsnowflake megamgateway megamd megamanalytics

The package hierarchy for ``Ubuntu 12.04 Precise`` is shown below.

|megam precise packages|

My platform isn't here : Please contact us `support@megam.co.in <mailto:support@megam.co.in>`_.


Step 2. Verifying the installation
------------------------------------

Download and run `this <https://raw.githubusercontent.com/megamsys/cloudinabox/master/conf/trusty/cib.sh>` script. If you installed ``Cloud In a Box``, this is packaged already.

.. code::

  # chmod 755 cib.sh
  # ./cib.sh report

This report specifies if the packages were installed [OK]

|Megam CIB Verify1|


This report specifies if the services are running [OK]

|Megam CIB Verify2|




Step 3. Next steps
===================

Now that you have a fully functional PaaS, it is time to start learning how to use it. A good starting point is this :ref:`overview of the applications <intrapps>`.

.. |megam trusty packages| image:: /images/megam_packages_trusty.png
.. |megam precise packages| image:: /images/megam_packages_precise.png
.. |Megam CIB Verify1| image:: /images/megam_cib_verify1.png
.. |Megam CIB Verify2| image:: /images/megam_cib_verify2.png
