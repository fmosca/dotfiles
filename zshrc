# Path to your oh-my-zsh configuration.
#if [ ! "$TERM" ]; then
#  export TERM=xterm-color
#fi

export ZSH=$HOME/.oh-my-zsh
export HISTCONTROL=ignorespace




# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="gallifrey"
export ZSH_THEME="gallifrey"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#
plugins=(git symfony2 cap brew osx capistrano ant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export EDITOR="vim"
export VISUAL="vim"
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
# export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"

export PATH=$PATH:/opt/local/bin
export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info

# export PATH="$(brew --prefix josegonzalez/php/php53)/bin:$PATH"


export DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias zcat='gzcat'
alias ff='find . -iname'

alias pear="php /usr/lib/php/pear/pearcmd.php" 
alias pecl="php /usr/lib/php/pear/peclcmd.php" 

alias sack="ack --ignore-dir=cache --ignore-dir=logs --pager='less -R'"

#alias phpunit="php -c /etc/php.ini.no-xdebug /usr/bin/phpunit"
#alias xphpunit="php -c /etc/php.ini /usr/bin/phpunit"

# projects
alias you="cd /Volumes/Work/Sites/youandeni"
alias loy="cd /Volumes/Work/Sites/ald-loyalty"
alias deplecom="ssh sviluppo@192.168.13.159 'cd ecommerce/current; git pull origin master'"

PROMPT='%{$fg[green]%}%m%{$reset_color%} %2~ %{$reset_color%}%B»%b '


if [[ -n $VIM ]] {
  PROMPT='%~> '
  alias ls=ls 
  export DISABLE_LS_COLORS="true"
  export GREP_OPTIONS=""
  alias ack-grep=ack-grep --no-color
}

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


autoload -Uz vcs_info

precmd() {
  psvar=()
  vcs_info
}

RPROMPT='%F{green}$vcs_info_msg_0_%f'

zstyle ':completion:*' special-dirs true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

