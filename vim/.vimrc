" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" git clone https://github.com/morhetz/gruvbox.git
" mkdir ~/.vim/colors
" cp colors/gruvbox.vim ~/.vim/colors

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'matchit.zip'
Bundle 'TagBar'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'

let g:gruvbox_contrast_dark='hard'
Plugin 'morhetz/gruvbox'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

" ---------- 基础配置 ----------
set number
set ts=4
set bs=2
set shiftwidth=4
set tabstop=4
set expandtab
set colorcolumn=80
set mouse=
set cursorline

"colorscheme molokai
syntax on
set fencs=utf-8

" 记住文件最后的编辑位置
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" ---------- 插件参数 ----------

" gruvbox
colorscheme gruvbox
set background=dark
let g:gruvbox_bold=1

" airline
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts=1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
