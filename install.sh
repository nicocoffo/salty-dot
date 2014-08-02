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

### Clone + run salt configs
SALTY=$HOME/.salty-dot
if [ -a $HOME/.salty-dot/top.sls ]
then
  cd $SALTY  
  if ! git status --porcelain | grep -v '??' >/dev/null
  then
    git pull
  fi
else
  git clone https://github.com/nicocoffo/salty-dot.git $SALTY
fi
sudo salt-call --local --file-root $SALTY --pillar-root $SALTY/pillar state.highstate

### Clean up
brew cleanup
