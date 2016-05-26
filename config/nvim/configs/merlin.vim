let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
if exists('g:load_syntastic')
  let g:syntastic_ocaml_checkers = ['merlin']
endif
