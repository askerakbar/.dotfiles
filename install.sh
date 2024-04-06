#!/bin/bash

#courtesy : https://github.com/jessarcher/dotfiles
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSH_CUSTOM_PATH=~/.oh-my-zsh/custom

# Zsh
if [ -f ~/.zshrc ]; then
cp $HOME/.zshrc $HOME/.zshrc_backup_
fi

ln -sf $DOTFILES/.zshrc $HOME/.zshrc

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; 
then
    KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ "$(uname)" == "Linux" ]]; then
    if ! command -v brew >/dev/null 2>&1 
    then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi


if [ ! -d "$ZSH_CUSTOM_PATH/plugins/zsh-syntax-highlighting" ]; 
then
    #refer https://github.com/ohmyzsh/ohmyzsh/issues/7688#issuecomment-476947050
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi


#modern replacement for ‘ls’.
#https://github.com/ogham/exa
if ! command -v exa >/dev/null 2>&1 
then
    brew install exa
fi


if ! command -v neofetch >/dev/null 2>&1 
then
    brew install neofetch
fi
