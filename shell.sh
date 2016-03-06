# https://www.gitignore.io/docs

function gi() {
  curl -L -s https://www.gitignore.io/api/$@ ;
}


git help -a | grep credential-osxkeychain &> /dev/null
if [ $? -eq 0 ]; then
  git config --file ~/.gitconfig-dir/.gitconfig-dynamic credential.helper osxkeychain
else
  git config --file ~/.gitconfig-dir/.gitconfig-dynamic credential-helper cache
fi

## http://twobitlabs.com/2011/08/install-diffmerge-git-mac-os-x/
# if [ -x "$(command -v diffmerge)" ]; then
#   git config diff.tool diffmerge
#   git config difftool.diffmerge.cmd 'diffmerge "$LOCAL" "$REMOTE"'
#   git config merge.tool diffmerge
#   git config mergetool.diffmerge.cmd 'diffmerge --merge --result="$MERGED" "$LOCAL" "$(if test -f "$BASE"; then echo "$BASE"; else echo "$LOCAL"; fi)" "$REMOTE"'
#   git config mergetool.diffmerge.trustExitCode true
#   git config difftool.prompt false
# fi

# https://github.com/sharat/technicaltips/blob/master/how-to-setup-kdiff-with-git-os-x.md
if [ -x "$(command -v diffmerge)" ]; then
  git config diff.tool kdiff3
  git config difftool.kdiff3.trustExitCode true
  git config difftool.prompt false
  git config merge.tool kdiff3
  git config mergetool.kdiff3.trustExitCode true
  git config mergetool.prompt false
  git config mergetool.keepBackup true
fi
