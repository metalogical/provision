" *** Functions
function SetTabs(spaces)
    set expandtab
    let &tabstop=a:spaces
    let &shiftwidth=a:spaces
    let &softtabstop=a:spaces
    set autoindent
endfunction

" *** Configure leaders -- keep this before loading configs
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" *** Load plugins
runtime! configs/options.vim
if len(g:loaded_plugins)
  set nocompatible
  filetype off
  set rtp+=~/.config/nvim/bundle/Vundle.vim
  call vundle#begin('~/.config/nvim/bundle')

  " load vundle
  Plugin 'VundleVim/Vundle.vim'

  " load plugins
  for plug in g:loaded_plugins
    Plugin plug
  endfor

  call vundle#end()
endif


" *** Sanity
call SetTabs(4)
syntax on
filetype on
filetype plugin indent on
set number
set rnu
set background=dark
set backspace=2 " make backspace not absolutely terrible
tnoremap <Esc> <C-\><C-n> " neovim terminal mode escape
set viminfo='10,\"100,n~/.config/nvim/.viminfo


" *** Buffers navigation
set hidden " allow hiding modified buffers without saving
let g:netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl'
nnoremap <silent> <Leader>be :Explore<CR>
nnoremap <silent> <Leader>bo :Explore<CR>
nnoremap <silent> <Leader>bq :lclose<CR>:bw<CR>
nnoremap <silent> <Leader>bw :w<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprev<CR>


" *** Mouse events
set ttyfast
set mouse=a
if !has('nvim')
    set ttymouse=xterm2 " Works with iTerm2
endif


" *** Save cursor location on exit; depends on viminfo
function! ResCur()
  " '" = last position in file, check that it's within range, and jump
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  " remove all autocmds for this group (idempotence)
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" *** statusline
set laststatus=2
if ! has('gui_running') " Speed up change in status bar when hitting escape
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif


" *** Load optional configs
for conf_name in g:loaded_configs
  exec "runtime! configs/" . conf_name . ".vim"
endfor
