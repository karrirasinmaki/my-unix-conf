set fileencodings=utf-8
let mapleader=","

" Normalize backspace
set backspace=2

set nocompatible              " be iMproved, required
filetype off                  " required

" Indenting defaults
" set tabstop=4 shiftwidth=4
set tabstop=4
set shiftwidth=4

""
" Wundle
"

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
Plugin 'tfnico/vim-gradle'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" language tools
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'kristijanhusak/vim-js-file-import'
" Plugin 'ervandew/eclim'
" useful tools for everyday vim use
Plugin 'scrooloose/nerdTree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-sleuth.git' " indention
Plugin 'wakatime/vim-wakatime' " time tracking
" Themes
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" ---
" /Wundle
""

" Enable fzf
set rtp+=~/.fzf

set autoindent
filetype plugin indent on

" Java
let g:JavaComplete_GradleExecutable = getcwd() . '/gradlew'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Config vim-sleuth
let g:SleuthDefaultWidth = 4

au BufNewFile,BufRead *.ejs set filetype=html

set gfn=Monaco:h13
set clipboard=unnamedplus

set number " line numbers

" smartcase search, ignore case only if search
" does not include uppercase letters
set ignorecase
set smartcase

" theme
syntax on
" colorscheme vimbrains
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'medium'

" wild
set wildmode=longest:list,full
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

set mouse=a

set updatetime=500

set hlsearch

" highlight extra whitespace
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

" Convert \uXXXX strings to UTF characters
if !exists('UtfDecode')
  function! UtfDecode()
    %s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g
  endfunction
endif

if !exists(':Utfdecode')
    command Utfdecode call UtfDecode()
endif


" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>% :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>%p :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>%t :let @+=expand("%:t")<CR>
  
  " relative path to directory (/something/src)
  nnoremap <leader>%h :let @+=expand("%:h")<CR>

  " absolute path to directory (/something/src)
  nnoremap <leader>%ph :let @+=expand("%:p:h")<CR>
endif

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

