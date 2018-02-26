set fileencodings=utf-8
let mapleader=","

" Normalize backspace
set backspace=2

set nocompatible              " be iMproved, required
filetype off                  " required

" Indenting defaults
" set tabstop=4 shiftwidth=4

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" language extensions
Plugin 'groenewege/vim-less'
Plugin 'derekwyatt/vim-scala'
Plugin 'leafgarland/typescript-vim'
Plugin 'othree/html5.vim'
" language tools
Plugin 'iamcco/markdown-preview.vim'
Plugin 'ervandew/eclim'
" useful tools for everyday vim use
Plugin 'scrooloose/nerdTree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'tpope/vim-fugitive' " git wrapper
" Plugin 'ciaranm/detectindent' " indention
Plugin 'tpope/vim-sleuth.git' " indention
Plugin 'wakatime/vim-wakatime' " time tracking

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Enable fzf
set rtp+=~/.fzf

set autoindent
filetype plugin indent on

" Config detectindent
" let g:detectindent_preferred_expandtab = 0
" let g:detectindent_preferred_indent = 4
" autocmd BufReadPost * :DetectIndent 
let g:SleuthDefaultWidth = 4

au BufNewFile,BufRead *.ejs set filetype=html

set gfn=Monaco:h13
set clipboard=unnamedplus

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
if !exists('*ToggleWrap')
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
endif
