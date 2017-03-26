# ----------------------------------------------------------------------
# | Lists of stuff to be installed
# ----------------------------------------------------------------------
# list of ubuntu packages repositories

# list of ubuntu packages to be installed with apt
INSTALL_UBUNTU_PACKAGES="
build-essential
cmake
curl
exuberant-ctags
git
pandoc
python-dev
python3-dev
python3-pip
texlive
vim-gtk
"

# list of ubuntu packages to be removed
REMOVE_UBUNTU_PACKAGESS="
vim-tiny
"

# list of python3 packages to be installed with pip3 install
PYTHON3_PACKAGES="
grip
"

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

configure_ubuntu() {
    # apt update and upgrade
    sudo apt update
    sudo apt -y upgrade 

    # install linux packages
    sudo apt install -y $INSTALL_UBUNTU_PACKAGES

    # remove linux packages
    sudo apt remove -y $REMOVE_UBUNTU_PACKAGES
    sudo apt autoremove
}

configure_python() {
    # install python3 packages
    for package in $PYTHON3_PACKAGES
    do
        pip3 install --user --upgrade "$package"
    done
}

link_profile() {
    dot_files=$(find dotfiles-linux -type f)
    for FILEPATH in $dot_files
    do
        SOURCE="${PWD}/$FILEPATH"
        TARGET="${FILEPATH#*/}"
        HOME_TARGET="${HOME}/${TARGET}"

        # if file exists and is not a link, create backup
        if [ -e "${HOME_TARGET}" ] && [ ! -L "${HOME_TARGET}" ]; then
            BACKUP_FOLDER="${HOME}/.bak_dotfiles/$(dirname "$TARGET")"
            mkdir -p "${BACKUP_FOLDER}"
            mv "${HOME_TARGET}" "$(dirname "$BACKUP_FOLDER")/${TARGET}.bak"
        fi

        # link files
        ln -sf "${SOURCE}" "${HOME_TARGET}"
    done
}

# run scripts in scripts folder
run_scripts() {
    echo "Running scripts from scripts folder"
}

# main
main() {
    configure_ubuntu
    configure_python
    link_profile
    run_scripts
}

main
