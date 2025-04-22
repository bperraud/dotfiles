sudo apt update
<<<<<<< HEAD
sudo apt install neovim neofetch python3-venv npm unzip stow tmux fzf ripgrep
=======
sudo apt install git curl neovim neofetch python3-venv npm unzip stow tmux fzf ripgrep

>>>>>>> b8c5d20be9bc288bc66dbc505a571005bda7a950
# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# packer vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
