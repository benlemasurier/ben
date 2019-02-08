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
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/vim-tomorrow-theme.git'
Plugin 'ColorSchemeMenuMaker'
Plugin 'tmhedberg/matchit'
Plugin 'majutsushi/tagbar'
Plugin 'jimenezrick/vimerl'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-perl/vim-perl'
Plugin 'bruno-/vim-man'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'nono/vim-handlebars'
Plugin 'rust-lang/rust.vim'
"Plugin 'autozimu/LanguageClient-neovim'
Plugin 'junegunn/fzf'
Plugin 'cespare/vim-toml'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'uarun/vim-protobuf'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'mdempsky/gocode', {'rtp': 'nvim/'}
Plugin 'SirVer/ultisnips'
Plugin 'hashivim/vim-terraform'
Plugin 'vim-scripts/bats.vim'
call vundle#end()

nmap <F8> :TagbarToggle<CR>

" set terminal title to filename
set title

" enable mouse use
set mouse=a

" leader key = ,
let mapleader=","

" always cd to current file
"set autochdir

" auto-save on build
set autowrite

" syntax highlighting
syntax on
set background=dark
"colorscheme hybrid
colorscheme gruvbox

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
set list
set listchars=trail:·     " trailing spaces
set listchars+=tab:\ \    " tabs (don't show them)
set listchars+=extends:#  " line wrap
set listchars+=nbsp:.     " non-breaking spaces

" enable 256 color support
set t_Co=256

" make the quickfix readable
hi QuickFixLine ctermbg=NONE

" indentation
filetype on
filetype plugin on
filetype indent on
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start
set nowrap
set noexpandtab
set tabstop=8
set softtabstop=4

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

let g:airline_powerline_fonts = 1

autocmd Filetype make set noexpandtab softtabstop=0
autocmd Filetype perl set noexpandtab softtabstop=0

" haskell: no tabs, 4 spaces for indent
autocmd Filetype haskell set expandtab tabstop=4 softtabstop=0 shiftwidth=4 listchars+=tab:>-

" ruby: no tabs, 2 spaces for indent
autocmd Filetype ruby set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-

" yaml: no tabs, 2 spaces for indent
autocmd Filetype yaml set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-

" javascript: no tabs, 2 spaces for indent
autocmd Filetype javascript set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-
autocmd Filetype json set expandtab tabstop=2 softtabstop=2 shiftwidth=2 listchars+=tab:>-

" html: no tabs, 2 spaces for indent
autocmd Filetype html set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-

" html: no tabs, 2 spaces for indent
autocmd Filetype css set expandtab tabstop=2 softtabstop=2 shiftwidth=2 listchars+=tab:>-

" handlebars : no tabs, 2 spaces for indent
autocmd Filetype handlebars.html set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-

" haskell, no tabs, 4 spaces for indent
autocmd Filetype haskell set expandtab tabstop=4 softtabstop=4 shiftwidth=4 listchars+=tab:>-

" bash: no tabs, 4 spaces for indent
autocmd Filetype sh set expandtab tabstop=4 softtabstop=0 shiftwidth=4 listchars+=tab:>-

" rust: no tabs, 4 spaces for indent
autocmd Filetype sh set expandtab tabstop=4 softtabstop=0 shiftwidth=4 listchars+=tab:>-

" sql: no tabs, 4 spaces for indent
autocmd Filetype sql set expandtab tabstop=4 softtabstop=0 shiftwidth=4 listchars+=tab:>-

" erlang
autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf erlang

" vimwiki
autocmd Filetype vimwiki set expandtab tabstop=4 softtabstop=0 shiftwidth=4 listchars+=tab:>- textwidth=80 wrap linebreak nolist

" golang
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_arary_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_string_spellcheck = 0
let g:go_highlight_format_strings = 0
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0

let g:go_auto_type_info = 1
let updatetime=100

" always use quickfix instead over location lists
let g:go_list_type = "quickfix"

" quickfix next, prev, close
map <C-n> :cnext<CR>
map <C-p> :cprev<CR>
noremap <leader>a :cclose<CR>


" automatically insert import paths
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {'goimports': '-local=do'}

" gofmt -s (simplify)
"let g:go_fmt_command = "gofmt"
"let g:go_fmt_options = "-s"

" show a list of interfaces implemented by type under cursor
autocmd Filetype go nmap <Leader>s <Plug>(go-implements)

" show godoc (vertically) for word under cursor
autocmd Filetype go nmap <Leader>gd <Plug>(go-doc-vertical)

" show godoc in the browser for word under cursor
autocmd Filetype go nmap <Leader>gb <Plug>(go-doc-vertical)

" open target identifier in new vsplit
autocmd Filetype go nmap <Leader>gv <Plug>(go-def-vertical)

" go-build
autocmd Filetype go nmap <leader>b <Plug>(go-build)

" go-test
autocmd Filetype go nmap <leader>t <Plug>(go-test)

" go-coverage
autocmd Filetype go nmap <leader>c <Plug>(go-coverage-toggle)

" kernel development
let g:linuxsty_patterns = [ "/usr/src/", "/linux", "/home/ben/code/linux" ]

" completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/home/ben/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/ben/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#go#unimported_packages=1
" prevent completion from opening in scratch window 
set completeopt-=preview

" ctags
set tags=tags;$HOME
