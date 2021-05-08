#Make vim default text editor
export VISUAL=vim
export EDITOR="$VISUAL"
stty stop undef #Disable Ctrl-s from freezing terminal

#PS1 copied from https://github.com/LukeSmithxyz/voidrice/blob/master/.config/zsh/.zshrc
#More on zsh prompt: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%1d%{$fg[red]%}]%{$reset_color%}$%b "

ZSH_THEME="minimal"

# Change cursor shape for different vi modes.
bindkey -v
export KEYTIMEOUT=1
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

plugins=(
	zsh-syntax-highlighting
	)

source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

#-----------------------------
#Aliases
#-----------------------------
alias refresh="source ~/.zshrc"
alias clean="sudo apt autoremove"
alias r="sudo apt remove"
alias rlibgesture="libinput-gestures-setup restart"

#Open files in vim Starts with v
alias v="vim"
alias vi3="vim ~/dotfiles/config/i3/config"
alias va="vim ~/dotfiles/config/alacritty/alacritty.yml"
alias vb="vim ~/.config/polybar/config"
alias vx="vim ~/.Xresources"
alias vv="vim ~/dotfiles/config/nvim/init.vim"
alias vp="vim ~/dotfiles/config/nvim/vimplug.vim"
alias vz="vim ~/.zshrc"
alias vt="vim ~/.tmux.conf"
alias vc="vim ~/dotfiles/.config/nvim/cocConf.vim"
alias vcs="vim ~/dotfiles/.config/nvim/coc-settings.json"

#TMUX
alias t="tmux"
alias ta="tmux attach-session"
alias tr="tmux source-file ~/.tmux.conf"
#Programs
alias ls="exa"
alias ll="ls -lh"
alias la="ls -lah"
alias q="exit"
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
#Dir
alias nvimd="cd ~/dotfiles/nvim"
alias wallpaper="cd ~/dotfiles/wallpaper"
alias script="cd ~/dotfiles/scripts"
alias reach="cd ~/Github/reachable"
alias doc="cd ~/Documents"
alias dow="cd ~/Downloads"
#Conda alias
alias nlp="conda activate nlp"
alias base="conda activate base"
alias note="jupyter notebook"

#Other
alias vpn="protonvpn-cli"
alias c="calcurse"
alias logout="sudo pkill -u $USER"
alias i="sudo apt-get install"
alias uu="sudo apt-get update && sudo apt-get upgrade"
alias open="xdg-open"

#Switch back and forth between zsh and vim
#https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
     BUFFER="fg"
     zle accept-line
  else
     zle push-input
     zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

export FZF_DEFAULT_COMMAND='fd'
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=white
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white

alias rmd="rm -fr" #Remove directories
alias cpd="cp -r" #copy directories

# _   _                       _                   
#| |_| |__   ___ _ __ ___  __| | ___ __ _ _ __  
#| __| '_ \ / _ \ '__/ _ \/ _` |/ __/ _` | '_ \    Website: gaurabpanthee.com.np
#| |_| | | |  __/ | |  __/ (_| | (_| (_| | |_) |   Email:   gaurabpanthee@gmail.com
# \__|_| |_|\___|_|  \___|\__,_|\___\__,_| .__/    Twitter: @igaurab
#                                        |_|    
#                                       

