#!/bin/bash

green="\e[32m"
red="\e[31m"
reset="\e[0m"

# ask if user at 42 lab if yes continue, if no exit
echo -e "${green}Are you in 42 lab?${reset}"
read -p "y/n: " answer
if [ "$answer" == "y" ]; then
    rm -rf ~/Library/Caches
    mkdir -p ~/goinfre/Caches
    ln -s ~/goinfre/Caches ~/Library/Caches
    curl -L https://code.visualstudio.com/sha/download\?build\=stable\&os\=darwin-universal -o /tmp/vscode.zip && unzip /tmp/vscode.zip -d ~/goinfre/
    ln -s ~/goinfre/Visual\ Studio\ Code.app /Desktop/Visual\ Studio\ Code.app
    curl -L https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o /tmp/googlechrome.dmg
    hdiutil attach /tmp/googlechrome.dmg
    cp -R /Volumes/Google\ Chrome/Google\ Chrome.app ~/goinfre/
    hdiutil detach /Volumes/Google\ Chrome
    ln -s ~/goinfre/Google\ Chrome.app ~/Desktop/Google\ Chrome.app
    rm -rf ~/Downloads
    mkdir -p ~/goinfre/Downloads
    ln -s ~/goinfre/Downloads ~/Downloads

    df -h

    echo -e "${green}Done!⚠️🚧${reset}"
else
    echo -e "${red}Only for 42 lab!${reset}"
    exit 1
fi
