# pyenv, virtualenv, virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv-3
source /usr/bin/virtualenvwrapper_lazy-3.sh

# npm packages "global" install location
export NPM_CONFIG_PREFIX=$HOME/.npm-global
export PATH=$HOME/.npm-global/bin:$PATH

# environment variables specific to machine, should be in $ZDOTDIR/.zprofile, which is sourced after this file
# example: machine has a different PROJECT_HOME
