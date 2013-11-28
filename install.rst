
Installation
=======================================

#####################
Workstation Client (Command Line (CLI))
#####################

The command line uses Ruby 2.0 + to interact with Megam Cloud. 

**Verbose Mode**
  This a beta launch, and we have enabled verbose mode for the CLI. We'll add more features rapidly post our launch.

* To install the Ruby-based Megam client tools, you first need to install git and Ruby Gems.

On a Debian-based Linux distribution, it’s as easy as::

 
 $> sudo apt-get update

 $> sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev 
 libyaml-dev libxml2-dev libxslt1-dev
 
 $> sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
 
 $> curl -L https://get.rvm.io | bash -s stable
 
 $> source ~/.rvm/scripts/rvm
 
 $> echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
 
 $> rvm install 2.0.0-p247

 $> rvm use 2.0.0-p247 --default
 
 $> ruby -v

On a rpm-based Linux distribution, it’s as easy as::

$> sudo yum install ruby rubygems

Next, install the Megam Cloud (meggy) gem::

$> gem install meggy