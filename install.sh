#!/usr/bin/env bash

### Get privileges
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


### Get homebrew
if !(hash brew 2> /dev/null)
then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew doctor
  brew update
  brew upgrade
fi


### Get salt
if !(hash salt-call 2> /dev/null)
then
  brew install saltstack
fi


### Setup masterless salt
if [ -a /etc/salt/minion ]
then
  sudo mv /etc/salt/minion /etc/salt/minion.bak
else
  sudo mkdir /etc/salt
fi  
echo -e "file_client: local\nfile_roots:\n  base:\n    - $HOME/.salty-dot\npillar_roots:\n  base:\n    - $HOME/.salty-dot/pillar" | sudo tee -a /etc/salt/minion >/dev/null


### Clone + run salt configs
if [ -a $HOME/.salty-dot/top.sls ]
then
  cd $HOME/.salty-dot
  git pull
else
  git clone https://github.com/nicocoffo/salty-dot.git $HOME/.salty-dot
fi
sudo salt-call --local state.highstate


### Clean up
if [ -a /etc/salt/minion.bak ]
then 
  sudo mv /etc/salt/minion.bak /etc/salt/minion
else
  sudo rm /etc/salt/minion
fi
brew cleanup
