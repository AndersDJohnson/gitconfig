#!/usr/bin/env bash

ABS=$($READLINK -f $0)
BASE=$(dirname $ABS)

# $1 = filename
template() {
  echo "$(eval "echo \"$(cat "$1")\"")"
}

## variables

GITHUB_USER="AndersDJohnson"
GIT_NAME="Anders D. Johnson"
read -p "Git email: " GIT_EMAIL
read -p "GitHub token: " GITHUB_TOKEN
read -p "GitHub password: " GITHUB_PASSWORD

## run

cd "$BASE"

ln -sf gitconfig ~/.gitconfig
template "gitconfig-github" > ~/.gitconfig-github
template "gitconfig-user" > ~/.gitconfig-user
