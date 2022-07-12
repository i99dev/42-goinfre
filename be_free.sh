#!/bin/bash
# remove Caches foloder from /Library/Caches
rm -rf ~/Library/Caches
# create Caches folder in /goinfre/Caches
mkdir -p ~/goinfre/Caches
# create ln to Caches folder in /Library/Caches
ln -s ~/goinfre/Caches ~/Library/Caches

# download latest version of vscode 
curl -L https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal -o /tmp/vscode.zip

# unzip vscode
unzip /tmp/vscode.zip -d /tmp/vscode

# move vscode to ~/goinfre/
mv /tmp/vscode/Visual\ Studio\ Code.app /goinfre/Visual\ Studio\ Code.app

# remove vscode.zip
rm /tmp/vscode.zip

# makealias for vscode
ln -s ~/goinfre/Visual\ Studio\ Code.app ~/Desktop/Visual\ Studio\ Code.app

# download latest version of Chrome
curl -L https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o /tmp/googlechrome.dmg
# mount Chrome dmg
hdiutil attach /tmp/googlechrome.dmg
# copy Chrome to /goinfre/
cp -R /Volumes/Google\ Chrome/Google\ Chrome.app ~/goinfre/
# unmount Chrome dmg
hdiutil detach /Volumes/Google\ Chrome
# makealias for Chrome to desktop
ln -s ~/goinfre/Google\ Chrome.app ~/Desktop/Google\ Chrome.app

# rm Downloads 
rm -rf ~/Downloads
# create Downloads folder in /goinfre/Downloads
mkdir -p ~/goinfre/Downloads
# create ln to Downloads folder in ~/Downloads
ln -s ~/goinfre/Downloads ~/Downloads

# check space 
df -h

# echo is done with green color
echo -e "\e[32mDone!\e[0m" # -e is used to escape the special characters