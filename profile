##########################################
################## UI ####################
##########################################

# Print login information in every new shell
w

# Enable git tab-completion
source ~/Applications/git-completion.bash

# EDM autocomplete
source /Users/pmital/Applications/edm-completion.bash

# Powerline
export POWERLINE_CONFIG_COMMAND='/Users/pmital/Library/Python/2.7/bin/powerline-config'

##########################################
################### DEV ##################
##########################################

# Spark and PySpark related settings
#export SPARK_HOME="${HOME}/spark-1.6.0"
#export PYSPARK_SUBMIT_ARGS="--master local[2]"
#alias pyspark="${SPARK_HOME}/bin/pyspark"

# Docker commands
#eval "$(docker-machine env default)"

##########################################
############## ENTHOUGHT #################
##########################################

# Export credentials for hatcher
alias authenticate_hatcher='source ~/Applications/hatcher_authenticate.sh'

# Added by Canopy installer 
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make the bash prompt show that Canopy is active, otherwise 1
#alias activate_canopy="source '/Users/pmital/Library/Enthought/Canopy/edm/envs/User/bin/activate'"
#VIRTUAL_ENV_DISABLE_PROMPT=1 

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
############## POWERLINE #################
##########################################

#export PATH="/Users/pmital/Library/Python/2.7/bin:${PATH}"
#export POWERLINE_CONFIG_COMMAND="/opt/local/bin/powerline-config-2.7"
#export POWERLINE_COMMAND="/opt/local/bin/powerline-2.7"
#/opt/local/bin/powerline-daemon-2.7 -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#repository_root=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
#. ${repository_root}/powerline/bindings/bash/powerline.sh

##########################################
############### HOMEBREW #################
##########################################
# Installing python with homebrew gives `python2` and `python3` executables
# Corresponding `pip` entrypoints are `pip2` and `pip3`
# We set `pip` to point to `pip2`
alias pip='pip2'

# Disable pip package installations outside virtualenvs
export PIP_REQUIRE_VIRTUALENV=True

# Create special gpip() function to execute global pip commands
gpip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
