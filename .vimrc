set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)

Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" basic settings
syntax on
set background=dark
set encoding=utf-8
set ic
set mouse=n
set backspace=indent,eol,start

" file specific settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set smarttab |
    \ set smartindent |
    \ set autoindent |
    \ set fileformat=unix |

" au BufNewFile,BufRead *.js, *.jsx, *.html, *.css
"     \ set tabstop=2 |
"     \ set softtabstop=2 |
"     \ set shiftwidth=2 |
"     \ set textwidth=120 |
"     \ set expandtab |
"     \ set smarttab |

cd ~/dev/spx/
let mapleader = ";"
let python_highlight_all=1

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" save/write shortcuts
nnoremap <leader>s :w<cr>
nnoremap <leader>z :x<cr>
nnoremap <leader>q :q<cr>
map <F5> :checktime<cr>
map! <F5> <C-O>:checktime<cr>

" plugin configuration
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 0
let g:ag_working_path_mode="r"
let g:jedi#use_splits_not_buffers = "right"

" NERDTree toggle shortcut
map <C-n> :NERDTreeToggle ~/dev/spx/webui<CR>

" open NERDTree on startup if no file is specified
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

" close VIM if NERDTree is the only window left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" remember cursor position on file open
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
