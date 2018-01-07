Setup machine using ansible. Installs packages and links dotfiles

Install
-------

1. Install ansible using package manager (dnf, yum, apt,...)

    $ sudo yum install ansible

2. Get a copy of this repository.

    If git is installed:

        $ cd ~ && git clone --recursive https://github.com/tserafim/dotfiles.git .dotfiles

        $ cd .dotfiles

    Otherwise:

        $ cd ~ && mkdir .dotfiles && cd .dotfiles

        $ wget -q0- https://github.com/tserafim/dotfiles/tarball/master | tar --strip-components=1 -xvz


3. Run setup_machine playbook

        $ ansible-playbook setup_machine.yml -K


Vim and tmux **plugin managers**(vim-plug and tpm) are already installed. Specific plugins must be installed later, following plugin manager instructions.
