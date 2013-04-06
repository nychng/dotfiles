bindkey -v

#FROM BASH_PROFILE
export ARCHFLAGS="-arch x86_64"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib:/opt/local/lib/postgresql91
export PATH=~/node_modules/less/path_to_bin_directory:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:/Users/nai/node_modules/less/path_to_bin_directory:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/go/bin
#export VIRTUALENVWRAPPER_PYTHON=/opt/local/bin/python


#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'
alias vim='mvim -v'


# Git
alias gp='git pull'
alias gs='git status'


# Django
alias .m='./manage.py'
alias build_docs='./manage.py sphinx-build -b html docs/source docs/build'
alias mi='./manage.py migrate'
alias rs_cp='./manage.py runserver_cp'
alias rs='./manage.py runserver'
alias sp='./manage.py shell_plus'
alias tf='./manage.py test_fast'
alias cs='./manage.py collectstatic --noinput'
alias tc='./manage.py jenkins'
alias sm='./manage.py schemamigration'
alias rs_80='sudo apachectl stop; sudo ./manage.py runserver 192.168.1.107:80'
alias vrs_80='sudo apachectl stop; sudo /Users/nai/.virtualenvs/bookenv/bin/python manage.py runserver 192.168.1.107:80'
alias rs_8000='sudo ./manage.py runserver 192.168.1.2:8000'
alias pk='cat ~/.ssh/id_rsa.pub | pbcopy'

## Virtual Env ##
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Work
source `which virtualenvwrapper.sh`

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
	}

PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "

##
# Your previous /Users/nai/.bash_profile file was backed up as /Users/nai/.bash_profile.macports-saved_2012-09-26_at_21:18:13
##


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dpoggi"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Change this value to set how frequently ZSH updates¬
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python django git-flow pip rsync osx virtualenvwrapper port jira github git-extras fabric)

source $ZSH/oh-my-zsh.sh
# RPROMPT="%{$fg[blue]%}%~%{$reset_color%}"

# Customize to your needs...

