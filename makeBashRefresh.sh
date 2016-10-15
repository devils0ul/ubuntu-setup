#!/usr/bin/env bash
echo "make bash local"
  #empty the file
  BASH_SYLE=~/.bash_syle
  TEMP_BASH_SYLE=/tmp/.bash_syle
  
echo 'Setting up in ' + $TEMP_BASH_SYLE
  # bash header
  echo "#!/bin/bash" >> $TEMP_BASH_SYLE

  #completion
  curl -so- -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash >> $TEMP_BASH_SYLE
  curl -so- -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/gruntjs/grunt-cli/master/completion/bash >> $TEMP_BASH_SYLE
  curl -so- -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/gulpjs/gulp/master/completion/bash >> $TEMP_BASH_SYLE
  eval "$(grunt --completion=bash)" >> $TEMP_BASH_SYLE

  #alias
  curl -so- -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/synle/ubuntu-setup/master/bash-alias-cmd.sh >> $TEMP_BASH_SYLE

  #specific to mac
  if [ "$(uname)" == "Darwin" ]; then
    echo "Install Mac specific alias"
    curl -so- -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/synle/ubuntu-setup/master/bash-alias-gui.sh >> $TEMP_BASH_SYLE
  fi


  #prompt
  curl -so- -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/synle/ubuntu-setup/master/bash-prompt.sh >> $TEMP_BASH_SYLE
  
  
  
  #misc
  #eslint config
  curl -so-  https://raw.githubusercontent.com/synle/ubuntu-setup/master/.eslintrc > ~/.eslintrc

#copy it over
mv $TEMP_BASH_SYLE $BASH_SYLE



#special set up for mac
if [ "$(uname)" == "Darwin" ]; then
  #TODO: null check
  ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl;
  chmod +x /usr/local/bin/subl;
fi


#extra stuffs
#vim stuffs
echo "Set up vim"
curl -so- https://raw.githubusercontent.com/synle/ubuntu-setup/master/vim/.vimrc > ~/.vimrc;
vim +BundleInstall +qall;



#awesome git commands
#config
git config --global user.name "Sy Le"
git config --global core.autocrlf input
git config --global core.editor vim
git config --global push.default simple
git config --global merge.tool vimdiff
git config --global diff.tool vimdiff

#git alias
git config --global alias.del-merged-branches "!git branch --merged | grep -v '*' | xargs git branch -d"
git config --global alias.unstage 'reset HEAD --'
git config --global alias.co 'checkout'
git config --global alias.coo 'checkout --orphan' # new branch no history
git config --global alias.cp 'cherry-pick'
git config --global alias.cm 'commit'
git config --global alias.del 'branch -D'
git config --global alias.br 'branch -v'
git config --global alias.b 'branch'
git config --global alias.branch 'branch -a'
git config --global alias.p 'push'
git config --global alias.logs 'log --oneline --decorate'
git config --global alias.fap 'fetch --all --prune'
git config --global alias.st 'status -sb'
git config --global alias.s 'status -sb'
git config --global alias.amend 'commit --amend'
git config --global alias.nuke '!git reset --hard && git clean -dfx && git gc && git prune'
git config --global alias.push-force 'push --force-with-lease'
git config --global alias.commend 'commit --amend --no-edit'
git config --global alias.it '!git init && git commit -m “root” --allow-empty'
git config --global alias.stash 'stash --all'
#end git



#rerun the source
. $BASH_SYLE
