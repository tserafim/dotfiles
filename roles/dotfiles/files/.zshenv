# pyenv, virtualenv, virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# disable virtualenvwrapper oh-my-zsh plugin function which
# activates virtualenv when cd into folder
export DISABLE_VENV_CD=1

# environment variables specific to machine, should be in $ZDOTDIR/.zprofile, which is sourced after this file
# example: machine has a different PROJECT_HOME
