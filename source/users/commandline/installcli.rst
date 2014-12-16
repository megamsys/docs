.. _installcli:

===================================
Command Line
===================================

This page shows you how to use megam's commandline to launch apps and service using a meta-model based on TOSCA.


What are my steps
==================

You'll have to define a meta-model - Domain Specific Language (DSL) for launching apps and services based on :ref:`TOSCA <megamdsl>`. Best way to start on it is to pick a sample from the :ref:`guide <megamdsl_sample>` and create a csar file. Make sure you have a cloud setting established using the browser interface (we are working to support creating cloud settings via CLI). Create a CSAR, push the CSAR to launch it

Lets get started by installing ``meggy`` - Megam's Command Line using a ruby gem.

Installing
========================

Install **Ruby 2.1 +** using ``rvm``

.. code::

    $ \curl -sSL https://get.rvm.io | bash -s stable

    $ rvm install ruby-2.1.5

Add the following in your  ~/.bashrc

.. code::

    PATH=$PATH:$HOME/.rvm/bin
    [[ -s "/home/user/.rvm/scripts/rvm" ]] && source "/home/user/.rvm/scripts/rvm"

Verify Ruby installation.

.. code::

    $ ruby -v
    ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]


Install rubygem `meggy`

.. code::

    $ gem install meggy

usage
-----

.. code::

    $ ./meg --help
    Usage: meg sub-command (options)
    -c, --config CONFIG              The configuration file to use
    -V, --verbose                    More verbose output. Use twice for max verbosity
    -v, --version                    Show meggy version
    -y, --yes                        Say yes to all prompts for confirmation
    -h, --help                       Show this message



help
--------

.. code::

    $ ./meg help
    INFO: Usage: meg SUBCOMMAND (options)

    General Meg Options:
        -c, --config CONFIG              The configuration file to use
        -V, --verbose                    More verbose output. Use twice for max verbosity
        -v, --version                    Show meggy version
        -y, --yes                        Say yes to all prompts for confirmation
        -h, --help                       Show this message

    INFO: For further help:
    INFO:   meg SUBCOMMAND --help     show the options for a command
    Available subcommands: (for details, meg SUB-COMMAND --help)

    ** ACCOUNT COMMANDS **
    meg account create EMAIL (options)
    meg account delete (options)
    meg account show

    ** CLOUDSET COMMANDS **
    meg cloudset list [options]

    ** CSAR COMMANDS **
    meg csar list [options]
    meg csar push CSARID [options]
    meg csar create YAMLFILENAME [options]

    ** HELP COMMANDS **
    meg help [list|TOPIC]

Command line `meggy` uses a configuration file from where the users email and api_key is pulled from. `-c` overrides the default and provides the file path to  load the configuration file.

.. note::

    -c is optional, by default meggy will look for a file under ``~/.megam/meg.rb``.

account create
---------------

To start working with Megam, you need an account.

.. code::

    $ meg account create guru@megam.co
    --> (/accounts/content)
    ┏━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃ Account         ┃ Information                              ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ email           ┃ guru@megam.co                            ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ api_key         ┃ ttDZVTLho8t5WiDR9ABd6w==                 ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ message         ┃ Onboard successful. email 'guru@megam.co ┃
    ┃                 ┃ ' and api_key 'ttDZVTLho8t5WiDR9ABd6w==' ┃
    ┃                 ┃  is registered.                          ┃
    ┗━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


.. warning:: Copy the  email and api_key provided above, you'll need this to run the subsequent commands.

configuration
---------------------

Create a file  .megam/meg.rb under your ``HOME`` directory.

.. code::

    $ ls ~
    $ mkdir -p .megam
    $ nano /megam/meg.rb

    $ cat ~/.megam/meg.rb
    email "guru@megam.co"
    api_key "ttDZVTLho8t5WiDR9ABd6w=="

The commands henceforth will require your ``email` and ``api_key``

account show
---------------------

If you have on-boarded with megam you can verify the details of your account.

.. code::

    $ meg account show
    --> (/accounts/guru@megam.co)
    ┏━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃ Account         ┃ Information                      ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ email           ┃ guru@megam.co                    ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ api_key         ┃ ttDZVTLho8t5WiDR9ABd6w==         ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ authority       ┃ admin                            ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ created_at      ┃ 2014-11-24 07:13:02 +0000        ┃
    ┗━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛




cloudset list
---------------------

This command lets you to list the available cloud settings. This is needed when you start building your :ref:`csar <megmdsl>`

.. warning:: New cloud settings can be created from :ref:`Browser interface <nilavu_overview>`.

.. code::

    $ meg cloudset list
    --> (/predefclouds)
    ┏━━━━━━━━━━━━━━━━━┳━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃ Cloud Settings  ┃ Type    ┃ Image    ┃ Flavor   ┃ Created At                ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━╊━━━━━━━━━━╊━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ clouddefault114 ┃ google  ┃ f1-micro ┃ debian-7 ┃ 2014-11-21 03:00:12 +0000 ┃
    ┃ 741309082920550 ┃         ┃          ┃ -wheezy- ┃                           ┃
    ┃ 4               ┃         ┃          ┃ v2013112 ┃                           ┃
    ┃                 ┃         ┃          ┃ 0        ┃                           ┃
    ┗━━━━━━━━━━━━━━━━━┻━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


csar create
---------------------

This command lets you to create csars. Read about :ref:`csars - how to to use them <megamdsl>`.

.. code::

    $ meg csar create appplusdb.csar -d ~/code/megam/ruby/meggy/spec
    --> (/csars/content)
    ┏━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃ CSAR            ┃ Information                                          ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ message         ┃ csar CSR1148563214649393152 created successfully.    ┃
    ┗━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


csar list
---------------------

This command lets you to list csars. Read about :ref:`csars - how to to use them <megamdsl>`.

.. code::

    $ ./meg csar list
    --> (/csars)
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃ CSAR                      ┃ Created At                     ┃
    ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ CSR1148557511599718400    ┃ 2014-11-24 06:47:43 +0000      ┃
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


csar push
---------------------

This command lets you to push csars. Read about :ref:`csars - how to to use them <megamdsl>`.

.. code::

    $ ./meg csar push  CSR1148557511599718400--> (/csars/push/CSR1148557511599718400)
    ┏━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    ┃ CSAR            ┃ Information                                          ┃
    ┣━━━━━━━━━━━━━━━━━╊━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
    ┃ message         ┃ csar pushed successfully.                            ┃
    ┗━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


Tutorial
--------

For more information on specification runtimes,

:ref:`Java app using CLI <javaappcli>`
:ref:`Rails app using CLI <railsappcli>`
