# Tested on Ubuntu-16.04
sudo sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# Update
sudo apt update
# Remove useless softwares
sudo apt purge libreoffice-common unity-webapps-common thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese gnome-sudoku transmission-common gnome-orca webbrowser-app landscape-client-ui-install deja-dup
# Install some basic tools
sudo apt install curl wget ipython
# Install vim
sudo apt install vim
wget -c https://raw.githubusercontent.com/qianfei11/InitPwnMachine/master/.vimrc -O ~/.vimrc
# Install tmux
sudo apt install tmux
wget -c https://raw.githubusercontent.com/qianfei11/InitPwnMachine/master/.tmux.conf -O ~/.tmux.conf
# Install pwntools
sudo apt-get install python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential
pip install --user pip -U
sudo cp /usr/bin/pip /usr/bin/pip.bak
wget https://raw.githubusercontent.com/qianfei11/InitPwnMachine/master/pip
sudo mv pip /usr/bin/pip
pip install --user pwntools -U
# Install oh-my-zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install x86 environment
sudo apt install gcc-multilib g++-multilib
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:i386 libstdc++6:i386 open-vm-tools open-vm-tools-desktop
# Install peda and Pwngdb
git clone https://github.com/scwuaptx/peda.git ~/peda
git clone https://github.com/scwuaptx/Pwngdb.git ~/Pwngdb
cp ~/Pwngdb/.gdbinit ~/
# Install one_gadget
sudo apt install ruby
sudo gem install one_gadget
