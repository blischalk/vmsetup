#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters"
  echo "Usage: ./vmsetup.sh <user>"
  exit 1
fi

USER=$1

# Update
#echo "Updating apt"
#sudo apt-get update
#
## Vim
#echo "Installing Vim"
#sudo apt-get -y install vim
#
## Screen
#echo "Installing Screen"
#sudo apt-get -y install screen
#
## Install Git
#echo "Installing Git"
#sudo apt-get -y install git

# Install Java
#echo "Installing Java"
#sudo add-apt-repository -y ppa:webupd8team/java
#sudo apt-get -y install oracle-java8-installer

# Install Leiningen
#echo "Installing Leiningen"
#sudo wget -O /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
#sudo chmod 755 /usr/local/bin/lein

# Install Metasploit Dependencies
#echo "Installing Metasploit dependencies and useful good stuff"
#sudo apt-get -y install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev pkg-config

# Install Ruby
#sudo apt-get -y install gnupg2
#sudo curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
#curl -L https://get.rvm.io | bash -s stable
#source /home/$USER/.rvm/scripts/rvm
#echo "source /home/$USER/.rvm/scripts/rvm" >> ~/.bashrc
source /home/$USER/.bashrc
#RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
#rvm install $RUBYVERSION
#rvm use $RUBYVERSION --default
#ruby -v

# Install Metasploit
#echo "Installing Metasploit"
#sudo git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit-framework
#sudo chown -R $USER /opt/metasploit-framework
#cd /opt/metasploit-framework
#rvm --default use ruby-${RUBYVERSION}@metasploit-framework
#gem install bundler
#bundle install
#sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'
#mv /opt/metasploit-framework/config/database.yml.example /opt/metasploit-framework/config/database.yml

# Install NMap
#echo "Installing NMap"
#sudo apt-get -y install nmap

# Install Python Stuff
#echo "Installing python stuff"
#sudo apt-get -y install python-pip python-dev build-essential
#sudo -u $USER -H sh -c "pip install --upgrade pip"

# Install Wine
#echo "Installing Wine"
#sudo apt-get -y install wine

# Install Veil
#echo "Installing Veil Evasion"
#git clone https://github.com/Veil-Framework/Veil-Evasion.git /home/$USER/Veil-Evasion
#/home/$USER/Veil-Evasion/setup/setup.sh -c

# Install Empire
#echo "Installing Empire"
#git clone https://github.com/EmpireProject/Empire.git /home/$USER/Empire
#/home/$USER/Empire/setup/install.sh

# Install Burp
#echo "Installing Burp"
#wget -O /home/$USER/Burp "https://portswigger.net/burp/releases/download?product=free&version=1.7.27&type=linux"
#chown -x Burp
#/home/$USER/Burp

# Install Sqlmap
#echo "Installing SQLMap"
#sudo apt-get -y install sqlmap

# Install DNSRecon
#echo "Installing DNSRecon"
#sudo apt-get install -y libavahi-compat-libdnssd1 git-core
#sudo apt-get install -y python-setuptools
#sudo easy_install netaddr
#sudo easy_install dnspython
#git clone git://github.com/darkoperator/dnsrecon.git /home/$USER/dnsrecon

# Install TheHarvester
#echo "Installing TheHarvester"
#sudo pip install requests
#git clone https://github.com/laramies/theHarvester.git /home/$USER/theharvester

# Install Bundler
#echo "Installing Bundler"
#gem install bundler

# Install WPScan
#echo "Installing WPScan"
#git clone https://github.com/wpscanteam/wpscan.git /home/$USER/wpscan

# Install Dirbuster
#echo "Installing Dirbuster"
#git clone git://git.kali.org/packages/dirbuster.git /home/$USER/dirbuster

# Install Wordlists
#echo "Installin the Wordlists"
#git clone git://git.kali.org/packages/wordlists.git /home/$USER/wordlists

# Install Recon-Ng
#echo "Installing Recon-Ng"
#git clone https://LaNMaSteR53@bitbucket.org/LaNMaSteR53/recon-ng.git /home/$USER/recon-ng
#sudo pip install -r /home/$USER/recon-ng/REQUIREMENTS

# Setup Postgres
#echo "Setting up Postgres"
#sudo -u postgres createuser msf -P -S -R -D
#sudo -u postgres createdb -O msf msf

# INstall Nginx
#echo "Installing Nginx"
#sudo apt-get install -y nginx

# Install PowerSploit
#echo "Installing PowerSploit"
#git clone https://github.com/PowerShellMafia/PowerSploit.git /home/$USER/PowerSploit

# Install 7-zip
#echo "Installing 7-zip"
#sudo apt-get install p7zip-full

# Install Hashcat
#echo "Installing HashCat"
#wget -O /home/$USER/hashcat.7z https://hashcat.net/files/hashcat-4.0.1.7z
#7z x hashcat.7z

# Install KaliLinux Webshells
#echo "Install Kali Linux Webshells"
#git clone git://git.kali.org/packages/webshells.git /home/$USER/webshells

# Install THC-Hydra
#echo "Installing THC Hydra"
#git clone https://github.com/vanhauser-thc/thc-hydra.git /home/$USER/thc-hydra
#sudo apt install -y git build-essential libssl-dev libssh-dev libidn11-dev libpcre3-dev libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev firebird-dev libncurses5-dev
#cd /home/$USER/thc-hydra
#./configure
#make
#cd /home/$USER

# Install Creddump
#echo "Installing Creddump"
#git clone git://git.kali.org/packages/creddump.git /home/$USER/creddump

# Install Owasp Zap
#echo "Installing Owasp Zap"
#git clone git://git.kali.org/packages/zaproxy.git /home/$USER/owaspzap

# Install DIRB
#echo "Installing DIRB"
#git clone git://git.kali.org/packages/dirb.git /home/$USER/dirb
