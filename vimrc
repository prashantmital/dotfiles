" ------------------- Leader ------------------
let mapleader=","

" ------------------- Vundle ------------------
" -- prepare VIm for Vundle
set nocompatible			" turn off vi compatibility so that plugins can work
filetype off				" turn off auto file-type detection
set rtp+=~/.vim/bundle/Vundle.vim 	" set runtime path to include Vundle
call vundle#begin()			" initialize Vundle
Plugin 'VundleVim/Vundle.vim'		" let Vundle manage itself

" -- add all plugins here
"Plugin 'Valloric/YouCompleteMe'		" Auto-completion [DISABLED]
Plugin 'nvie/vim-flake8'			" Flake8 de-linter
Plugin 'altercation/vim-colors-solarized'	" Solarized colorscheme
Plugin 'ctrlpvim/ctrlp.vim'			" Fuzze go-anywhere utility
Plugin 'tpope/vim-fugitive'			" Git integration
Plugin 'tpope/vim-rhubarb'          		" GitHub integration
Plugin 'airblade/vim-gitgutter'     		" Show git information in gutter
Plugin 'tmhedberg/SimpylFold'			" Pythonic code-folding
Plugin 'vim-scripts/indentpython.vim'		" PEP8 compliant indentation
Plugin 'vim-airline/vim-airline'		" Statusbar vim-airline
Plugin 'vim-airline/vim-airline-themes'		" Themes for vim-airline
Plugin 'scrooloose/nerdtree'			" File browser
Plugin 'tmux-plugins/vim-tmux'			" Plugin for editing tmux.conf

" -- finalize Vundle setup
call vundle#end()
filetype plugin indent on

" -- YouCompleteMe plugin customizations
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command='new-or-existing-tab'
map <leader>g :YcmCompleter GoTo<CR>

" -- Solarized colorscheme customizations
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

" -- SimpylFold plugin customization
let g:SimpylFold_docstring_preview=1

" -- Airline settings
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" -- Flake8 settings
autocmd BufWritePost *.py,*.pyx call Flake8()			" run Flake8 whenever a python file is saved
let g:flake8_show_in_gutter=1  					" show Flake8 errors in gutter
let flake8_error_marker='>>'     				" set error marker to '>>'
let g:flake8_warning_marker='WW'   				" set warning marker to 'WW'
let g:flake8_pyflake_marker='EE'     				" set PyFlakes marker to 'EE'
let g:flake8_complexity_marker='CC'  				" set complexity warnings to 'CC'
let g:flake8_naming_marker='XX'      				" set naming marker to 'XX'

" -- NERDTree settings
let NERDTreeShowHidden=1                                                        " show hidden files
let NERDTreeIgnore=['\.pyc$', '\~$']											" ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1											" open NERDTree when vim startsup and no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif						" open NERDTree when vim startsup and no files were specified
map <C-n> :NERDTreeToggle<CR>												" open NERDTree with Ctrl-N
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 		" Close Vim if the only window left open is NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif						" Close Vim if the only window left open is NERDTree

" -- brief Vundle help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" --------------- User Settings ---------------
" -- always show statusline, tabline and hide default vim info readout
set laststatus=2
set showtabline=2
set noshowmode

" -- turn on mouse functionality
set mouse=a

" -- show invisibles using `:set list` command
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" -- search options
set ignorecase		" make searching case sensitive
set smartcase		" searches are case sensitive when search string has a capital letter

" -- sensible backspace
set backspace=indent,eol,start		" make backspace behave normally

" -- split panes 
set splitbelow				" set splits to show up on the bottom 
set splitright				" set splits to show up on the right
nnoremap <C-J> <C-W><C-J>		" remap pane navigation
nnoremap <C-K> <C-W><C-K>		" remap pane navigation
nnoremap <C-L> <C-W><C-L>		" remap pane navigation
nnoremap <C-H> <C-W><C-H>		" remap pane navigation

" -- code folding
nnoremap <space> za			" toggle code folding with space bar

" -- ensure PEP8-compliant indention in files with the specified extensions
au BufNewFile,BufRead *.py,*.pyx
    \ set tabstop=4		|
    \ set softtabstop=4		| 
    \ set shiftwidth=4		|
    \ set textwidth=79		|
    \ set expandtab		|
    \ set autoindent		|
    \ set fileformat=unix	|
    \ set encoding=utf-8	" use UTF8 encoding

" -- highlight extraneous whitespace in red in files with the specified extensions
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h 
    \ match BadWhitespace /\s\+$/

" -- syntax highlighting for Python
let python_highlight_all=1

" -- enable line numbers
set nu
