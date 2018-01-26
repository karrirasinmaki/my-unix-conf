set fileencodings=utf-8
let mapleader=","

" Normalize backspace
set backspace=2

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'groenewege/vim-less'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdTree'
Plugin 'derekwyatt/vim-scala'
Plugin 'othree/html5.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/eclim'
Plugin 'matchit.zip'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'

" All of your Plugins must be added before the following line
call vundle#end()            " required

au BufNewFile,BufRead *.ejs set filetype=html

set gfn=Monaco:h13
set clipboard=unnamedplus

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent
set smartindent
set cindent
filetype plugin indent on

set ignorecase
set smartcase
set number

syntax on
colorscheme vimbrains

set tags=.tags

set wildmode=longest:list,full
set wildmenu

set mouse=a

set updatetime=500

set hlsearch

highlight ExtraWhitespace ctermbg=gray guibg=gray
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Always use magic when searching
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" F3 to jump to definition (remap ctag default)
noremap <F3> <C-]>

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

