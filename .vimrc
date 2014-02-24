syntax on
"colorscheme elflord
"colorscheme desert
colorscheme wombat

" line numbers
set nu

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

" make Y copy to the end of the line
map Y y$"

set title

" gui
set guioptions=aegimrLt
set gfn=Monospace\ 8
"set gfn=ProggyCleanTT\ 12

" LESS = .css
autocmd BufRead,BufNewFile *.less set filetype=css

" don't highlight html links
hi link htmlLink NONE

" remove trailing spaces on save
autocmd BufWritePre * kz|:%s/\s\+$//e|'z

" tabs are ok for golang
autocmd BufRead,BufNewFile *.go set nolist

" encrypted editing
augroup CPT
  au!
  au BufReadPre *.cpt set bin
  au BufReadPre *.cpt set viminfo=
  au BufReadPre *.cpt set noswapfile
  au BufReadPost *.cpt let $vimpass = inputsecret("Password: ")
  au BufReadPost *.cpt silent '[,']!ccrypt -cb -E vimpass
  au BufReadPost *.cpt set nobin
  au BufWritePre *.cpt set bin
  au BufWritePre *.cpt '[,']!ccrypt -e -E vimpass
  au BufWritePost *.cpt u
  au BufWritePost *.cpt set nobin
  au BufWritePost *.cpt set spell
augroup END

func! WordProcessorMode()
  setlocal formatoptions=1
  set formatoptions+=t
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
  set textwidth=74
  set lcs=tab: .
endfu
com! WP call WordProcessorMode()

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" pathogen
execute pathogen#infect()
filetype plugin indent on
