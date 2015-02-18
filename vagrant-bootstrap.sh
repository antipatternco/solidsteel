#!/usr/bin/env bash

# update system
echo "Installing updates..."
sudo apt-get update

# install node (-y flag confirms install)
echo "Installing node..."
sudo apt-get install nodejs -y

# install npm
echo "Installing npm..."
sudo apt-get install npm -y

# ubuntu/node/npm config
npm config set prefix ~/npm
echo 'export PATH="$PATH:$HOME/npm/bin"' >> ~/.bashrc
sudo ln -s /usr/bin/nodejs /usr/bin/node

# install ember-cli
echo "Installing ember-cli..."
npm install ember-cli -g

# start rvm install
echo "Installing rvm..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# install rvm
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# use rvm
source /home/vagrant/.rvm/scripts/rvm

# install qt for use with capybara
echo "Installing qt..."
sudo apt-get install libqtwebkit-dev -y

# install postgres
echo "Installing postgres..."
sudo apt-get install postgresql libpq-dev -y

echo "Configuring postgres..."
echo '# "local" is for Unix domain socket connections only
local   all             all                                  trust
# IPv4 local connections:
host    all             all             0.0.0.0/0            trust
# IPv6 local connections:
host    all             all             ::/0                 trust' | sudo tee /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf
sudo /etc/init.d/postgresql restart
sudo su - postgres -c 'createuser -s vagrant'

# change default ssh login location
echo 'cd ~/Development/MyApp' >> /home/vagrant/.bashrc

# bundle install
echo "bundle install..."
cd /home/vagrant/Development/MyApp
bundle install

echo "runnning app setup"
bin/setup

echo "All done installing!"