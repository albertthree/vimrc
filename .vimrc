set nocompatible              " required
filetype off                  " required

set shell=/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)

Plugin 'Valloric/YouCompleteMe'
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
Plugin 'w0rp/ale'

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

cd /j/jarvis/
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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ag_working_path_mode="r"
let g:jedi#use_splits_not_buffers = "right"
let g:jsx_ext_required = 0

" NERDTree toggle shortcut
map <C-n> :NERDTreeToggle /j/jarvis<CR>

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

" turn on search highlighting
:set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_change_sign_column_color = 1
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
