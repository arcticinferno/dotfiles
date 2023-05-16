
source <(/usr/bin/starship init zsh --print-full-init)
alias vi='nvim'

FUNCNEST=1000
SAVEHIST=10000000
HISTSIZE=10000000
HISTFILE=~/.bash_history

source ~/dev/deer/deer.zsh
deerplug hlissner/zsh-autopair
deerplug zsh-users/zsh-autosuggestions
deerplug zsh-users/zsh-syntax-highlighting
deerplug zap-zsh/fzf
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word


alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'

cd ~/desktop/trash/

export PATH=$PATH:~/.local/bin
[ -f "/home/$USER/.ghcup/env" ] && source "/home/$USER/.ghcup/env" # ghcup-env
export PATH=$PATH:~/.cabal/bin


update_cabal_version() {
  local current_dir=$(pwd)
  local cabal_file="$current_dir/$(basename $current_dir).cabal"

  # Check if the cabal file exists
  if [[ ! -f $cabal_file ]]; then
    echo "Error: Cabal file '$cabal_file' not found"
    return 1
  fi

  # Echo the existing version number
  local current_version=$(awk '/^version:/ {print $2}' "$cabal_file")
  echo "Current version number is $current_version"

  # Read the new version number from the user
  local new_version=""
  read "new_version?Enter new version number: "

  # Replace the version number in the cabal file
  sed -i "s/^version:.*/version: $new_version/" "$cabal_file"
  echo "Updated version number to $new_version in $cabal_file"
  git add "$cabal_file"
}
gc() {
    update_cabal_version
    git commit -m "$1"
}


function fzf-zathura {
  local file=$(/bin/ls ~/doc/ | fzf --height 50% --border --ansi)
  if [ -n ~/doc/"$file" ]; then
    zathura ~/doc/"$file"
  fi
}

zle -N fzf-zathura

bindkey "^f" fzf-zathura
set -o vi




alias tut='cd ~/video/Tutorial/C/code/'


alias en='setxkbmap us'
alias fr='setxkbmap fr'


alias xi='doas emerge --ask'
alias xr='doas emerge --ask --unmerge'
alias xu='doas emerge --ask --update'
alias xq='doas emerge --search'


alias book='cd ~/desktop/book/'
#fetch
#neofetch
ascii
alias ls='lsd -lah --icon-theme unicode'
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/$USER/.cargo/bin


__web='https://labs.kagi.com/fastgpt https://www.phind.com/'




backup() {
  v=$(pwd)
  rm ~/backup/music.tar*
  cd ~/
  tar czvf ~/backup/music.tar music/
  bzip2 ~/backup/music.tar
  cd $v
}

av() {
  spotdl download $@ --bitrate 320k
}
