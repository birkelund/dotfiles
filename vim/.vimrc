set nocompatible
scriptencoding utf-8

syntax on
filetype plugin indent on

set title
set ruler
set number
set showcmd
set showmatch
set lazyredraw

set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start

set smartcase
set incsearch
set hlsearch

set nofoldenable
set background=dark

let mapleader=","

" don't leave visual mode when indenting
vnoremap > >gv
vnoremap < <gv

if has('statusline')
	set laststatus=2 " always display a status line in the last window

	set statusline=%<%f
	set statusline+=%w%h%m%r
	set statusline+=\ [%{&ff}/%Y]
	set statusline+=\ [%{getcwd()}]
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

" move to last position of previous session
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif

" highlight trailing whitespace
highlight TrailingWhitespace ctermbg=196 guibg=red
match TrailingWhitespace /\s\+$/
