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

" buffer management; REQUIRES fzf, fzf.vim
set hidden  " allow switching away from unsaved buffers
nnoremap <silent> <Leader>bo :Files<CR>
nnoremap <silent> <Leader>be :Explore<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>bw :bw<CR>
nnoremap <silent> <Leader>bl :set buflisted<CR>

" latex-unicoder
let g:unicoder_cancel_insert = 1
inoremap <C-l> <Esc>:call unicoder#start(1)<CR>

" windowing
set splitright
set splitbelow
nnoremap <silent> <m-CR> :split<CR>
nnoremap <silent> <m-q> :wincmd q<CR>
  " depend on vim-tmux-navigator plugin
nnoremap <silent> <m-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <m-j> :TmuxNavigateDown<CR>
nnoremap <silent> <m-k> :TmuxNavigateUp<CR>
nnoremap <silent> <m-l> :TmuxNavigateRight<CR>
  " rotation and movement
nnoremap <silent> <m-R> :wincmd R<CR>
nnoremap <silent> <m-r> :wincmd r<CR>
nnoremap <silent> <m-H> :wincmd H<CR>
nnoremap <silent> <m-J> :wincmd J<CR>
nnoremap <silent> <m-K> :wincmd K<CR>
nnoremap <silent> <m-L> :wincmd L<CR>
  " terminal
tnoremap <m-[> <C-\><C-n>
tnoremap <silent> <m-CR> <C-\><C-n>:split<CR>
tnoremap <silent> <m-q> <C-\><C-n>:wincmd q<CR>
tnoremap <silent> <m-h> <C-\><C-n>:wincmd h<CR>
tnoremap <silent> <m-j> <C-\><C-n>:wincmd j<CR>
tnoremap <silent> <m-k> <C-\><C-n>:wincmd k<CR>
tnoremap <silent> <m-l> <C-\><C-n>:wincmd l<CR>
tnoremap <silent> <m-R> <C-\><C-n>:wincmd R<CR>
tnoremap <silent> <m-r> <C-\><C-n>:wincmd r<CR>
tnoremap <silent> <m-H> <C-\><C-n>:wincmd H<CR>
tnoremap <silent> <m-J> <C-\><C-n>:wincmd J<CR>
tnoremap <silent> <m-K> <C-\><C-n>:wincmd K<CR>
tnoremap <silent> <m-L> <C-\><C-n>:wincmd L<CR>
autocmd BufWinEnter,WinEnter term://* startinsert


" *** Sanity
call SetTabs(4)
syntax on
filetype on
filetype plugin indent on
set number
set rnu
set background=dark
set backspace=2 " make backspace not absolutely terrible
set viminfo='10,\"100,n~/.config/nvim/.viminfo
" set clipboard^=unnamed " synchronize unnamed register with system clipboard
  " display tabs & trailing spaces
set list
set listchars=tab:\|·,trail:·

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


" LSP stuff
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'lean': ['node', '/usr/local/lib/node_modules/lean-language-server/lib/index.js', '--stdio'],
    \ 'go': ['go-langserver'],
    \ 'python': ['pyls'],
    \ 'haskell': ['hie', '--lsp'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }
nnoremap <silent> <Leader>gi :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Leader>gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <Leader>gd :call LanguageClient_textDocument_definition()<CR>

let g:gofmt_exe = 'goimports'
let g:deoplete#enable_at_startup = 1

" add the byte offset to the end
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# :%3v:%o'

" *** Plugins
call plug#begin('~/.config/nvim/plugged')
" UX
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
 " delete buffer without closing window/split
Plug 'christoomey/vim-tmux-navigator'

" text entry
Plug 'joom/latex-unicoder.vim'

" Autocomplete stuff
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" languages
Plug 'leanprover/lean.vim'
Plug 'tweekmonster/gofmt.vim'
Plug 'idris-hackers/idris-vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'reasonml-editor/vim-reason-plus'

Plug 'tpope/vim-fugitive'
call plug#end()
