" requires vundle to manage plugins: http://github.com/gmarik/vundle

set nocompatible    " vim required
filetype off        " required by vundle

" vundle setup and initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Align'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/vim-tomorrow-theme.git'
Plugin 'ColorSchemeMenuMaker'
Plugin 'edsono/vim-matchit'
Plugin 'majutsushi/tagbar'
Plugin 'jimenezrick/vimerl'
Plugin 'elixir-lang/vim-elixir'
Plugin 'bling/vim-airline'
Plugin 'vim-perl/vim-perl'
call vundle#end()

nmap <F8> :TagbarToggle<CR>

" set terminal title to filename
set title

" leader key = ,
let mapleader=","

" always cd to current file
set autochdir

" syntax highlighting
syntax on
set background=dark
colorscheme hybrid

" no swap files
set noswapfile

" prevent really long lines from bogging down the system
set synmaxcol=400

" line numbers
set number
set ruler

" column/line indicator
set ruler

" scrolling
set scrolloff=8 "Start scrolling 8 lines from margin
set sidescrolloff=15
set sidescroll=1

" show the nasties
set nolist
set listchars=trail:·     " trailing spaces
set listchars+=tab:\\t    " tabs
set listchars+=extends:#  " line wrap
set listchars+=nbsp:.     " non-breaking spaces

set t_Co=256

" indentation
filetype on
filetype plugin on
filetype indent on
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start
set nowrap
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" don't deselect indentation
:vnoremap < <gv
:vnoremap > >gv

" make Y copy to the end of the line
map Y y$"

" show matching bracets
set showmatch

" split window navigation (ctrl-j/k)
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" split window min height
set wmh=0

" always show status line
set laststatus=2

" show search matches as you type them
set incsearch

" ignore case when searching
set ignorecase

" unless it starts with a capitol
set smartcase

" highlight search results
set hlsearch

" highlight notes
hi clear todo
hi clear note
hi clear fixme
hi clear xxx

" don't highlight html links
hi link htmlLink NONE

" remove trailing spaces on save
"autocmd BufWritePre * kz|:%s/\s\+$//e|'z

" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" ruby: no tabs, 2 spaces for indent
autocmd FileType ruby set tabstop=2 softtabstop=2 expandtab listchars+=tab:>-

" golang

" golint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" automatically insert import paths
let g:go_fmt_command = "goimports"

" show a list of interfaces implemented by type under cursor
autocmd FileType go nmap <Leader>s <Plug>(go-implements)

" show godoc (vertically) for word under cursor
autocmd FileType go nmap <Leader>gd <Plug>(go-doc-vertical)

" show godoc in the browser for word under cursor
autocmd FileType go nmap <Leader>gb <Plug>(go-doc-vertical)

" open target identifier in new vsplit
autocmd FileType go nmap <Leader>gv <Plug>(go-def-vertical)

" go-build
autocmd FileType go nmap <leader>b <Plug>(go-build)

" go-test
autocmd FileType go nmap <leader>t <Plug>(go-test)

" go-coverage
autocmd FileType go nmap <leader>c <Plug>(go-coverage)

" gui
set guioptions=aegimrLt

" font
if has("gui_macvim")
  set guifont=Monaco:h12
  set noantialias
endif
