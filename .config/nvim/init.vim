set number
:source ~/.config/nvim/load_colorscheme.lua

set expandtab               " convert tabs to white space
set shiftwidth=4            " width for autoindents
set tabstop=4               " number of columns occupied by a tab character
set linebreak               " wrap lines only on word boundaries

" Set window title to ./path/to/filename - Neovim
set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t\ –\ Neovim

