# list of linux packages repositories

# list of linux packages to be installed with apt
UBUNTU_PACKAGES="
python3-pip
"

# list of python packages to be installed with pip install
PYTHON3_PACKAGES="

"

# apt update and upgrade
sudo apt update
sudo apt -y upgrade 

# install linux packages
sudo apt install -y $UBUNTU_PACKAGES

# install python3 packages
for package in $PYTHON3_PACKAGES
do
    pip3 install --user --upgrade "$package"
done

# link files on dotfiles-linux

# run scripts in scripts folder
