# list of linux packages repositories

# list of linux packages to be installed with apt
UBUNTU_PACKAGES="

"

# list of python packages to be installed with pip install
PYTHON_PACKAGES="

"

# apt update and upgrade
sudo apt update
sudo apt upgrade -y

# install linux packages
sudo apt install -y $UBUNTU_PACKAGES

# install python packages
for package in $PYTHON_PACKAGES
do
    pip install --upgrade "$package"
done

# link files on dotfiles-linux

# run scripts in scripts folder
