#!/usr/bin/env bash

# This is heavily inspired by the amazing Michelle, Luke and Avi
# https://github.com/craychee/loki-init
# https://github.com/lukewertz/gabriel-init
# https://github.com/froboy/durandal-init

function pause() {
  read -p "$*"
}

CWD=($PWD)

cd ~

# We can't get them directly, but just click this button :)
xcode-select --install

pause 'Press [Enter] once you have installed XCode and XCode Command Line Tools.'

# Just make sure...
sudo xcodebuild -license accept

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Homebrew
brew install imagemagick
brew install ruby
brew install git
brew install wget
brew tap caskroom/cask

# Applications
# brew cask install lastpass

brew cask install firefox
brew cask install google-chrome
brew cask install opera

brew cask install google-drive-file-stream
brew cask install harvest
brew cask install kap
brew cask install alfred
brew cask install rescuetime

brew cask install zoomus
brew cask install slack
brew cask install zeplin



# Creative Applications
# brew cask install sketch
# brew cask install adobe-creative-cloud

# Other
# brew cask install transmit
# brew cask install the-unarchiver
# brew cask install screaming-frog-seo-spider
# brew cask install bartender

# ALL DEV ALL THE TIME FROM HERE DOWN
# Developer Applications
brew install wp-cli

# brew cask install phpstorm
# brew cask install atom
# brew cask install sublime-text

brew cask install iterm2
brew cask install virtualbox

# Node/NPM Tools
brew install node
brew install yarn
brew install npm
# Easy accessibility audits powered by the Chrome Accessibility Tools
npm install --global a11y
# The Grunt command line interface
npm install --global grunt-cli
# Grunt wrapper for criticalcss
npm install -g grunt-criticalcss
# Automates ImageOptim, ImageAlpha, and JPEGmini
npm install --global imageoptim-cli
# Lighthouse analyzes web apps and web pages, collecting modern performance metrics and insights on developer best practices
npm install --global lighthouse
# Pa11y is your automated accessibility testing pal. It runs HTML CodeSniffer from the command line for programmatic accessibility reporting
npm install --global prettier
# PageSpeed Insights with reporting
npm install --global psi
# Using sitespeed.io you can test your web site against Web Performance best practices
npm install --global sitespeed.io
# WebPageTest API Wrapper is a NPM package that wraps WebPageTest API for NodeJS
npm install --global webpagetest
# Gulp
npm install --global gulp-cli

# Ruby
gem install bundler

# Get Docksal and install it. You will have to allow Oracle's extension to run.
curl -fsSL get.docksal.io | bash

# Get composer and put it in the right place. This will require your password
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# I'm having issues; trying this approach.
sudo chown -R $USER $HOME/.composer

# Install Composer tools
# composer parallel install plugin
composer global require hirak/prestissimo
# Drupal Coder, PHP_CodeSniffer, and Drupal Coding Standards
composer global require drupal/coder
# Adds WordPress Coding Standards
composer global require wp-coding-standards/wpcs:dev-master
# Pantheon Terminus
composer global require pantheon-systems/terminus

# Add a fancy bash profile.
# This should get Terminus and phpcs up and running
# As well as add a lot of commands to make life easier.
# Courtesy of Jason Savino. Our Super Developer. 
cp _bash_profile.sh $USER $HOME/.bash_profile

# Sets Config for PHP_CodeSniffer
phpcs --config-set installed_paths $HOME/.composer/vendor/drupal/coder/coder_sniffer,$HOME/.composer/vendor/wp-coding-standards/wpcs


# IGNORE THESE
# Do the Mac thing that you have to do but you shouldn't have to do
# This https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
# curl -o ~/Library/LaunchAgents/ssh.add.a.plist https://raw.githubusercontent.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain/master/ssh.add.a.plist

# Hold my own hand to make sure I finish configuring
# echo "Add your ssh keys (you put them in your secret hiding place)."
# pause 'Press [Enter] when you have added your ssh key.'
# chmod 400 ~/.ssh/*

# Get git things
curl -o /usr/local/etc/bash_completion.d/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o /usr/local/etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# Make sure the admin group is set for Applications
# sudo chown -R root:admin /Applications/*
# Make sure all admins can write to Applications
# sudo chmod -R g+w /Applications/*
# Remove the quarantine flag for anything downloaded
# xattr -rd com.apple.quarantine /Applications/*.app

echo "Script finished."
