#!/usr/bin/env bash

ABS=$($READLINK -f $0)
BASE=$(dirname $ABS)

git submodule update --init

source ./template.sh/template.sh

## variables

GITHUB_USER="AndersDJohnson"
GIT_NAME="Anders D. Johnson"
GIT_EMAIL="${GITHUB_USER}@users.noreply.github.com"
read -p "Git email (default: $GIT_EMAIL): " _GIT_EMAIL
if [ ! -z $_GIT_EMAIL ]; then
	GIT_EMAIL=$_GIT_EMAIL
fi
echo "GIT_EMAIL=${GIT_EMAIL}"
read -p "GitHub token: " _GITHUB_TOKEN
if [ ! -z $_GITHUB_TOKEN ]; then
	GITHUB_TOKEN=$_GITHUB_TOKEN
fi
echo "GITHUB_TOKEN=${GITHUB_TOKEN}"
read -p "GitHub password: " _GITHUB_PASSWORD
if [ ! -z $_GITHUB_PASSWORD ]; then
	GITHUB_PASSWORD=$_GITHUB_PASSWORD
fi
echo "GITHUB_PASSWORD=${GITHUB_PASSWORD}"


## run

cd "$BASE"

ln -sf "$BASE/gitconfig" ~/.gitconfig
template gitconfig-github > .gitconfig-github
template gitconfig-user > .gitconfig-user
