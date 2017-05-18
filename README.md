Setup machine using ansible. Installs packages and links dotfiles

Install
-------

1. Install ansible using package manager (dnf, yum, apt,...)

	$ sudo yum install ansible

2. Get a copy of this repository.

    If git is installed:

    	$ cd ~ && git clone https://github.com/tserafim/dotfiles.git .dotfiles

        $ cd .dotfiles

    Otherwise:

	    $ cd ~ && mkdir .dotfiles && cd .dotfiles

    	$ wget -q0- https://github.com/tserafim/dotfiles/tarball/master | tar --strip-components=1 -xvz


3. Run setup_machine playbook

	    $ ansible-playbook setup_machine.yml -K

