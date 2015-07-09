# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/git-completion.sh

###############################
############ Export ###########
###############################
export C1="\[\033[0;30m\]" # Black 
export C2="\[\033[1;30m\]" # Dark Gray 
export C3="\[\033[0;31m\]" # Red 
export C4="\[\033[1;31m\]" # Light Red 
export C5="\[\033[0;32m\]" # Green 
export C6="\[\033[1;32m\]" # Light Green 
export C7="\[\033[0;33m\]" # Brown 
export C8="\[\033[1;33m\]" # Yellow 
export C9="\[\033[0;34m\]" # Blue 
export C10="\[\033[1;34m\]" # Light Blue 
export C11="\[\033[0;35m\]" # Purple 
export C12="\[\033[1;35m\]" # Light Purple 
export C13="\[\033[0;36m\]" # Cyan 
export C14="\[\033[1;36m\]" # Light 
export C15="\[\033[0;37m\]" # Light Gray 
export C16="\[\033[1;37m\]" # White 
export P="\[\033[0m\]" # Neutral 
export PROMPT_COLOR=$C4
export PS1=$PROMPT_COLOR'\u@\h:'$C9'$(__git_ps1 "(%s):")'$C12'\w\n'$P'\$ '
export EDITOR=vim
export PATH=:$HOME/bin/:$HOME/.local/bin:/usr/local/opt/ruby/bin:/usr/local/bin:$HOME/Development/adt-bundle-mac-x86_64-20130522/sdk/tools:$PATH
export PATH=$PATH:$HOME/Development/play
export PATH=$PATH:/usr/local/share/python:/usr/local/appscale-tools/bin
export PYTHONPATH=$PYTHONPATH:$HOME/code/pse-tools:$HOME/code/janrain-python-api
export LS_COLORS=""

##############################
############ Alias ###########
##############################

alias forwardc3='ssh c3prod -NL 8080:localhost:8080'
alias forwardc3dev='ssh c3dev -NL 8080:localhost:8080'

#alias ls='ls --color=always'
alias ls='ls -G'
alias ll='ls -al'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias view='vim -R'
alias vi='vim'
alias gv='mvim'

alias xcode-select-5='sudo xcode-select -switch /Applications/Xcode5-DP6.app/Contents/Developer'
alias xcode-select-4='sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer'

#############################
############ Misc ###########
#############################

##############
# Scala
#
#==> Caveats
#To use with IntelliJ, set the Scala home to:
#  /usr/local/opt/scala/idea
#
#Bash completion has been installed to:
#  /usr/local/etc/bash_completion.d

umask 002

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
