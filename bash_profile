##########################################
################## UI ####################
##########################################

# Print login information in every new shell
w

# Make apps installed in $HOME/Applications available on the CLI
export PATH="$HOME/Applications/bin:$PATH"


##########################################
################# STABLE #################
##########################################

# My shortcuts
alias l="ls -GFlash"
alias dev="cd /Users/pmital/Developer"
alias devpy="cd /Users/pmital/Developer/python-virtualenvs/"
alias hist="history"

# Default editor
export EDITOR=vim

# Directory colors
export CLICOLOR=1

# Prompt modifier
export PS1="[\u:\w] $ "


##########################################
############### HOMEBREW #################
##########################################

# Make Homebrew maintenance easier
alias brew-tend="brew update;brew upgrade;brew doctor;brew cleanup --prune-prefix;brew cleanup -s"

# Enable tab-completion using Homebrew-installed bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Make apps installed in /usr/local/sbin/ available on the CLI
export PATH="/usr/local/sbin:$PATH"


##########################################
################ PYTHON ##################
##########################################

# Activate conda
alias conda-activate='source /Users/pmital/miniconda3/etc/profile.d/conda.sh'

# Activate pyenv
alias pyenv-activate='eval "$(pyenv init -)"'

# Disable pip package installations outside virtualenvs
export PIP_REQUIRE_VIRTUALENV=True

# Create special gpip() function to execute global pip commands
gpip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Function that provides a simple, high-level, virtualenv management interface
# for pyenv-install virtualenvs. Note that:
#   - the environemnt prefix is hardcoded.
#   - the environment activated when this function is invoked must have virtualenv installed.
#   - pyenv must have been initialized before this function is used.
function myvenv {
    # Directory where all virtualenvs will live.
    envpath=~/Developer/python-virtualenvs/.managed_environments

    if [ $# -eq 0 ]; then
	echo "Run the 'help' command to see a list of available commands"

    elif [ "$1" = "help" ]; then
        echo "Available commands: help | list | prefix | create <pyversion> <name> | activate <name> | remove <name>"

    elif [ "$1" = "list" ]; then
	basename `ls -d $envpath/*/ 2> /dev/null` 2> /dev/null

    elif [ "$1" = "prefix" ]; then
	echo "Managed virtualenv path: $envpath"

    elif [ "$1" = "create" ]; then
	if [ $# -ne 3 ]; then
	    echo "Must provide an environment name and python executable version"
	    return 1
	fi
	envnamepath=$envpath/$3
	if [ -d $envnamepath ]; then
	    echo "Virtualenv with that name already exists"
	    return 1
        fi
	# Users may provide incomplete versions. If it matches just one of the available
	# pyenv-installed runtime versions, we go ahead and install that. This command searches
	# the list of available runtime versions. xargs is used to eliminate leading and trailing
	# whitespace.
	pyversion=`pyenv versions | grep -i $2 | xargs`
	if [[ -z $pyversion ]] || [[ $pyversion == *" "* ]]; then
	    echo "Given version matches none or more than one available python versions."
	    return 1
        fi
	virtualenv --python=`pyenv prefix $pyversion`/bin/python $envnamepath

    elif [ "$1" = "activate" ]; then
	if [ $# -ne 2 ]; then
	    echo "Must provide an environment name"
	    return 1
        fi
	envnamepath=$envpath/$2
	if ! [ -d $envpath ]; then
	    echo "No such virtualenv"
	    return 1
        fi
	source $envnamepath/bin/activate

    elif [ "$1" = "remove" ]; then
        envnamepath=$envpath/$2
	if ! [ -d $envpath ]; then
	    echo "No such virtualenv"
        fi
	rm -rf $envnamepath
    else
        echo "No command or unrecognized command."
    fi
}
