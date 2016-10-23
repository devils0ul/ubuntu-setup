#!/usr/bin/env bash
BASH_PATH=~/.bashrc;

#is ubuntu
is_ubuntu=0
apt-get -v &> /dev/null && is_ubuntu=1
if [ $is_ubuntu == "1" ]; then
  echo "Ubuntu Environment...";
  curl -so- https://raw.githubusercontent.com/synle/ubuntu-setup/master/install.ubuntu.aptget.sh | bash -
fi
if [ "$(uname)" == "Darwin" ]; then
  BASH_PATH=~/.bash_profile;
  
  echo "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  echo "Brew install stuffs"
  brew install jq fzf;
fi


#source the bash profile
echo "Setting up in bash folder: $BASH_PATH"
echo '#syle bash' >> $BASH_PATH;
echo '. ~/.bash_syle' >> $BASH_PATH;

echo "Install nvm@v0.32.0"
curl -so- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash -

echo "Re-source Bash Profile for nvm binary"
. ${BASH_PATH}

echo "Install nvm, node. npm and stuffs"
curl -so- https://raw.githubusercontent.com/synle/ubuntu-setup/master/install.nvm.node.sh | bash -


echo "refresh"
curl -H 'Cache-Control: no-cache' -so- https://raw.githubusercontent.com/synle/ubuntu-setup/master/makeBashRefresh.sh | bash -

