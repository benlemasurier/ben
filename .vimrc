" requires vundle to manage plugins: http://github.com/gmarik/vundle
" requires vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin(stdpath('data') . '/plugged')
Plug 'benlemasurier/cscope-maps'
Plug 'bruno-/vim-man'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'uarun/vim-protobuf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-perl/vim-perl'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'vivien/vim-linux-coding-style'
call plug#end()

" set terminal title to filename
set title

" enable mouse use
set mouse=a

" leader key = ,
let mapleader=","

" auto-save on build
set autowrite

" syntax highlighting
syntax on
set background=dark
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
set scrolloff=8 " Start scrolling 8 lines from margin
set sidescrolloff=15
set sidescroll=1

" show the nasties
set list
set listchars=trail:·     " trailing spaces
set listchars+=tab:\ \    " tabs (don't show them)
set listchars+=extends:#  " line wrap
set listchars+=nbsp:.     " non-breaking spaces

" make the quickfix readable
hi QuickFixLine ctermbg=NONE

" respect modelines
set modeline

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

" completion search
" - current buffer
" - buffers in other windows
" - other loaded buffers
" - unloaded buffers
" - tags
" - included files
" - dictionary when spellcheck is enabled
set complete=.,w,b,u,t,i,kspell

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
autocmd Filetype markdown setlocal spell textwidth=80

autocmd Filetype mail set tw=72 fo=watqc cc=+1 spell nojs nosmartindent
" (mail) mark trailing spaces showing flowed format correctness
autocmd Filetype mail match ErrorMsg '\s\+$'

" ruby: no tabs, 2 spaces for indent
autocmd Filetype ruby set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-

" yaml: no tabs, 2 spaces for indent
autocmd Filetype yaml set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-

" javascript: no tabs, 2 spaces for indent
autocmd Filetype javascript set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-
autocmd Filetype json set expandtab tabstop=2 softtabstop=2 shiftwidth=2 listchars+=tab:>-

" html: no tabs, 2 spaces for indent
autocmd Filetype html set expandtab tabstop=2 softtabstop=0 shiftwidth=2 listchars+=tab:>-
autocmd Filetype css set expandtab tabstop=2 softtabstop=2 shiftwidth=2 listchars+=tab:>-

" haskell, no tabs, 4 spaces for indent
autocmd Filetype haskell set expandtab tabstop=4 softtabstop=4 shiftwidth=4 listchars+=tab:>-

" bash: no tabs, 4 spaces for indent
autocmd Filetype sh set expandtab tabstop=4 softtabstop=0 shiftwidth=4 listchars+=tab:>-

" sql: no tabs, 4 spaces for indent
autocmd Filetype sql set expandtab tabstop=4 softtabstop=0 shiftwidth=4 listchars+=tab:>-

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

" location-list navigation
"map <C-j> :lnext<CR>
"map <C-k> :lprev<CR>
noremap <leader>s :lclose<CR>

" automatically insert import paths
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {'goimports': '-local=do'}

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

" ansible + syntastic
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

" ctags
set tags=tags;$HOME

" prevent completion from opening in scratch window 
set completeopt-=preview

" syntax checking (syntastic)
" enable/disable syntastic integration for vim-airline
let g:airline#extensions#syntastic#enabled = 1
" syntastic error_symbol >
let airline#extensions#syntastic#error_symbol = 'E:'
" syntastic statusline error format (see |syntastic_stl_format|) >
let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
" syntastic warning >
let airline#extensions#syntastic#warning_symbol = 'W:'
" syntastic statusline warning format (see |syntastic_stl_format|) >
let airline#extensions#syntastic#stl_format_warn = '%W{[%w(#%fw)]}'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" rust
" cargo build
autocmd Filetype rust nmap <leader>b :Cbuild<CR>
autocmd Filetype rust nmap <leader>t :RustTest!<CR>
