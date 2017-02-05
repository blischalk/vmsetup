#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters"
  echo "Usage: ./vmsetup.sh <user>"
  exit 1
fi

USER=$1

# Install Git
echo "Installing Git"
sudo apt-get install git

# Install Java
echo "Installing Java"
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y install oracle-java8-installer

# Install Haskell
echo "Installing Haskell"
sudo apt-get -y install haskell-platform
sudo curl -sSL https://get.haskellstack.org/ | sh

# Install Boot
echo "Installing Boot"
bash -c "cd /usr/local/bin && curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh && chmod 755 boot"

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
git clone https://github.com/rapid7/metasploit-framework.git
chown -R $USER /opt/metasploit-framework
cd metasploit-framework
rvm --default use ruby-${RUByVERSION}@metasploit-framework
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

# Install emacs
echo "Installing emacs"
sudo apt-get -y install emacs

# Install SSH
echo "Installing ssh"
sudo apt-get -y install openssh-server
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
sudo sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g' /etc/ssh/sshd_config

# Install library for dot conversion
echo "Installing graphviz"
sudo apt-get -y install graphviz

# Install libemu
sudo apt-get -y install libemu-dev

# Install Python Stuff
echo "Installing python stuff"
sudo apt-get -y install python-pip python-dev build-essential
sudo -u $USER -H sh -c "\
pip install --upgrade pip \
pip install --upgrade virtualenv \
pip install pylibemu"
sudo echo /opt/libemu/lib > /etc/ld.so.conf.d/pylibemu.conf

# Clone Dotfiles
echo "Cloning dotfiles stuff"
cd /home/$USER/
git clone https://github.com/blischalk/dotfiles.git
cat /home/$USER/dotfiles/.bash_profile >> /home/$USER/dotfiles/.bashrc
mv /home/$USER/dotfiles/gitconfig /home/$USER/dotfiles/.gitconfig

# Clone emacs
echo "Cloning emacs stuff"
git clone https://github.com/blischalk/my-emacs.git
mv .emacs.d .emacs.d.bkup
mv my-emacs .emacs.d
