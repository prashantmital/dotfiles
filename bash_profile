##########################################
################## UI ####################
##########################################

# Print login information in every new shell
w

# Enable git tab-completion
source ~/Applications/git-completion.bash


##########################################
################# STABLE #################
##########################################

# Shortcuts
alias l='ls -GFlash'
alias dev='cd ~/Developer'
alias hist='history'
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
export PS1='[\u:\w] $ '


##########################################
############### HOMEBREW #################
##########################################

# Make Homebrew maintenance easier
alias brew-tend='brew update;brew upgrade;brew doctor;brew prune;brew cleanup -s'

# Installing python with homebrew gives `python2` and `python3` executables
# Corresponding `pip` entrypoints are `pip2` and `pip3`

# Disable pip package installations outside virtualenvs
#export PIP_REQUIRE_VIRTUALENV=True

# Create special gpip() function to execute global pip commands
#gpip(){
#    PIP_REQUIRE_VIRTUALENV="" pip "$@"
#}
export GPG_TTY=$(tty)
