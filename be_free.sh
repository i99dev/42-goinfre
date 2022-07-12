#!/bin/bash
# remove Caches foloder from /Library/Caches
rm -rf /Library/Caches
# create Caches folder in /goinfre/Caches
mkdir -p /goinfre/Caches
# create ln to Caches folder in /Library/Caches
ln -s /goinfre/Caches /Library/Caches

# download latest version of vscode from github
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o /tmp/vscode.dmg
# mount vscode dmg
hdiutil attach /tmp/vscode.dmg
# copy vscode to /goinfre/
cp -R /Volumes/Visual\ Studio\ Code/Visual\ Studio\ Code.app /goinfre/
# unmount vscode dmg
hdiutil detach /Volumes/Visual\ Studio\ Code
# makealias for vscode to desktop
ln -s /goinfre/Visual\ Studio\ Code.app /Applications/Visual\ Studio\ Code.app

# download latest version of Chrome
curl -L https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o /tmp/googlechrome.dmg
# mount Chrome dmg
hdiutil attach /tmp/googlechrome.dmg
# copy Chrome to /goinfre/
cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /goinfre/
# unmount Chrome dmg
hdiutil detach /Volumes/Google\ Chrome
# makealias for Chrome to desktop
ln -s /goinfre/Google\ Chrome.app /Applications/Google\ Chrome.app

# rm Downloads 
rm -rf ~/Downloads
# create Downloads folder in /goinfre/Downloads
mkdir -p /goinfre/Downloads
# create ln to Downloads folder in ~/Downloads
ln -s /goinfre/Downloads ~/Downloads

# check space 
df -h

# ask if want countinue to install valgrind
echo "Do you want to install Valgrind? (y/n)"
read -r answer
if [ "$answer" == "y" ]; then
    # download latest version of valgrind from github
    curl -L https://valgrind.org/downloads/valgrind-3.13.0.tar.bz2 -o /tmp/valgrind.tar.bz2
    # extract valgrind
    tar -xjf /tmp/valgrind.tar.bz2 -C /tmp
    # copy valgrind to /goinfre/
    cp -R /tmp/valgrind-3.13.0 /goinfre/
    # makealias for valgrind to desktop
    ln -s /goinfre/valgrind-3.13.0 /Applications/valgrind.app
fi
# say that you are done
echo "You are done!"