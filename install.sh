# list of ubuntu packages repositories

# list of ubuntu packages to be installed with apt
INSTALL_UBUNTU_PACKAGES="
build-essential
cmake
curl
exuberant-ctags
python-dev
python3-dev
python3-pip
vim-gnome
"

# list of ubuntu packages to be removed
REMOVE_UBUNTU_PACKAGESS="
vim-tiny
"

# list of python3 packages to be installed with pip3 install
PYTHON3_PACKAGES="

"

# apt update and upgrade
sudo apt update
sudo apt -y upgrade 

# install linux packages
sudo apt install -y $INSTALL_UBUNTU_PACKAGES

# remove linux packages
apt remove -y $REMOVE_UBUNTU_PACKAGES

# install python3 packages
for package in $PYTHON3_PACKAGES
do
    pip3 install --user --upgrade "$package"
done

# link files on dotfiles-linux

# run scripts in scripts folder
