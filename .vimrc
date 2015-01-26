" requires vundle to manage plugins: http://github.com/gmarik/vundle

set nocompatible    " vim required
filetype off        " required by vundle

" vundle setup and initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'

" align text vertically on a string:
Bundle 'Align'

" colorschemes
Bundle 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Bundle 'chriskempson/vim-tomorrow-theme.git'
Bundle 'ColorSchemeMenuMaker'

" improve matching
Bundle 'edsono/vim-matchit'

" tagbar
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
call vundle#end()

syntax on

" prevent really long lines from slowing me down.
set synmaxcol=120

" colorscheme wombat
" colorscheme Tomorrow-Night
colorscheme Hybrid
if has("gui_macvim")
  set background=dark
endif

" line numbers
set number
set ruler

" column/line indicator
set ruler

" show the nasties
set list
set lcs=tab:>.      " tabs
set lcs+=trail:·    " trailing spaces
set lcs+=extends:#  " line wrap
set lcs+=nbsp:.     " non-breaking spaces

" indentation
filetype plugin on
filetype indent on
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=indent,eol,start
set nowrap

" don't deselect indentation
:vnoremap < <gv
:vnoremap > >gv

" show matching bracets
set showmatch

" split window navigation (ctrl-j/k)
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" open file in this directory
map <C-o> :sp .<CR>

" split window min height
set wmh=0

" always show status line
set laststatus=2

function! CurDir()
       let curdir = substitute(getcwd(), '/Users/blemasurier/', "~/", "g")
       return curdir
endfunction

" ignore case when searching
set ignorecase

" unless it starts with a capitol
set smartcase

" show search matches as you type them
set incsearch

" highlight search results
set hlsearch

" highlight notes
hi clear todo
hi clear note
hi clear fixme
hi clear xxx

" scrolling
set scrolloff=8 "Start scrolling 8 lines from margin
set sidescrolloff=15
set sidescroll=1

" make Y copy to the end of the line
map Y y$"

set title

" gui
set guioptions=aegimrLt

" font
if has("gui_macvim")
  set guifont=Monaco:h12
endif

" don't highlight html links
hi link htmlLink NONE

" remove trailing spaces on save
"autocmd BufWritePre * kz|:%s/\s\+$//e|'z

" tabs are ok for golang
autocmd BufRead,BufNewFile *.go set nolist

" no swap files
set noswapfile

" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

filetype plugin indent on
