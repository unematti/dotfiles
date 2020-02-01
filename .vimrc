set nocompatible              " required
filetype off                  " required

" set up powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" Powerline
set rtp+=/usr/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours) 
set t_Co=256
let g:Powerline_symbols = "fancy"








set number
set relativenumber
set encoding=utf-8
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set splitbelow
set splitright
set incsearch

"set colors
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here') 

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Enable folding
set foldmethod=indent
set foldlevel=99
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
filetype plugin indent on    " required
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

call togglebg#map("<F5>")
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

"autocommands
"
au BufNewFile, BufRead *.py
    \ set tabstop=4     | 
    \ set softtabstop=4 | 
    \ set shiftwidth=4  | 
    \ set textwidth=79  | 
    \ set expandtab     | 
    \ set autoindent    | 
    \ set fileformat=unix
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
