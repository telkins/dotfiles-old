" Some neat options
set nocompatible                " Use Vim defaults (much better!)
set noswapfile
set nobackup
set viminfo='1000,f1,\"250

" Use pathogen to easily modify the runtime path to include all plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

" change the <Esc> to fj
imap fj <Esc>

" wild mode
set wildmode=full
set wildmenu

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hide buffers instead of closing them
set hidden

" No arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Better handling of wrapped lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remove search highlights
nmap <silent> ,/ :nohlsearch<CR>

" Forgot to sudo eh?
cmap w!! w !sudo tee % >/dev/null

" set colorscheme
"colorscheme phphaxor
colorscheme native

" Tabs to Spaces
:set expandtab

" Fix Pasting
set noai

" statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2

" Man Pages
set keywordprg=pman

" PDV - phpDocumentor for Vim
source ~/.vim/plugin/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

" Line numbers
:set number " turn on line numbering
" :set nonumber " turn off line numbering

" taglist
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1

" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1

" discourages use oh short tags. c'mon its deprecated remember
autocmd FileType php let php_noShortTags=1

" automagically folds functions & methods. this is getting IDE-like isn't it?
" autocmd FileType php let php_folding=1

" set auto-highlighting of matching brackets for php only
autocmd FileType php DoMatchParen
autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Languages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" auto switch to folder where editing file
autocmd BufEnter * cd %:p:h

" set "make" command when editing php files -- :make %
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l


" General settings for other scripts that can't be defined as part of the
" general file loading stuff.
let java_allow_cpp_keywords=1
let java_highlight_functions="style"
let java_highlight_java_lang=1
" let java_space_errors=1
let java_highlight_debug=1
let java_highlight_functions=1

" Broken ass linux terminal
if $OSTYPE == "linux"
	set t_kb=
	fixdel
endif

" :set bg=dark
" if has("gui_running")
if has("gui")
	hi Normal guifg=white guibg=black
endif

" What to display in list mode
set listchars=tab:>-,trail:-,eol:$
nmap <silent> <leader>s :set nolist!<CR>

syntax on

set wildmenu

set ignorecase
set smartcase

" This is nice, but leaves a really stupid title when you close vim.
" set title

set ruler
set ts=4

" wrapmargin is deprecated in favor of textwidth
" set textwidth=79
" set wm=5
set shiftwidth=4
set sm

" Lots of buffers
set hid

" Stuff to gignore
set wildignore=*.o,*.obj,*.bak,*.exe,*.class

" Neat things for searching patterns
set incsearch
set hlsearch

"set dir=~/tmp

" :au BufNewFile,BufReadPost *.inc set syntax=html
au BufNewFile,BufReadPost *.xtp setlocal filetype=jsp
au BufNewFile,BufReadPost *.nqc setlocal filetype=c
au BufNewFile,BufReadPost *.xsl setlocal filetype=xml
au BufNewFile,BufReadPost *.zul setlocal filetype=xml
" :au BufNewFile,BufReadPost *.xinc setlocal syntax=xml
au BufNewFile,BufReadPost *.mocha setlocal filetype=java
au BufNewFile,BufReadPost *.ojava setlocal filetype=java
au BufNewFile,BufReadPost *.jad setlocal filetype=java
au BufNewFile,BufReadPost *.tld setlocal filetype=xml
au BufNewFile,BufReadPost *.spt setlocal filetype=sql
au BufNewFile,BufReadPost *.hrl setlocal filetype=erlang

" Python and jython stuff.  I'm going to go ahead and uses spaces in python
au BufNewFile,BufReadPost *.jy setlocal filetype=python expandtab
au BufNewFile,BufReadPost *.tac setlocal filetype=python expandtab
au BufNewFile,BufReadPost *.py setlocal expandtab
au BufNewFile,BufReadPost *.rb setlocal expandtab ts=2
au BufNewFile,BufReadPost *.rake setlocal expandtab ts=2

" Scheme stuff
au BufNewFile,BufReadPost *.scm setlocal lisp

" OCaml
au BufNewFile *.mli call LoadTemplate("ml")

" Compliance with coding standards.
au BufNewFile,BufReadPost *.jsp  setlocal ts=2
au BufNewFile,BufReadPost *.html  setlocal ts=2
au BufNewFile,BufReadPost *.xml  setlocal ts=2

" Get rid of that stupid control a thing.
imap <C-A> <ESC>a

set encoding=utf-8

" ------------------------------
" Neat tricks:
" ------------------------------

" Find ctags
if filereadable("/usr/local/bin/ctags")
	let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
else
	let Tlist_Ctags_Cmd = 'ctags'
endif
"so ~/.vim/scripts/taglist.vim
