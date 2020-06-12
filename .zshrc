alias ts="$HOME/dotfiles/scripts/ts.sh"
alias chm="chmod +x"
alias ycli="python3 $HOME/Code/ycli/search_youtube.py"
alias gc="git checkout"
#Initial setup
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.local/opt/flutter/bin"
export PATH="$PATH:$HOME/.local/opt/bin"
export PATH="$PATH:/usr/lib/dart/bin"
export PATH="$PATH:$HOME/.local/opt/miniconda3/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/opt/node-v12.16.3-linux-x64/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export PATH="$PATH:/var/lib/flatpak/exports/bin"
alias fl="flutter doctor --android-licenses"
#Make vim default text editor
export VISUAL=vim
export EDITOR="$VISUAL"
stty stop undef #Disable Ctrl-s from freezing terminal
#PS1 copied from https://github.com/LukeSmithxyz/voidrice/blob/master/.config/zsh/.zshrc
#More on zsh prompt: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%1d%{$fg[red]%}]%{$reset_color%}$%b "
ZSH_THEME="minimal"

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
alias vi3="vim ~/dotfiles/i3/config"
alias va="vim ~/.alacritty.yml"
alias vad="vim ~/.config/alacritty/default.yml"
alias vb="vim ~/.config/polybar/config"
alias vx="vim ~/.Xresources"
alias vv="vim .config/nvim/init.vim"
alias vp="vim ~/dotfiles/nvim/vimplug.vim"
alias vz="vim ~/.zshrc"
alias vt="vim ~/.tmux.conf"
alias vc="vim ~/dotfiles/nvim/cocConf.vim"
alias vcs="vim ~/dotfiles/nvim/coc-settings.json"
alias vcp="vim ~/Code/cpp"

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
alias opt="cd ~/.local/opt"
alias de="cd ~/Development"
alias g="cd ~/dev/github"
alias script="cd ~/dotfiles/scripts"
alias ig="cd ~/Github/igaurab"
alias theredcap="cd ~/Github/theredcap"
alias phrasenode="cd ~/Github/other/phrasenode"
alias reach="cd ~/Github/igaurab/reachable"
alias areach="conda activate reach"
alias doc="cd ~/Documents"
alias dow="cd ~/Downloads"
#Conda alias
alias nlp="conda activate nlp"
alias base="conda activate base"
alias note="jupyter notebook"
# Scripts
alias create="~/dotfiles/scripts/animjs.sh"
alias new="~/dotfiles/scripts/newcpp.sh"
alias songs="~/dotfiles/scripts/songs.sh"
alias mnt="~/dotfiles/scripts/automount.sh"
alias umnt="sudo umount /dev/sdb1"
#Other
alias hackvpn="sudo openvpn ~/.local/opt/theredcap.ovpn"
alias vpn="sudo protonvpn c -f"
alias c="calcurse"
alias lg="sudo pkill -u $USER"
alias i="sudo apt-get install"
alias uu="sudo apt-get update && sudo apt-get upgrade"
alias x="xdg-open"
#Ruby Install
export GEM_HOME="$HOME/gems"
export PATH="$PATH:$HOME/gems/bin"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FZF_DEFAULT_COMMAND='fd'
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=white
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white
alias reach="cd ~/Development/reachable"
alias phrase="cd ~/Code/phrasenode"
alias j="playx"
alias jk="playx -n"
alias p="sudo protonvpn"
alias i="sudo apt-get install"
alias wu="apt list --upgradable"
alias u="sudo apt update"
alias rmd="rm -fr" #Remove directories
alias cpd="cp -r" #copy directories
#source /home/igaurab/.config/broot/launcher/bash/br
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/theredcap/.local/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/theredcap/.local/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/theredcap/.local/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/theredcap/.local/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
base
# _   _                       _                   
#| |_| |__   ___ _ __ ___  __| | ___ __ _ _ __  
#| __| '_ \ / _ \ '__/ _ \/ _` |/ __/ _` | '_ \    Website: gaurabpanthee.com.np
#| |_| | | |  __/ | |  __/ (_| | (_| (_| | |_) |   Email:   gaurabpanthee@gmail.com
# \__|_| |_|\___|_|  \___|\__,_|\___\__,_| .__/    Twitter: @igaurab
#                                        |_|    
#                                       

