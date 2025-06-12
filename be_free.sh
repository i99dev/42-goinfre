#!/bin/bash

set -e

# Colors
green="\e[32m"
red="\e[31m"
reset="\e[0m"

# Default options
install_vscode=true
install_chrome=true
setup_caches=true
setup_downloads=true
show_df=true
lab_answer=""

usage() {
    cat <<USAGE
Usage: $0 [options]

Options:
  --no-vscode       Skip installing Visual Studio Code
  --no-chrome       Skip installing Google Chrome
  --no-caches       Skip linking the Caches folder
  --no-downloads    Skip linking the Downloads folder
  --no-df           Skip showing disk usage
  -y, --yes         Assume yes for the lab confirmation
  -h, --help        Show this help message
USAGE
}

# Parse options
while [[ $# -gt 0 ]]; do
    case "$1" in
        --no-vscode)
            install_vscode=false
            ;;
        --no-chrome)
            install_chrome=false
            ;;
        --no-caches)
            setup_caches=false
            ;;
        --no-downloads)
            setup_downloads=false
            ;;
        --no-df)
            show_df=false
            ;;
        -y|--yes)
            lab_answer="y"
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
    shift
done

if [ -z "$lab_answer" ]; then
    echo -e "${green}Are you in a 42 lab?${reset}"
    read -p "y/n: " -r lab_answer
fi

if [ "$lab_answer" != "y" ]; then
    echo -e "${red}Only for 42 lab!${reset}"
    exit 1
fi

# Link caches
if [ "$setup_caches" = true ]; then
    rm -rf ~/Library/Caches
    mkdir -p ~/goinfre/Caches
    ln -s ~/goinfre/Caches ~/Library/Caches
fi

# Install VS Code
if [ "$install_vscode" = true ]; then
    rm -rf ~/goinfre/Visual\ Studio\ Code.app
    curl -L https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal -o /tmp/vscode.zip
    unzip /tmp/vscode.zip -d ~/goinfre/
    ln -s ~/goinfre/Visual\ Studio\ Code.app ~/Desktop/Visual\ Studio\ Code.app
fi

# Install Chrome
if [ "$install_chrome" = true ]; then
    curl -L https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o /tmp/googlechrome.dmg
    hdiutil attach /tmp/googlechrome.dmg
    cp -R /Volumes/Google\ Chrome/Google\ Chrome.app ~/goinfre/
    hdiutil detach /Volumes/Google\ Chrome
    ln -s ~/goinfre/Google\ Chrome.app ~/Desktop/Google\ Chrome.app
fi

# Link Downloads
if [ "$setup_downloads" = true ]; then
    rm -rf ~/Downloads
    mkdir -p ~/goinfre/Downloads
    ln -s ~/goinfre/Downloads ~/Downloads
fi

# Show disk usage
if [ "$show_df" = true ]; then
    df -h
fi

echo -e "${green}Done!⚠️🚧${reset}"
