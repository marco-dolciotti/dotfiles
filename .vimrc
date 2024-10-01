" PLUGINS

" Highlight copied text
Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'


" MAPPINGS

" Map "jk" to escape insert mode
" inoremap jk <ESC>

let mapleader = " "


" Map yank into clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y

" Map paste over selected text without overwriting the yank register
nnoremap <leader>p "_dP
vnoremap <leader>p "_dP

" Map deletes without overwriting the yank register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Substitute word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Basic Keymaps
" Set highlight on search, but clear on pressing <Esc> in normal mode
nnoremap <Esc> :nohlsearch<CR>

" ctrl+c behaves exactly the same as esc
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Diagnostic keymaps
nnoremap [d :lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>d :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>q :lua vim.diagnostic.setloclist()<CR>

" Exit terminal mode in the builtin terminal
tnoremap <Esc><Esc> <C-\><C-n>

" TIP: Disable arrow keys in normal mode
" nnoremap <left> :echo "Use h to move!!"<CR>
" nnoremap <right> :echo "Use l to move!!"<CR>
" nnoremap <up> :echo "Use k to move!!"<CR>
" nnoremap <down> :echo "Use j to move!!"<CR>

" Keybinds to make split navigation easier.
"  Use CTRL+<hjkl> to switch between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>


augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=1000 }
augroup END





" OPTIONS

" Setting options

" Make line numbers default
set number

" Add relative line numbers
set relativenumber

" Enable mouse mode
set mouse=a

" Don't show the mode
set showmode=false

" Sync clipboard between OS and Neovim
" set clipboard=unnamedplus

" Enable break indent
set breakindent

" Save undo history
set undofile

" Case-insensitive searching unless \C or one or more capital letters in the search term
set ignorecase
set smartcase

" Keep signcolumn on by default
set signcolumn=yes

" Decrease update time
set updatetime=250

" Decrease mapped sequence wait time
set timeoutlen=300

" Configure how new splits should be opened
set splitright
set splitbelow

" Set how neovim will display certain whitespace characters in the editor
set list
set listchars=tab:»\ ,trail:·,nbsp:␣

" Preview substitutions live, as you type
set inccommand=split

" Show which line your cursor is on
" set cursorline

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Highlight on search
set hlsearch


