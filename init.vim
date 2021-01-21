set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
" Telescope dependencies"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'preservim/nerdtree'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
colorscheme gruvbox

let mapleader = " "

nnoremap <leader>f :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>p :lua require('telescope.builtin').find_files()<CR>
nnoremap <F2> :NERDTreeToggle<CR>

