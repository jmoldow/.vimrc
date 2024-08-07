" $VIMRUNTIME refers to the versioned system directory where Vim stores its
" system runtime files -- /usr/share/vim/vim<version>.
"
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
"
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
"
" If you would rather _use_ default.vim's settings, but have the system or
" user vimrc override its settings, then uncomment the line below.
" source $VIMRUNTIME/defaults.vim
runtime! defaults.vim

" All Debian-specific settings are defined in $VIMRUNTIME/debian.vim and
" sourced by the call to :runtime you can find below.  If you wish to change
" any of those settings, you should do it in this file or
" /etc/vim/vimrc.local, since debian.vim will be overwritten everytime an
" upgrade of the vim packages is performed. It is recommended to make changes
" after sourcing debian.vim so your settings take precedence.

runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax enable
set ruler

packadd! editexisting
packadd! shellmenu
packadd! matchit

packadd! sensible
packadd! vim-fugitive
packadd! gitgutter

let g:ale_echo_cursor = 1
let g:ale_cursor_detail = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_virtualtext_cursor = 1
let g:ale_set_balloons = 1
let g:ale_close_preview_on_insert = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_sign_highlight_linenrs = 1
let g:ale_enabled = 0
let g:ale_enabled = 1
packadd! ale
let g:ale_enabled = 0
let g:ale_enabled = 1

let g:ale_linters = {
\   'go': ['gofmt', 'golint', 'gopls', 'govet', 'gobuild'],
\   'json': ['jsonlint', 'spectral', 'vscodejson', 'jq'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'gofumpt', 'goimports', 'golines'],
\   'json': ['jq'],
\   'proto': ['buf-format', 'protolint'],
\   'markdown': ['dprint', 'prettier', 'remark-lint', 'textlint'],
\}

packadd! vim-flagship
set laststatus=2
set showtabline=2
set guioptions-=e

packadd! vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_statusline_ontop=1

" start with no search highlighting
set viminfo^=h
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" From $GOROOT/misc/vim/readme.txt
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Wrap gitcommit files to 64 characters instead of 80.
" It should be 72, but 64 works better with gerrit, and isn't too restrictive.
if has("autocmd")
  autocmd Filetype gitcommit setlocal textwidth=64
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
" set ignorecase		" Do case insensitive matching
" set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


set pastetoggle=<F2>
set tabstop=2 shiftwidth=2 expandtab
set textwidth=120

let g:jsonnet_fmt_options = '--in-place --indent 4 --string-style d'

" https://github.com/tpope/vim-pathogen
" Not needed anymore, packaging is built into modern Vim
"execute pathogen#infect()
