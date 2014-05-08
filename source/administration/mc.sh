#!/bin/sh
#Copyright (c) 2014 Megam Systems.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
###############################################################################
# A simple Script for performing an install of megamcloud http://www.megam.co
###############################################################################

black='\033[30m'
red='\033[31m'
green='\033[32m'
yellow='\033[33m'
blue='\033[34m'
magenta='\033[35m'
cyan='\033[36m'
white='\033[37m'

alias Reset="tput sgr0"      #  Reset text attributes to normal
                             #+ without clearing screen.

#--------------------------------------------------------------------------
#colored echo
#--------------------------------------------------------------------------
cecho ()                     # Color-echo.
                             # Argument $1 = message
                             # Argument $2 = color
{
local default_msg="No message passed."
                             # Doesn't really need to be a local variable.

message=${1:-$default_msg}   # Defaults to default message.
color=${2:-$black}           # Defaults to black, if not specified.

  echo "$color$message"
  Reset                      # Reset to normal.

  return
}
#
#
#
#--------------------------------------------------------------------------
#parse the input parameters. 
# Pattern in case statement is explained below.
# a*)  The letter a followed by zero or more of any
# *a)  The letter a preceded by zero or more of any 
#--------------------------------------------------------------------------
parseParameters()   {
#integer index=0

if [ $# -lt 1 ]
	then
		help
        	exitScript 1
	fi


for item in "$@"
do
    case $item in
        [hH][eE][lL][pP])
            help
            ;;
	('/?')
            help
            ;;
            [cC][hH][eE][fF])
            chef
            ;;
            [sS][nN][oO][wW])
            snowflake
            ;;
	    [rR][iI][aA][kK])
            riak
	    [pP][lL][aA][yY])
            play
            ;;   
	    [hH][eE][rR][kK])
            herk
            ;;  
 	    [aA][lL][lL])
            all
            ;;         
            *)
	    echo "Unknown option : $item - refer help."
            help	
            ;;
esac
index=$(($index+1))
done
}
#
#
#--------------------------------------------------------------------------
#prints the help to out file.
#--------------------------------------------------------------------------
help() {
    cecho "Usage : mc.sh [Options]" $green
    cecho  "help    : prints the help message." $blue
    cecho  "chef    : does a install of Chef Server 11.0." $blue
    cecho  "snow    : does a install of Snowflake, Zookeeper." $blue
    cecho  "play    : does a install of Cloud Gateway." $blue
    cecho  "herk    : does a install of Cloud Bridge Herk." $blue
    cecho  "all     : does a intall of all (Snowflake, Zookeeper, Cloud API Server, Cloud Bridge Herk." $cyan

}
#
#
#
#--------------------------------------------------------------------------
#installs chef
#--------------------------------------------------------------------------
chef() {
 echo "========================================================="
 echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list
 cecho "Installing Chef.." $yellow
 sudo mkdir -p /etc/apt/trusted.gpg.d
 gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
 gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null
 sudo apt-get -y update
 sudo apt-get -y install opscode-keyring
 sudo apt-get -y upgrade
 sudo apt-get -y install chef
 gem install chef --no-ri --no-rdoc
 echo "========================================================="
}
#--------------------------------------------------------------------------
#installs zookeeper
#--------------------------------------------------------------------------
zookeeper() {
 echo "========================================================="
 cecho "Installing Zookeeper.." $yellow
 #sudo apt-get install zookeeper
 echo "========================================================="
}
#--------------------------------------------------------------------------
#installs snowflake
#--------------------------------------------------------------------------
snowflake() {
 echo "========================================================="
 zookeeper
 cecho "Press [Enter] to install Snowflake server." $green
 cecho "Downloading Snowflake Server" $yellow
 read
 wget https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/debs/megamsnowflake.deb 
 echo
 cecho "Installing Snowflake Server" $yellow
 read
 sudo dpkg -i megamsnowflake.deb
 echo 
}
#--------------------------------------------------------------------------
#installs riak
#--------------------------------------------------------------------------
riak() {
 echo "========================================================="
 echo "========================================================="
 zookeeper
 cecho "Press [Enter] to install Riak." $green
 cecho "Downloading Riak.." $yellow
 read
 wget http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.0pre5/ubuntu/precise/riak_2.0.0pre5-1_amd64.deb 
 echo
 cecho "Installing Riak.." $yellow
 read
 sudo dpkg -i riak_2.0.0pre5-1_amd64.deb 
 echo 
 
 echo "========================================================="
}
#--------------------------------------------------------------------------
#installs cloud api server
#--------------------------------------------------------------------------
play() {
cecho "Press [Enter] to install Cloud Gateway." $green

cecho "Downloading Cloud Gateway" $yellow
read
wget https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/debs/megamplay.deb
echo
cecho "Installing Cloud Gateway" $yellow
read
sudo dpkg -i megamplay.deb
echo
}
#--------------------------------------------------------------------------
#installs herk bridge
#--------------------------------------------------------------------------
herk() {
cecho "Downloading Cloud Bridge Herk" $yellow
read
wget https://s3-ap-southeast-1.amazonaws.com/megampub/0.1/debs/megamherk.deb
echo
cecho "Installing Cloud Bridge Herk" $yellow
read
sudo dpkg -i megamherk.deb
echo
}
#--------------------------------------------------------------------------
#installs everything
#--------------------------------------------------------------------------
all() {
snowflake
zookeeper
play
riak
herk
#echo "Downloading gulpd binary and copying to /usr/bin"
#curl -sL https://s3.amazonaws.com/megam_pub/0.1/gulpd.tar.gz | sudo tar -xz -C /usr/bin
}
#--------------------------------------------------------------------------
#This command will exit out of the script.
#--------------------------------------------------------------------------
exitScript(){
exit $@
}

#parse parameters
parseParameters "$@"

cecho "Good bye." $yellow
exitScript 0
