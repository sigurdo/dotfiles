set number
" :source ~/.config/nvim/config.lua
:source ~/.config/nvim/load_colorscheme.lua

:source ~/.config/nvim/plugins/lazy.lua
:source ~/.config/nvim/plugins/mason.lua
:source ~/.config/nvim/plugins/rust-tools.lua
:source ~/.config/nvim/plugins/cmp.lua
:source ~/.config/nvim/plugins/which-key.lua
:source ~/.config/nvim/plugins/telescope.lua
:source ~/.config/nvim/plugins/nvim-tree.lua
:lua require("Comment").setup()
:source ~/.config/nvim/lspconfig.lua

set expandtab               " convert tabs to white space
set shiftwidth=4            " width for autoindents
set tabstop=4               " number of columns occupied by a tab character
set linebreak               " wrap lines only on word boundaries
set relativenumber          " enables relative line numbers
set mouse=""                " disables mouse

" Set window title to ./path/to/filename - Neovim
set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t\ –\ Neovim

" Swap ; and , to be more meaningful on norwegian QWERTY
nnoremap , ;
nnoremap ; ,
vnoremap , ;
vnoremap ; ,

" Folding
set foldmethod=indent
set nofoldenable
nnoremap z<space> za
vnoremap z<space> za

let mapleader = " "

:source ~/.config/nvim/keymaps.lua

