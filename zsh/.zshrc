# ------------------------------------------------------------------------------
# Oh-my-zsh Setup/Config
# ------------------------------------------------------------------------------

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme (~/.oh-my-zsh/themes/)
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git git-flow osx pip vagrant lein emoji-clock tmuxinator zsh-history-substring-search zsh-syntax-highlighting)

# Load all custom zshrc files (used to allow custom settings with boxen)
for zshrc_file ($HOME/.zshrc-*) source $zshrc_file

# enable ssh agent forwarding
zstyle :omz:plugins:ssh-agent agent-forwarding on

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------------------
# Post Oh-my-zsh Setup/Config
# ------------------------------------------------------------------------------

# allow massive renames - details: http://zshwiki.org/home/builtin/functions/zmv
autoload -U zmv

# turn off autocorrect
unsetopt correct_all

# vim is my prefered default editor
EDITOR="vim"

# set me up with mad colors
TERM=screen-256color

# ------------------------------------------------------------------------------
# Boxen
# ------------------------------------------------------------------------------

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# AppTrends VPM
alias apptrends_vpn="sudo openconnect --user=brandon --cafile=/Users/brandon/.ssh/apptrends_vpn.pem 74.116.1.122"

# Flush DNS
alias flushdns='sudo killall -HUP mDNSResponder'

# Massive renaming. Examples:
#   mmv *.dat *.dat_old
#   mmv foo.* bar.*
alias mmv='noglob zmv -W'

# SSH - dis.able.cd
alias aka='ssh aka@dis.able.cd'
# SSH - LOT204
alias l204='ssh root@74.116.0.10'
alias laka='ssh aka@74.116.0.10'
# SSH - LaundryLocal
alias lllinode='ssh yadoop@72.14.182.238'
# SSH - TuneLinks
alias tunelinks='ssh root@173.230.129.159'

# Tmux
alias tmux="TERM=screen-256color-bce tmux"

# tmuxinator
alias mux="EDITOR=vim mux"
alias tmuxinator="EDITOR=vim tmuxinator"

# Vagrant
alias vhalt='vagrant halt'
alias vprovision='vagrant provision'
alias vssh='vagrant ssh'
alias vstatus='vagrant status'
alias vsuspend='vagrant suspend'
alias vup='vagrant up'
