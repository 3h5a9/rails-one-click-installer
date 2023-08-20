#!/bin/bash
echo 'Hello World!'
echo '~~~~~~~~~~~~'
echo 'Welcome to the Ruby on Rails installation process 😀'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo 'Followings are the version of Ruby and Ruby on Rails'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo 'Ruby Version - latest'
echo 'Ruby on Rails Version - latest'
echo "Let's Start 🚀"
echo ''
echo ''
echo 'The first step is to install some dependencies for Ruby and Rails.'
echo "To make sure we have everything necessary for Webpacker support in Rails, we're first going to start by adding the Node.js and Yarn repositories to our system before installing them."
echo ''
echo ''

echo '---Lets Install CURL---'
echo '~~~~~~~~~~~~~~~~~~~~~~~'
sudo apt install curl
# curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -


echo ''
echo ''
echo '---Lets Install Node js---'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~'
sudo apt install nodejs


echo ''
echo ''
echo '---Lets Add Yarn Package Manager---'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
#curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
npm install --global yarn


echo ''
echo '---Process Completed---'
echo '~~~~~~~~~~~~~~~~~~~~~~~'
echo ''
echo '---Lets Update The System Now---'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
sudo apt update

echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo 'Lets Install the all necessary packages!'
echo '🚀🚀🚀'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

# sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn -y
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev


echo ''
echo 'Add Done. 😊😊😊'
echo ''

echo "Now we're going to be installing Ruby using RBENV methods. As most people prefer using rbenv these days."
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo "Installing with rbenv is a simple two step process. First you install rbenv, and then ruby-build: "
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo "One More Thing, I am using zshrc instead of bashrc, if you want you can edit this file and replace ~/.zshrc with ~/.bashrc"
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo ''
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo 'If you are using bashrc, please replace zshrc with bashrc'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

echo ''
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo 'If you are using bashrc, please replace zshrc with bashrc'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

#exec $SHELL
echo ""
echo ""


git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
#exec $SHELL

echo 'Installing RBENV'
echo -n "Please enter ruby version"
echo "you can check available ruby version from the following list"

rbenv install -l

echo "Please choose your prefered version"

read version

rbenv install $version

echo ''
echo '-----------------'
echo 'Make rbenv global'
echo '-----------------'
rbenv global $version

echo ''
echo '------------------'
echo 'Check Ruby Version'
echo '------------------'
ruby -v

echo ''
echo 'Hurray 🔥🔥🔥'
echo ''


echo '----------------'
echo 'Inalling Bundler'
echo '----------------'
echo ''

gem install bundler


echo ''
echo 'The last step is to install Bundler'
echo 'rbenv users need to run rbenv rehash after installing bundler.'

rbenv rehash

echo 'rbenv rehash done!'

echo ''

echo '---------------'
echo 'Configuring Git'
echo 'Replace my name and email address in the following steps with the ones you used for your Github account.'
echo '--------------------------------------------------------------------------------------------------------'
echo ''

git config --global color.ui true

echo "Please enter your github user name"
read githubusername
git config --global user.name $githubusername

echo "Please enter you github email address"
read  githubemail
git config --global user.email $githubemail

echo "Please enter your github email again"
read githubemail
ssh-keygen -t rsa -b 4096 -C githubemail


echo 'Successfully configure git 🔥🔥🔥 🐧🐧🐧'

echo ''

echo "The next step is to take the newly generated SSH key and add it to your Github account."
echo "You want to copy and paste the output of the following command and paste it to github settings. "
cat ~/.ssh/id_rsa.pub

echo "Let's check and see if it worked:"
ssh -T git@github.com

echo "You should get a message like this: "
echo "Hi excid3! You've successfully authenticated, but GitHub does not provide shell access."

echo ''

echo '-------------------'
echo "Let's Install Rails"
echo 'Please specify your rails version that you want to install'

read version

gem install rails -v $version

rbenv rehash

rails -v

echo ''
echo 'Hurray, Successfully Installed Rails 🔥🔥🔥 🐧🐧🐧'

echo ''

echo '.....................'
echo 'Setting Up A Database'
echo '.....................'
echo ''

echo '............................................................................................................................................................'
echo "Rails ships with sqlite3 as the default database. Chances are you won't want to use it because it's stored as a simple file on disk. You'll probably want something more robust like MySQL or PostgreSQL."
echo ''
echo '..................................................................................................................'
echo "There is a lot of documentation on both, so you can just pick one that seems like you'll be more comfortable with."
echo ''
echo '...................................................................................................'
echo "If you're new to Ruby on Rails or databases in general, I strongly recommend setting up PostgreSQL."
echo ''
echo '..................................................................'
echo "If you're coming from PHP, you may already be familiar with MySQL."
echo ''
echo '...........................................'
echo 'Install and Setup PostgreSQL latest version'
echo ''

# sudo apt-get install curl ca-certificates gnupg && curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
#sudo apt update && sudo apt-get install postgresql-12
sudo apt install postgresql libpq-dev

echo ''
echo 'Successfully install latest postgresql 👏👏👏'

echo ''

echo '------------------------------------'
# Please change user with your username 
echo "Please enter a username for postgres"
read username
sudo -u postgres createuser $username -s

echo ''
echo '..............................'
echo "Successfully add user username"
echo '..............................'
echo''

echo "Add Password"
echo ''
echo "using this postgresql command change nginit with your postgresql user '\password nginit'"
sudo -u postgres psql

echo ''
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo 'Congratulations password for username added successfully'
echo ''
echo ''
echo "Thank's to gorails.com"
echo ''
echo "Made with 💖 from Bangladesh 🇧🇩🇧🇩🇧🇩🇧🇩🇧🇩  By Sayed Mohammad Ehsan"
echo '💟💟💟💟💟💎💎💎💎💎💟💟💟💟💟'
