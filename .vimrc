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
