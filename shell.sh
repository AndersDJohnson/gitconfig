# https://www.gitignore.io/docs

function gi() {
  curl -L -s https://www.gitignore.io/api/$@ ;
}


git help -a | grep credential-osxkeychain &> /dev/null
if [ $? -eq 0 ]; then
  git config --file gitconfig-dynamic credential.helper osxkeychain
else
  git config --file gitconfig-dynamic credential-helper cache
fi

