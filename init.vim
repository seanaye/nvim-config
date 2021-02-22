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
set foldmethod=indent

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
" Telescope dependencies"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'preservim/nerdtree'

Plug 'preservim/nerdcommenter'
Plug 'SirVer/ultisnips'

Plug 'sheerun/vim-polyglot'
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
vim.lsp.set_log_level("debug")

local lspconfig = require'lspconfig'
lspconfig.svelte.setup{}
lspconfig.tsserver.setup{}
lspconfig.dockerls.setup{}
lspconfig.gopls.setup{}
lspconfig.graphql.setup{}
lspconfig.html.setup{}
lspconfig.jsonls.setup{}
lspconfig.rls.setup{}
lspconfig.pyright.setup{}
lspconfig.vuels.setup{}
EOF

let g:UltiSnipsSnippetDirectories=["~/.config/nvim/custom-snippets"]

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

let g:completion_trigger_on_delete = 1

" Recommended LSP Completion settings from 
" https://github.com/nvim-lua/completion-nvim
"
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

noremap K :lua vim.lsp.buf.hover()<CR>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

