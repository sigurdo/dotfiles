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
:source ~/.config/nvim/plugins/diffview.lua
:lua require("Comment").setup()
:source ~/.config/nvim/lspconfig.lua

set expandtab               " convert tabs to white space
set shiftwidth=4            " width for autoindents
set tabstop=4               " number of columns occupied by a tab character
set linebreak               " wrap lines only on word boundaries
" set relativenumber          " enables relative line numbers
set mouse=""                " disables mouse

" Set window title to ./path/to/filename - Neovim
" set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t\ –\ Neovim
" set title titlestring=%{%substitute(getcwd()
set title titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}\ –\ %t
" set title titlestring=%{expand("#")}\ –\ %t

" Swap ; and , to be more meaningful on norwegian QWERTY
nnoremap , ;
vnoremap , ;
nnoremap ; ,
vnoremap ; ,

" More ergonomic to use ø for jumping to start and end of line
nnoremap ø $
vnoremap ø $
nnoremap Ø ^
vnoremap Ø ^

" More ergonomic to use æ to jump to a mark
nnoremap æ `

" Folding
set foldmethod=indent
set nofoldenable
nnoremap z<space> za
vnoremap z<space> za

let mapleader = " "

" Diff
if &diff
    nnoremap <C-n> ]c
    nnoremap <C-p> [c
endif

:source ~/.config/nvim/keymaps.lua

" Format on save
autocmd BufWritePre * lua vim.lsp.buf.format()

" Code block syntax highlighting markdown
let g:markdown_fenced_languages = ['rust', 'html', 'python', 'lua', 'vim', 'typescript', 'javascript']
