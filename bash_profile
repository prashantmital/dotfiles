##########################################
################## UI ####################
##########################################

# Print login information in every new shell
w

# Enable git tab-completion
source ~/Applications/git-completion.bash

# Make custom apps avaialable on the CLI
export PATH="$HOME/Applications/bin:$PATH"


##########################################
############### MONGODB ##################
##########################################

# Shortcut to populate path for production mongoDB
_MDB_DEFAULT_VERSION="3.6.4"
mdb_enable() {
    # Allow user to specify custom version
    if [[ -n $1 ]]; then _MDB_VERSION=$1; else _MDB_VERSION=$_MDB_DEFAULT_VERSION; fi

    # Compute constants
    _MDB_INSTALL_BASE_DIR="$HOME/Developer/server_mongodb_$_MDB_VERSION"
    _MDB_INSTALL_BIN_DIR="$_MDB_INSTALL_BASE_DIR/bin"
    _MDB_INSTALL_DATA_DIR="$_MDB_INSTALL_BASE_DIR/data"

    # Make mongoDB binaries available from prompt
    export PATH="$_MDB_INSTALL_BIN_DIR:$PATH"

    # Use mongod --dbpath $MDB_DATA_DIR to use this location for data storage
    if ! [[ -d $_MDB_INSTALL_DATA_DIR ]]; then mkdir $_MDB_INSTALL_DATA_DIR; fi
    export MDB_DATA_DIR=$_MDB_INSTALL_DATA_DIR
}

# MongoDB code review tool
alias cr="$HOME/.pyenv/versions/2.7.15/bin/python $HOME/Applications/mongodb_cr_upload.py -y -e prashant.mital@10gen.com --git_similarity=100"


##########################################
################# STABLE #################
##########################################

# Shortcuts
alias l="ls -GFlash"
alias dev="cd ~/Developer"
alias hist="history"
#alias ..='cd ../'
#alias shutdown='sudo shutdown -h now "Shut Down Initiated by Super User"'
#alias sleep='sudo shutdown -s +1 "Sleep Sequence Initiated by Super User"'
#alias restart='sudo shutdown -r now "Restart sequence Initiated by Super User"'
#alias cpuinfo='sysctl -a | grep machdep.cpu'
#alias ql='qlmanage -p 2>/dev/null'
#alias query_linux_version='lsb_release -a'

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
alias brew-tend="brew update;brew upgrade;brew doctor;brew prune;brew cleanup -s"

# Installing python with homebrew gives `python2` and `python3` executables
# Corresponding `pip` entrypoints are `pip2` and `pip3`

# Disable pip package installations outside virtualenvs
#export PIP_REQUIRE_VIRTUALENV=True

# Create special gpip() function to execute global pip commands
#gpip(){
#    PIP_REQUIRE_VIRTUALENV="" pip "$@"
#}


##########################################
################ PYTHON ##################
##########################################

# Modify paths for pyenv and pyenv-virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
