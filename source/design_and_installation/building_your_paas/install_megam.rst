.. _install_megam:

========================
Installing the Software
========================

This page shows you how to install Megam from the binary packages.

Step 1. Installing Megam
========================


Installing on Ubuntu 14.04 Trusty
---------------------------------

.. code::

    sudo apt-add-repository "deb [arch=amd64]  http://get.megam.co/0.5/ubuntu/ trusty testing"

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7

    sudo apt-get update

    sudo apt-get install megamnilavu megamsnowflake megamgateway megamd megametcd megamanalytics


The package hierarchy for ``Ubuntu 14.04 Trusty`` is shown below.

|megam trusty packages|


Installing on Ubuntu 12.04 Precise
----------------------------------

.. code::

    sudo add-apt-repository "deb [arch=amd64] http://get.megam.co/0.5/ubuntu/ precise testing"

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv B3E0C1B7

    sudo apt-get update

    sudo apt-get install megamnilavu megamsnowflake megamgateway megamd megamanalytics

The package hierarchy for ``Ubuntu 12.04 Precise`` is shown below.

|megam precise packages|

My platform isn't here : Please contact us `support@megam.co.in <mailto:support@megam.co.in>`_.

Package Description
-------------------

The following table describes the several packages installed by Megam and their purpose.

+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
|     Name                          | Description                                     |                  Source Code                        |
|                                   |                                                 |                                                     |
+===================================+=================================================+=====================================================+
| megamcommon                       | Setup megam  (user, groups, dirs)               | `link <https://github.com/megamsys/packager>`__     |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| megamnilavu                       | Web interface based on ruby                     | `link <https://github.com/megamsys/nilavu>`__       |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| megamsnowflake                    | Python daemon which generates unique ids        | `link <https://github.com/megamsys/pysnowflake>`__  |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| megamgateway                      | API server based on scala                       | `link <https://github.com/megamsys/megam_gateway>`__|
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| megamd                            | Engine for megam (golang)                       | `link <https://github.com/megamsys/megamd>`__       |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| chef-server                       | `Chef 11 server<http://getchef.com>`__ server   | `link <https://github.com/opscode/chef-server>`__   |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| megamanalytics                    | Realtime streamer -logs, and log shipper(heka)  | `link <https://github.com/megamsys/tap>`__          |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| megamvarai                        | Visual designer for Megam                       | `link <https://github.com/megamsys/varai>`__        |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+
| megammonitor                      | Metrics and Monitor based on gangila            | `link <https://github.com/ganglia>`__               |
+-----------------------------------+-------------------------------------------------+-----------------------------------------------------+

Step 2. Verifying the installation
==================================

This section provides ability to verify the installation.
Fundamentally as the installation is complex, it probles the fact on

- **Have I installed all the packages to get megam running ?**
- **Are all my services that is needed for megam running ?**

Download and run `this <https://raw.githubusercontent.com/megamsys/cloudinabox/master/conf/trusty/cib.sh>`__ script. If you installed ``Cloud In a Box``, this is packaged already.

.. code::

  # chmod 755 cib.sh
  # ./cib.sh report
  select option [megam] to report about.


- This report line specifies that the package was installed [OK]

|Megam CIB Verify2|


- This report line specifies that the package wasn't installed [FAILED]

|Megam CIB Verify3|


- This report line specifies that the service isn't running [FAIL]

|Megam CIB Verify4|


- This report line specifies that the service is running [OK]

|Megam CIB Verify5|

Step 3.
==================




Step 4. Next steps
===================

Now that you have a fully functional PaaS, it is time to start learning how to use it. A good starting point is this :ref:`overview of the applications <intrapps>`.

.. |megam trusty packages| image:: /images/megam_packages_trusty.png
.. |megam precise packages| image:: /images/megam_packages_precise.png
.. |Megam CIB Verify1| image:: /images/megam_cib_verify1.png
.. |Megam CIB Verify2| image:: /images/megam_cib_verify2.png
.. |Megam CIB Verify3| image:: /images/megam_cib_verify3.png
.. |Megam CIB Verify4| image:: /images/megam_cib_verify4.png
.. |Megam CIB Verify5| image:: /images/megam_cib_verify5.png
