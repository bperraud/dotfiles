sudo apt update
sudo apt install git curl neovim neofetch python3-venv npm unzip stow tmux fzf ripgrep direnv

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# packer vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
