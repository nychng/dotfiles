export ARCHFLAGS="-arch x86_64"
export LC_ALL=en_US.UTF-8
export LANG==en_US.UTF-8
export TERM=xterm-256color
export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib:/opt/local/lib/postgresql91

export PATH=~/node_modules/less/path_to_bin_directory:$PATH


#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up the prompt color (currently a green similar to linux terminal)
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'


alias vim='mvim -v'

# Git
alias gp='git pull'
alias gs='git status'

# Django
alias .m='./manage.py'
alias mi='./manage.py migrate'
alias rs_cp='./manage.py runserver_cp'
alias rs='./manage.py runserver_plus'
alias sp='./manage.py shell_plus'
alias tf='./manage.py test_fast'
alias cs='./manage.py collectstatic --noinput'
alias tc='./manage.py jenkins'
alias sm='./manage.py schemamigration'
alias rs_80='sudo apachectl stop; sudo ./manage.py runserver 192.168.1.107:80'
alias vrs_80='sudo apachectl stop; sudo /Users/nai/.virtualenvs/bookenv/bin/python manage.py runserver 192.168.1.107:80'
alias rs_8000='sudo ./manage.py runserver 192.168.1.2:8000'

## Virtual Env ##
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
	}

PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "

##
# Your previous /Users/nai/.bash_profile file was backed up as /Users/nai/.bash_profile.macports-saved_2012-09-26_at_21:18:13
##

# MacPorts Installer addition on 2012-09-26_at_21:18:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

