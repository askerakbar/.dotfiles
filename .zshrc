# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

# disable colors in ls.
DISABLE_LS_COLORS="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Uncomment if you want to move the command line to a new line always
OMZ_NEW_LINE_FORMAT=$'\n%{$fg_bold[green]%}➜ %{$reset_color%} '
PROMPT+=$OMZ_NEW_LINE_FORMAT

#Remove folder colors
LS_COLORS+=:ow=

if [[ "$(uname)" == "Linux" || "$(uname -a)" == *"Ubuntu"* ]]; then
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

#https://stackoverflow.com/a/34143401
exists()
{
	command -v "$1" >/dev/null 2>&1
}

if [ -f ~/.zshenv ]; then
	source ~/.zshenv
fi

#aliases 

alias gowww='cd /var/www/'
alias gosites="cd $HOME/Sites"
alias docart='./docart'

if exists exa; then
	alias ls='exa'
	alias lsi= 'exa --icons'
fi

if exists batcat; then
	alias bat='batcat'
fi

#just to be safe
alias rm='rm -i'
alias trash="gio trash"

# What's my IP finders!
alias ipflare="curl -s https://cloudflare.com/cdn-cgi/trace | bat"
alias ipinfo="curl https://ipinfo.io/json | bat"
alias myip="curl checkip.amazonaws.com"
alias ipl="hostname -I"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias glog="git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

alias reload="source ~/.zshrc"
alias monitor="/home/linuxbrew/.linuxbrew/bin/bandwhich"

#no idea why the paths are getting duplicated so just using this!
#https://superuser.com/questions/1333562/how-to-remove-duplicate-dirs-from-path
if [[ -x /usr/bin/awk ]]; then export PATH="$(echo "$PATH" | /usr/bin/awk 'BEGIN { RS=":"; } { sub(sprintf("%c$", 10), ""); if (A[$0]) {} else { A[$0]=1; printf(((NR==1) ?"" : ":") $0) }}')" ; fi


alias ggbu="~/.dotfiles/ggbu.sh"