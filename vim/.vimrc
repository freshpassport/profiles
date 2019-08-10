" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" git clone https://github.com/morhetz/gruvbox.git
" mkdir ~/.vim/colors
" cp colors/gruvbox.vim ~/.vim/colors

set nocompatible              " be iMproved, required
filetype off                  " required

let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'gilligan/vim-lldb'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'matchit.zip'
Bundle 'TagBar'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'dracula/vim'
Plugin 'jacoborus/tender.vim'
Plugin 'Badacadabra/vim-archery'
Plugin 'tpope/vim-sensible'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree.git'
Plugin 'zxqfl/tabnine-vim'

"let g:gruvbox_contrast_dark='hard'
"Plugin 'morhetz/gruvbox'

"if has("termguicolors")
"    " fix bug for vim
"    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " enable true color
"    set termguicolors
"endif

let g:seoul256_background = 233
Plugin 'junegunn/seoul256.vim'

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
set colorcolumn=81
set mouse=
set cursorline
set hlsearch

"colorscheme molokai
syntax on
set fencs=utf-8

" 记住文件最后的编辑位置
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

set t_8b=[[48;2;%lu;%lu;%lum
set t_8f=[[38;2;%lu;%lu;%lum

" ---------- 插件参数 ----------

"colorscheme gruvbox
"colorscheme seoul256
"set background=dark
"set background=light
"let g:gruvbox_bold=1

"colorscheme one-dark
colorscheme afterglow

"let g:alduin_Shout_Dragon_Aspect = 1
"colorscheme alduin

"set background=light
"set background=dark
"colorscheme PaperColor
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

"colorscheme dracula

"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

"syntax on
"color dracula

" If you have vim >=8.0 or Neovim >= 0.1.5
"if (has("termguicolors"))
"  set termguicolors
"endif

"syntax enable
"colorscheme tender
"let g:airline_theme = 'tender'

" airline
"let g:airline_theme="gruvbox"
let g:airline_theme = 'archery'
"let g:airline_powerline_fonts=1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" vim-go
let g:go_def_mode = 'gopls'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"vim-lldb
let g:lldb_map_Lstart="<F5>"
let g:lldb_map_Lcontinue="<F6>"
let g:lldb_map_Lbreakpoint="<F9>"
let g:lldb_map_Lnext="<F10>"
let g:lldb_map_Lstepin="<F11>"

"vim-airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_exclude_filename = []
let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=0
let Powerline_symbols='fancy'
let g:bufferline_echo=0
set laststatus=2
set t_Co=256

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"tab
function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction
       
function! TabPos_Initialize() 
for i in range(1, 9)
        exe "map <C-" . i . "> :call TabPos_ActivateBuffer(". i . ")<CR>"
    endfor
    exe "map <C-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction
 
autocmd VimEnter * call TabPos_Initialize()

:nn <C-1> 1gt
