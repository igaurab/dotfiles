#Install necessary softwares
echo "Installing:

1. zsh \n
2. neovim \n
3. git \n
4. tmux \n
"
sudo apt install zsh neovim git tmux &&

echo "Installing oh-my-zsh" &&
yes Y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

zsh &&

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&

#Backing up existing zshrc
#Create symlinks of dotfiles
ln -s ~/dotfiles/.tmux.conf &&
ln -s ~/dotfiles/.zshrc &&


git config --global user.email "gaurabpanthee@gmail.com" &&
git config --global user.name "igaurab"
