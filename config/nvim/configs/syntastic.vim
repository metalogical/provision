let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        Errors " Nothing was closed, open syntastic error location panel
    endif
endfunction

nnoremap <silent> <Leader>s :<C-u>call ToggleErrors()<CR> " s for syntastic

if exists('g:opamshare') " if opam is installed; TODO check for merlin
  let g:syntastic_ocaml_checkers = ['merlin']
endif
