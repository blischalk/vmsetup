#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters"
  echo "Usage: ./vmsetup.sh <user>"
  exit 1
fi

USER=$1

# Update
sudo apt-get update

# Screen
sudo apt-get install screen

# Install Git
echo "Installing Git"
sudo apt-get install git

# Install Java
echo "Installing Java"
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y install oracle-java8-installer

# Install Leiningen
cd /usr/local/bin
sudo wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo chmod 755 lein

# Install Metasploit Dependencies
echo "Installing Metasploit dependencies and useful good stuff"
sudo apt-get -y install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev pkg-config

# Install Ruby
sudo apt-get -y install gnupg2
curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
curl -L https://get.rvm.io | bash -s stable
source /home/$USER/.rvm/scripts/rvm
echo "source /home/$USER/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default
ruby -v

# Install Metasploit
echo "Installing Metasploit"
cd /opt
sudo git clone https://github.com/rapid7/metasploit-framework.git
sudo chown -R $USER /opt/metasploit-framework
cd metasploit-framework
rvm --default use ruby-${RUBYVERSION}@metasploit-framework
gem install bundler
bundle install
sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'

# Install NMap
echo "Installing NMap"
sudo -u $USER -H sh -c "\
mkdir ~/Development \
cd ~/Development \
git clone https://github.com/nmap/nmap.git \
cd nmap \
./configure \
make \
make install \
make clean"

# Install VIM
echo "Installing VIM"
sudo apt-get -y install vim

# Install Python Stuff
echo "Installing python stuff"
sudo apt-get -y install python-pip python-dev build-essential
sudo -u $USER -H sh -c "\
pip install --upgrade pip"

# Install Veil
cd ~/
git clone https://github.com/Veil-Framework/Veil-Evasion.git
cd Veil-Evasion/
cd setup
setup.sh -c

# Install Empire
cd ~/
git clone https://github.com/EmpireProject/Empire.git
cd Empire
./setup/install.sh

# Install Burp
cd ~/
wget "https://portswigger.net/burp/releases/download?product=free&version=1.7.27&type=linux"

# Install Owasp Zap
cd ~/
wget https://github.com/zaproxy/zaproxy/wiki/Downloads
