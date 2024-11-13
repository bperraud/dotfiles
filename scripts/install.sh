sudo apt update
sudo apt install neovim
sudo apt install neofetch
sudo apt install python3-venv
sudo apt install npm
sudo apt install unzip
sudo apt install stow
sudo apt install tmux
sudo apt install fzf
sudo apt install ripgrep
# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# packer vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
