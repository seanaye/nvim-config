set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
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

:Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdtree'

Plug 'preservim/nerdcommenter'
Plug 'jparise/vim-graphql'
call plug#end()
colorscheme gruvbox

let mapleader = " "

nnoremap <leader>f :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>p :lua require('telescope.builtin').find_files()<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>

autocmd StdinReadPre * let g:isReadingFromStdin = 1
autocmd VimEnter * if !argc() && !exists('g:isReadingFromStdin') | NERDTree | endif


lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.denols.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.graphql.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rls.setup{}
EOF

