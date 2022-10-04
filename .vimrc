call plug#begin('~/.vim/plugged')
"
" autocomplete
if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
endif
if has ('nvim')
	"Plug 'nvim-lua/plenary.nvim'
	"Plug 'nvim-telescope/telescope.nvim'
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
" Language server client
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'do': 'UpdateRemotePlugins',
    "\ }

" (Optional) Multi-entry selection UI.
"Plug 'junegunn/fzf'
Plug 'vimwiki/vimwiki'
"Plug 'ptzz/lf.vim'
"Plug 'voldikss/vim-floaterm'



" LanguageClient-neovim
"Plug 'rust-lang/rust.vim',         { 'for': 'rust' }

call plug#end()
"let g:LanguageClient_serverCommands = {
	"\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    "\ }
" Automatically start language servers.
"let g:LanguageClient_autoStart = 1

" Configure deoplete
"let g:deoplete#enable_at_startup = 1

set hidden
" note that if you are using Plug mapping you should not use `noremap` mappings.
"nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
"nmap <silent>K <Plug>(lcn-hover)
"nmap <silent> gd <Plug>(lcn-definition)
"nmap <silent> <F2> <Plug>(lcn-rename)

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'


if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif
" Turn on syntax highlighting
syntax on

" Pick a leader (meta) key (comma is good)
let mapleader = ","
let g:mapleader = ","

" show relative line numbers
set number
set relativenumber

" Security
set modelines=0

" Show file stats
set ruler

"drop down file completion
set wildmenu
" window title is file
set title
" hilight current line
set cursorline
" Flash cursor instead of beep
set visualbell

" Encoding
set encoding=utf-8

" Whitespace indenting
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set smarttab
"filetype plugin indent on
set wrap
set textwidth=79
set formatoptions=tcqrn1
"set tabstop=2
"set shiftwidth=2
set shiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" wrap at end / start of lines
set whichwrap+=<,h
set whichwrap+=>,l

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
" nnoremap / /\v
" vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip
"https://github.com/LukeSmithxyz/voidrice/blob/master/.config/nvim/init.vim
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
set go=a
set mouse=a
:imap jk <Esc>
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set wildmode=longest,list,full
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" https://levelup.gitconnected.com/7-surprising-vim-tricks-that-will-save-you-hours-b158d23fe9b7
" Shortcut to use blackhole register by default. 
" y and Y by definition are yank - make a copy. will go to clipboard.
" p and P also unchanged - there's nothing in the blackhole - no modification with leader required. just paste from the clipboard.
" If you're doing repeated replaces it's quicker to use leader with the one copy, multiple replaces with the blackhole deletes with the simplified keystroke version.
" You can also do c's and x's without destroying the clipboard contents.
"nnoremap d "_d
"vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
" Shortcut to use clipboard with <leader>
"nnoremap <leader>d d
"vnoremap <leader>d d
nnoremap <leader>D D
vnoremap <leader>D D
nnoremap <leader>c c
vnoremap <leader>c c
nnoremap <leader>C C
vnoremap <leader>C C
nnoremap <leader>x x
vnoremap <leader>x x
nnoremap <leader>X X
vnoremap <leader>X X

let g:rustfmt_autosave = 1
" Use system clipboard as default register
set clipboard+=unnamedplus "Linux
" gU<dir> change lower to uppercase (visual)
" gu<dir> change upper to lowercase (visual)
" CTRL + F to edit command buffer
"CTRL + A increment a number, CTRL + X to decrement a number
"SHIFT + L (low) to jump the cursor to the bottom of the current screen without moving the screen
"SHIFT + M (middle) to jump the cursor to the center of the current screen without moving the screen
"SHIFT + H (high) to jump the cursor to the top of the current screen without moving the screen
"CTRL + U (up) to move the cursor and screen half a page up
"CTRL + D (down) to move the cursor and screen half a page down
"open another file in a new tab:
":tabe <filename>
"gt to move right in tabs
"gT to move left in tabs
"cc anywhere in line to delete and start typing with indent preserved
