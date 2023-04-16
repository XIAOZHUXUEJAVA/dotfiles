echo "====================update apt====================\n"
sudo apt update -y && sudo apt upgrade -y

echo "====================changing shell to zsh====================\n"
sudo apt install zsh git curl wget -y
echo "setopt correct" >> ~/.zshrc
echo "setopt auto_menu" >> ~/.zshrc




chsh -s $(which zsh)
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
zsh