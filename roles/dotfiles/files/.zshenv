# pyenv, virtualenv, virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv-3

# npm packages "global" install location
export NPM_CONFIG_PREFIX=$HOME/.npm-global
export PATH=$HOME/.npm-global/bin:$PATH


# disable virtualenvwrapper oh-my-zsh plugin function which
# activates virtualenv when cd into folder
export DISABLE_VENV_CD=1

# environment variables specific to machine, should be in $ZDOTDIR/.zprofile, which is sourced after this file
# example: machine has a different PROJECT_HOME
